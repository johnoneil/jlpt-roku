#!/usr/bin/env python3

import json
import os
from text2image import text_to_image
# from loadyaml import load_yaml_to_array
import yaml

# get a vocabulary list from json data
def get_word_list(infile):
    data = json.load(infile)
    if type(data) == list:
        # json is a pure array of word structures
        return data
    else:
        # json should have the word list tagged as a 'words' member
        return data["words"]

# get a list of example chapters from grammar json
def get_chapter_list(infile):
    print(f"getting chapter list from file {infile}")
    data = json.load(infile)
    return data

def generate_vocabulary_brs(input_files, output_file):

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

# grammar is stored in YAML in a form like:
# 上げる:
#   pronunciation: あげる
#   meaning: to finish doing~
#   use:
#     - Verb (stem form) + あげる
#     - Verb (stem form) +  あがる
#   notes: >
#     Transitive verb: 上げる (ageru) to finish doing
#     Intransitive verb: 上がる (agaru) was finished
#   examples:
#     - j: 彼⼥は⼩説を書き上げた。
#       e: She finished writing her novel.

def chunk_list(input_list, chunk_size):
    """Splits a list into chunks of the specified size."""
    return [input_list[i:i + chunk_size] for i in range(0, len(input_list), chunk_size)]
   
def generate_grammar_brs(input_files, output_file):
    item_id = 1
    # form_id = 1
    example_id = 1
    # chapter_number = 1
    with open(output_file, 'w', encoding="utf-8") as outfile:
        for level, input_file in input_files.items():
            # items = load_yaml_to_array(input_file)
            # items = items[0]
            items = []
            dictionary = yaml.safe_load(open(input_file))
            for key in dictionary.keys():
                value = dictionary[key]
                value["name"] = key
                value["id"] = item_id
                items.append(value)
                item_id += 1

            # split the array into sections of equal length (as much as possible)
            sections = chunk_list(items, 25)

            for (section_id, section) in enumerate(sections):
                section_number = section_id + 1
                outfile.write(f"function {level}_Section{section_number}_database() as Object\n")
                outfile.write(f"d = ")
                for item in section:
                    print(f"{section_number} --> {item["name"]}:{item["meaning"]}")
                    id = item["id"]
                    name = item["name"]

                    # Generate an image of the grammatical form name. Image name is the id member.
                    dir = f"images/grammar/{level}/{section_number}/names"
                    os.makedirs(f"roku-app/{dir}", exist_ok=True)
                    phrase_image_path = f"{dir}/{id}.png"
                    item["image_path"] = f"pkg:/{phrase_image_path}"
                    (image_width, image_height) = text_to_image(name, output_path=f"roku-app/{phrase_image_path}")
                    item["image_width"] = image_width
                    item["image_height"] = image_height

                    # Generate an image of all japanese examples, each with a unique id
                    for example in item["examples"]:
                        j = example["j"]
                        example["id"] = example_id

                        dir = f"images/grammar/{level}/{section_number}/examples"
                        os.makedirs(f"roku-app/{dir}", exist_ok=True)
                        example_image_path = f"{dir}/{example_id}.png"
                        example["image_path"] = f"pkg:/{example_image_path}"
                        (image_width, image_height) = text_to_image(j, output_path=f"roku-app/{example_image_path}", font_size=60)
                        example["image_width"] = image_width
                        example["image_height"] = image_height

                        example_id += 1
                
                json.dump(section, outfile, ensure_ascii=False, indent=4)
                outfile.write(f"\nreturn d\n")
                outfile.write("end function\n\n")

