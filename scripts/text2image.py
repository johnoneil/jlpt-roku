#!/usr/bin/env python3

from PIL import Image, ImageDraw, ImageFont
import os

BORDER_H = 10
BORDER_V = 10
STROKE_WIDTH = 1
BG_COLOR = (1, 1, 1, 0)
TEXT_COLOR = "white"

def text_to_image(input_text, output_path="output.png", font_size=80):

    # Try to load a font that supports Japanese characters
    try:
        # First try to use a common Japanese font if available
        font_path = "C:/Windows/Fonts/msgothic.ttc"  # Windows (MS Gothic)
        if not os.path.exists(font_path):
            # Try common Linux font
            #font_path = "/usr/share/fonts/truetype/noto/NotoSansCJK-Regular.ttc"
            font_path = "fonts/NotoSansJP-VariableFont_wght.ttf"
        if not os.path.exists(font_path):
            # Fallback to a default system font
            font = ImageFont.load_default()
        else:
            font = ImageFont.truetype(font_path, font_size)
    except:
        # Fallback if no suitable font is found
        font = ImageFont.load_default()
        print("Warning: Using default font - Japanese characters may not render correctly")

    # Create a temporary context to get the text width and height.
    # image_width=800, image_height=400
    tmp_image = Image.new('RGBA', (800, 400), color=BG_COLOR)
    tmp_draw = ImageDraw.Draw(tmp_image)
    text_bbox = tmp_draw.textbbox((0, 0), input_text, font=font, language="ja", stroke_width=STROKE_WIDTH)
    text_width = text_bbox[2] - text_bbox[0]
    text_height = text_bbox[3] - text_bbox[1]
    
    # # If text is too wide, wrap it or reduce font size
    # if text_width > image_width - 40:  # 40 pixels margin
    #     font_size = int(font_size * (image_width - 40) / text_width)
    #     font = ImageFont.truetype(font_path, font_size)
    #     text_bbox = draw.textbbox((0, 0), input_text, font=font)
    #     text_width = text_bbox[2] - text_bbox[0]
    #     text_height = text_bbox[3] - text_bbox[1]

    image_width = text_width + 2 * BORDER_H
    image_height = text_height + 2 * BORDER_V
    image = Image.new('RGBA', (image_width, image_height), color=BG_COLOR)
    draw = ImageDraw.Draw(image)

    # Center the text
    # x = (image_width - text_width) // 2
    # y = (image_height - text_height) // 2
    x = BORDER_H
    y = (image_height / 2) - (text_height)

    # Draw the text in black
    draw.text((x, y), input_text, font=font, fill=TEXT_COLOR, stroke_width=STROKE_WIDTH)

    # Save the image
    print(f"Saving to: {output_path}")
    image.save(output_path)
    print(f"Image saved as {output_path} {image_width}x{image_height}")
    return (image_width, image_height)

# Example usage
if __name__ == "__main__":
    # Test with both English and Japanese text
    sample_text = "Hello こんにちは World"
    text_to_image(sample_text, "output.png")
    
    # You can also use it with pure Japanese
    japanese_text = "日本の文化が大好きです"
    text_to_image(japanese_text, "japanese_output.png")