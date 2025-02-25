#!/usr/bin/env python3

import json
import os
from text2image import text_to_image

def generate_brs(input_files, output_file):

    word_number = 1

    with open(output_file, 'w', encoding="utf-8") as outfile:

        for chapter, input_file in input_files.items():

            outfile.write(f"function {chapter}_database() as Object\n")
            outfile.write(f"d = ")
            with open(input_file, 'r') as infile:

                data = json.load(infile)
                for word in data:
                    word["word_number"] = word_number
                    
                    # also generate an image of every word
                    dir = f"images/{chapter}"
                    print(f"Creating directory {dir} if it doesn't exist.")
                    os.makedirs(f"roku-app/{dir}", exist_ok=True)
                    word_image_path = f"{dir}/{word_number}.png"
                    word["image_path"] = f"pkg:/{word_image_path}"
                    (image_width, image_height) = text_to_image(word["word"], output_path=f"roku-app/{word_image_path}")
                    word["image_width"] = image_width
                    word["image_height"] = image_height
                    output_furigana_path = f"{dir}/furigana_{word_number}.png"
                    print(f"word: {word["word"]}")
                    (f_image_width, f_image_height) = text_to_image(word["furigana"], output_path=f"roku-app/{output_furigana_path}")
                    word["furigana_image_path"] = f"pkg:/{output_furigana_path}"
                    word["furigana_image_width"] = f_image_width
                    word["furigana_image_height"] = f_image_height
                    word_number += 1
                
                json.dump(data, outfile, ensure_ascii=False, indent=4)
            outfile.write(f"\nreturn d\n")
            outfile.write("end function\n")

input_files = {
    "Chapter1" : "data/n3/ch1.json",
    "Chapter2" : "data/n3/ch2.json",
    "Chapter3" : "data/n3/ch3.json",
    "Chapter4" : "data/n3/ch4.json",
    "N3Vocabulary" : "data/n3/vocabulary.json",
    "N4Vocabulary" : "data/n4/vocabulary.json",
}
output_file = 'roku-app/source/Vocabulary.brs'

generate_brs(input_files, output_file)

