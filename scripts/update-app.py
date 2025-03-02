#!/usr/bin/env python3

import json
import os
from text2image import text_to_image

def get_word_list(infile):
    data = json.load(infile)
    if type(data) == list:
        # json is a pure array of word structures
        return data
    else:
        # json should have the word list tagged as a 'words' member
        return data["words"]

def generate_brs(input_files, output_file):

    word_number = 1

    with open(output_file, 'w', encoding="utf-8") as outfile:

        for chapter, input_file in input_files.items():

            outfile.write(f"function {chapter}_database() as Object\n")
            outfile.write(f"d = ")
            with open(input_file, 'r') as infile:

                word_list = get_word_list(infile)
                for word in word_list:
                    word["word_number"] = word_number
                    
                    # also generate an image of every word
                    dir = f"images/{chapter}"
                    os.makedirs(f"roku-app/{dir}", exist_ok=True)
                    word_image_path = f"{dir}/{word_number}.png"
                    word["image_path"] = f"pkg:/{word_image_path}"
                    (image_width, image_height) = text_to_image(word["word"], output_path=f"roku-app/{word_image_path}")
                    word["image_width"] = image_width
                    word["image_height"] = image_height
                    output_furigana_path = f"{dir}/furigana_{word_number}.png"
                    #print(f"word: {word["word"]}")
                    (f_image_width, f_image_height) = text_to_image(word["furigana"], output_path=f"roku-app/{output_furigana_path}")
                    word["furigana_image_path"] = f"pkg:/{output_furigana_path}"
                    word["furigana_image_width"] = f_image_width
                    word["furigana_image_height"] = f_image_height
                    word_number += 1
                
                json.dump(word_list, outfile, ensure_ascii=False, indent=4)
            outfile.write(f"\nreturn d\n")
            outfile.write("end function\n")

input_files = {
    "Chapter1Section1" : "data/n3/ch1/sec1.json",
    "Chapter1Section2" : "data/n3/ch1/sec2.json",
    "Chapter1Section3" : "data/n3/ch1/sec3.json",
    "Chapter1Section4" : "data/n3/ch1/sec4.json",
    "Chapter1Section5" : "data/n3/ch1/sec5.json",
    "Chapter2Section1" : "data/n3/ch2/sec1.json",
    "Chapter2Section2" : "data/n3/ch2/sec2.json",
    "Chapter2Section3" : "data/n3/ch2/sec3.json",
    "Chapter2Section4" : "data/n3/ch2/sec4.json",
    "Chapter2Section5" : "data/n3/ch2/sec5.json",
    "Chapter3Section1" : "data/n3/ch3/sec1.json",
    "Chapter3Section2" : "data/n3/ch3/sec2.json",
    "Chapter3Section3" : "data/n3/ch3/sec3.json",
    "Chapter3Section4" : "data/n3/ch3/sec4.json",
    "Chapter3Section5" : "data/n3/ch3/sec5.json",
    "Chapter4Section1" : "data/n3/ch4/sec1.json",
    "Chapter4Section2" : "data/n3/ch4/sec2.json",
    "Chapter4Section3" : "data/n3/ch4/sec3.json",
    "Chapter4Section4" : "data/n3/ch4/sec4.json",
    "Chapter4Section5" : "data/n3/ch4/sec5.json",
    "Chapter5Section1" : "data/n3/ch5/sec1.json",
    "Chapter5Section2" : "data/n3/ch5/sec2.json",
    "Chapter5Section3" : "data/n3/ch5/sec3.json",
    "Chapter5Section4" : "data/n3/ch5/sec4.json",
    "Chapter5Section5" : "data/n3/ch5/sec5.json",
    "Chapter6Section1" : "data/n3/ch6/sec1.json",
    "N3Vocabulary" : "data/n3/vocabulary.json",
    "N4Vocabulary" : "data/n4/vocabulary.json",
}
output_file = 'roku-app/source/Vocabulary.brs'

generate_brs(input_files, output_file)

