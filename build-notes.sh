#!/usr/bin/env bash
set -Eeuo pipefail
NOTES_DIR="$HOME/Documents/notes"
SOURCE_DIR="$NOTES_DIR/source"
OUTPUT_DIR="$NOTES_DIR/html"
HEADER="$SOURCE_DIR/header.html"
FOOTER="$SOURCE_DIR/footer.html"

# TODO: Add Subresource Integrity
# TODO: Add PGP

readonly PAGE_SIGNER="${PAGE_SIGNER:-$HOME/Projects/crypto1/webext-signed-pages/page-signer.js}"

#
# Utility Functions
#

is_external_url() { [[ "$1" =~ ^(http://|https://|//) ]]; }
normalize_path() { echo "${1//\/\///}"; } # Removes doubled slashes
calculate_hash() { openssl dgst -sha256 -binary "$1" | openssl base64 -A; }

#
# PGP Signature Functions
#

remove_signature() { sed -i '/<!--!/,/-->/d' "$1"; }
add_empty_signature() { sed -i 's|<html\([^>]*\)>|<!--!\n%%%SIGNED_PAGES_PGP_SIGNATURE%%%\n--><html\1>|' "$1"; }
fill_pgp_signature() { "$PAGE_SIGNER" "$1" "$1"; }
add_pgp_signature() {
    remove_signature "$1"
    add_empty_signature "$1"
    fill_pgp_signature "$1"
}

#
# Integrity Attribute Functions
#

add_integrity_attribute() {
    local page_path="$1" line="$2" target="$3"
    if ! is_external_url "$target"; then
        local file
        file="$(normalize_path "$OUTPUT_DIR/${target%\?*}")"
        # TODO: Code is duplicated, refactor
        if [ -f "$file" ]; then
            local hash
            hash=$(calculate_hash "$file")
            line="${line/ integrity=\"sha256-[^\"]*\"/}"
            line="${line/\"$target\"/\"$target\" integrity=\"sha256-$hash\"}"
        else
            file="$(normalize_path "$page_path/${target%\?*}")"
            if [ -f "$file" ]; then
                local hash
                hash=$(calculate_hash "$file")
                line="${line/ integrity=\"sha256-[^\"]*\"/}"
                line="${line/\"$target\"/\"$target\" integrity=\"sha256-$hash\"}"
            else
                echo "Error: Resource not found: $file" >&2
                exit 1
            fi
        fi
    fi
    echo "$line"
}

add_integrity_attributes() {
    local page="$1" temp_file="$2" page_path
    page_path="$(dirname "$page")"
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Check for <script src="..."> or <link href="..." rel="stylesheet|preload|modulepreload">
        if [[ $line =~ \<script[^\>]*src=\"([^\"]+)\" || \
              $line =~ \<link[^\>]*href=\"([^\"]+)\"[^\>]*rel=\"(stylesheet|preload|modulepreload)\" ]]; then
            line=$(add_integrity_attribute "$page_path" "$line" "${BASH_REMATCH[1]}")
        fi

        # Check for <link rel="stylesheet|preload|modulepreload" href="...">
        if [[ $line =~ \<link[^\>]*rel=\"(stylesheet|preload|modulepreload)\"[^\>]*href=\"([^\"]+)\" ]]; then
            line=$(add_integrity_attribute "$page_path" "$line" "${BASH_REMATCH[2]}")
        fi

        # XXX: Minor: There's a side effect of adding new-line to files that didn't had them
        printf '%s\n' "$line" >> "$temp_file"
    done < "$page"
}

#
# Main Execution
#

process_single_file() {
    local page="$1" temp_file
    temp_file="$(mktemp)"

    echo "Processing: $page"
    add_integrity_attributes "$page" "$temp_file"
    $HOME/Projects/crypto1/node_modules/.bin/html-minifier \
        --case-sensitive \
        --remove-empty-attributes \
        --keep-closing-slash \
        --remove-comments \
        --collapse-whitespace \
        $temp_file -o $temp_file
    add_pgp_signature "$temp_file"

    mv "$temp_file" "$page"
}

process_batch() {
    local page
    for page in "$@"; do
        process_single_file "$page"
    done
}

convert_md_to_html() {
    mkdir -p "$OUTPUT_DIR"
    cp -f "$SOURCE_DIR/style.css" "$OUTPUT_DIR"
    cp -f "$SOURCE_DIR/favicon.ico" "$OUTPUT_DIR"

    for md_file in "$NOTES_DIR"/*.md; do
        base_name=$(basename "$md_file" .md)

        if [[ "$base_name" == "temp"* || "$base_name" == "README.md" ]]; then
            echo "Skipping: $base_name"
            continue
        fi

        output_file="$OUTPUT_DIR/$base_name.html"
        pandoc "$md_file" -o "$output_file" \
            --lua-filter="$SOURCE_DIR/convert-links.lua" \
            --template="$SOURCE_DIR/custom-template.html" \
            --metadata title="$base_name"

        echo "Generated $output_file"
    done

    echo "All files processed. Output is in $OUTPUT_DIR"
}

main() {
    local files=() batch_size=1

    cd "$OUTPUT_DIR"
    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find . -type f -name '*.html' -print0)

    # Process files in parallel batches
    for ((i=0; i<${#files[@]}; i+=batch_size)); do
        process_batch "${files[@]:i:batch_size}"
    done
}

convert_md_to_html
main

