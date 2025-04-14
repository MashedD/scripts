#!/usr/bin/env python
from PIL import Image, ImageDraw


def generate_blue_wallpaper(width=1920, height=1080, line_color=(0, 0, 255), bg_color=(0, 0, 128)):
    img = Image.new("RGB", (width, height), bg_color)
    draw = ImageDraw.Draw(img)

    for y in range(0, height, 4):
        draw.line([(0, y), (width, y)], fill=line_color, width=2)

    img.save("/home/user/Pictures/Wallpapers/blue_wallpaper.png")


generate_blue_wallpaper()