input_files = {
    "Chapter1Section1" : "data/n3/2000WordsBook/ch1/sec1.json",
    "Chapter1Section2" : "data/n3/2000WordsBook/ch1/sec2.json",
    "Chapter1Section3" : "data/n3/2000WordsBook/ch1/sec3.json",
    "Chapter1Section4" : "data/n3/2000WordsBook/ch1/sec4.json",
    "Chapter1Section5" : "data/n3/2000WordsBook/ch1/sec5.json",
    "Chapter2Section1" : "data/n3/2000WordsBook/ch2/sec1.json",
    "Chapter2Section2" : "data/n3/2000WordsBook/ch2/sec2.json",
    "Chapter2Section3" : "data/n3/2000WordsBook/ch2/sec3.json",
    "Chapter2Section4" : "data/n3/2000WordsBook/ch2/sec4.json",
    "Chapter2Section5" : "data/n3/2000WordsBook/ch2/sec5.json",
    "Chapter3Section1" : "data/n3/2000WordsBook/ch3/sec1.json",
    "Chapter3Section2" : "data/n3/2000WordsBook/ch3/sec2.json",
    "Chapter3Section3" : "data/n3/2000WordsBook/ch3/sec3.json",
    "Chapter3Section4" : "data/n3/2000WordsBook/ch3/sec4.json",
    "Chapter3Section5" : "data/n3/2000WordsBook/ch3/sec5.json",
    "Chapter4Section1" : "data/n3/2000WordsBook/ch4/sec1.json",
    "Chapter4Section2" : "data/n3/2000WordsBook/ch4/sec2.json",
    "Chapter4Section3" : "data/n3/2000WordsBook/ch4/sec3.json",
    "Chapter4Section4" : "data/n3/2000WordsBook/ch4/sec4.json",
    "Chapter4Section5" : "data/n3/2000WordsBook/ch4/sec5.json",
    "Chapter5Section1" : "data/n3/2000WordsBook/ch5/sec1.json",
    "Chapter5Section2" : "data/n3/2000WordsBook/ch5/sec2.json",
    "Chapter5Section3" : "data/n3/2000WordsBook/ch5/sec3.json",
    "Chapter5Section4" : "data/n3/2000WordsBook/ch5/sec4.json",
    "Chapter5Section5" : "data/n3/2000WordsBook/ch5/sec5.json",
    "Chapter6Section1" : "data/n3/2000WordsBook/ch6/sec1.json",
    "Chapter6Section2" : "data/n3/2000WordsBook/ch6/sec2.json",
    "Chapter6Section3" : "data/n3/2000WordsBook/ch6/sec3.json",
    "Chapter6Section4" : "data/n3/2000WordsBook/ch6/sec4.json",
    "Chapter6Section5" : "data/n3/2000WordsBook/ch6/sec5.json",
    "Chapter7Section1" : "data/n3/2000WordsBook/ch7/sec1.json",
    "Chapter7Section2" : "data/n3/2000WordsBook/ch7/sec2.json",
    "Chapter7Section3" : "data/n3/2000WordsBook/ch7/sec3.json",
    "Chapter7Section4" : "data/n3/2000WordsBook/ch7/sec4.json",
    "Chapter7Section5" : "data/n3/2000WordsBook/ch7/sec5.json",
    "Chapter8Section1" : "data/n3/2000WordsBook/ch8/sec1.json",
    "Chapter8Section2" : "data/n3/2000WordsBook/ch8/sec2.json",
    "Chapter8Section3" : "data/n3/2000WordsBook/ch8/sec3.json",
    "Chapter8Section4" : "data/n3/2000WordsBook/ch8/sec4.json",
    "Chapter8Section5" : "data/n3/2000WordsBook/ch8/sec5.json",
    "Chapter9Section1" : "data/n3/2000WordsBook/ch9/sec1.json",
    "Chapter9Section2" : "data/n3/2000WordsBook/ch9/sec2.json",
    "Chapter9Section3" : "data/n3/2000WordsBook/ch9/sec3.json",
    "Chapter9Section4" : "data/n3/2000WordsBook/ch9/sec4.json",
    "Chapter9Section5" : "data/n3/2000WordsBook/ch9/sec5.json",
    "Chapter10Section1" : "data/n3/2000WordsBook/ch10/sec1.json",
    "Chapter10Section2" : "data/n3/2000WordsBook/ch10/sec2.json",
    "Chapter10Section3" : "data/n3/2000WordsBook/ch10/sec3.json",
    "Chapter10Section4" : "data/n3/2000WordsBook/ch10/sec4.json",
    "Chapter10Section5" : "data/n3/2000WordsBook/ch10/sec5.json",
    "Chapter11Section1" : "data/n3/2000WordsBook/ch11/sec1.json",
    "Chapter11Section2" : "data/n3/2000WordsBook/ch11/sec2.json",
    "Chapter11Section3" : "data/n3/2000WordsBook/ch11/sec3.json",
    "Chapter11Section4" : "data/n3/2000WordsBook/ch11/sec4.json",
    "Chapter11Section5" : "data/n3/2000WordsBook/ch11/sec5.json",
    "Chapter12Section1" : "data/n3/2000WordsBook/ch12/sec1.json",
    "Chapter12Section2" : "data/n3/2000WordsBook/ch12/sec2.json",
    "Chapter12Section3" : "data/n3/2000WordsBook/ch12/sec3.json",
    "Chapter12Section4" : "data/n3/2000WordsBook/ch12/sec4.json",
    "Chapter12Section5" : "data/n3/2000WordsBook/ch12/sec5.json",
    # "N3Vocabulary" : "data/n3/vocabulary.json",
    # "N4Vocabulary" : "data/n4/vocabulary.json",
}
output_file = 'roku-app/source/Vocabulary.brs'
generate_vocabulary_brs(input_files, output_file)

input_files = {
    "N3Grammar" : "data/n3/grammar.yaml",
}
output_file = 'roku-app/source/Grammar.brs'
generate_grammar_brs(input_files, output_file)
