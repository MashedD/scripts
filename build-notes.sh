#!/usr/bin/env bash
set -Eeuo pipefail
NOTES_DIR="$HOME/Documents/notes"
SOURCE_DIR="$NOTES_DIR/source"
OUTPUT_DIR="$NOTES_DIR/html"
HEADER="$SOURCE_DIR/header.html"
FOOTER="$SOURCE_DIR/footer.html"

mkdir -p "$OUTPUT_DIR"
cp -f "$SOURCE_DIR/style.css" "$OUTPUT_DIR"

for md_file in "$NOTES_DIR"/*.md; do
    base_name=$(basename "$md_file" .md)

    if [[ "$base_name" == "temp"* || "$base_name" == "README.md" ]]; then
        echo "Skipping: $base_name"
        continue
    fi

    temp_html="$OUTPUT_DIR/$base_name.temp.html"
    pandoc "$md_file" -o "$temp_html" --lua-filter="$SOURCE_DIR/convert-links.lua" 

    output_file="$OUTPUT_DIR/$base_name.html"
    {
        cat "$HEADER"
        cat "$temp_html"
        cat "$FOOTER"
    } > "$output_file"

    rm "$temp_html"

    echo "Generated $output_file"
done

echo "All files processed. Output is in $OUTPUT_DIR"

