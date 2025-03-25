#!/usr/bin/env python3

import json
import os
from text2image import text_to_image

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

# grammar is stored in JSON in a form like:
# [
#     {
#         "name" : "〜より",
#         "meaning" : "\"Than\". Used to express the extent of something forming a topic, by comparison with something else.",
#         "forms" : [
#             {
#             "form": "名＋より",
#             "examples:" : [
#                 {
#                     "prompt" : "アパート　便利",
#                     "example" : "このアパートは前のアパートより便利です",
#                     "notes:": ""
#                 }
#             ]
#             },
#
# Ultimately we want to iterate through all examples for all forms for all phrases (structures).
   
def generate_grammar_brs(input_files, output_file):
    phrase_id = 1
    form_id = 1
    example_id = 1
    chapter_number = 1
    with open(output_file, 'w', encoding="utf-8") as outfile:
        for level, input_file in input_files.items():

            with open(input_file, 'r') as infile:
                chapter_list = get_chapter_list(infile)

                for chapter in chapter_list:
                    #print(f"chapter---> {chapter}")
                    # create a derivative flat list of examples (with a lot of redundant data)
                    # because it's easier to deal with that in brightscript.
                    examples_list = []
                    outfile.write(f"function {level}_Chapter{chapter_number}_database() as Object\n")
                    outfile.write(f"d = ")
                    for phrase in chapter:
                        #print(f"phrase---> {phrase}")
                        phrase["phrase_id"] = phrase_id

                        # generate an image of the phrase (grammatical structure)
                        dir = f"images/{level}/{chapter_number}/phrases"
                        os.makedirs(f"roku-app/{dir}", exist_ok=True)
                        phrase_image_path = f"{dir}/{phrase_id}.png"
                        phrase["image_path"] = f"pkg:/{phrase_image_path}"
                        (image_width, image_height) = text_to_image(phrase["name"], output_path=f"roku-app/{phrase_image_path}")
                        phrase["image_width"] = image_width
                        phrase["image_height"] = image_height

                        for form in phrase["forms"]:
                            form["form_id"] = form_id
                            
                            # generate an image of the grammatical form
                            dir = f"images/{level}/{chapter_number}/forms"
                            os.makedirs(f"roku-app/{dir}", exist_ok=True)
                            form_image_path = f"{dir}/{form_id}.png"
                            form["image_path"] = f"pkg:/{form_image_path}"
                            (image_width, image_height) = text_to_image(form["form"], output_path=f"roku-app/{form_image_path}", font_size=40)
                            form["image_width"] = image_width
                            form["image_height"] = image_height

                            for example in form["examples"]:
                                example["example_id"] = example_id

                                # also generate an image of every example
                                dir = f"images/{level}/{chapter_number}/examples"
                                os.makedirs(f"roku-app/{dir}", exist_ok=True)
                                example_image_path = f"{dir}/{example_id}.png"
                                example["image_path"] = f"pkg:/{example_image_path}"
                                (image_width, image_height) = text_to_image(example["example"], output_path=f"roku-app/{example_image_path}")
                                example["image_width"] = image_width
                                example["image_height"] = image_height

                                # and every prompt
                                dir = f"images/{level}/{chapter_number}/prompts"
                                os.makedirs(f"roku-app/{dir}", exist_ok=True)
                                prompt_image_path = f"{dir}/{example_id}.png"
                                example["prompt_image_path"] = f"pkg:/{prompt_image_path}"
                                (image_width, image_height) = text_to_image(example["prompt"], output_path=f"roku-app/{prompt_image_path}")
                                example["prompt_image_width"] = image_width
                                example["prompt_image_height"] = image_height

                                e = {}
                                e["example_id"] = example_id
                                e["image_path"] = example["image_path"]
                                e["prompt_image_path"] = example["prompt_image_path"]
                                e["form_id"] = form_id
                                e["form_image_path"] = form["image_path"]
                                e["phrase_id"] = phrase_id
                                e["phrase_image_path"] = phrase["image_path"]
                                e["meaning"] = phrase["meaning"]

                                #print(f"example: {example["example"]}")
                                e["notes"] = example["notes"]

                                examples_list.append(e)
                                example_id += 1
                            form_id += 1
                        phrase_id += 1
                    chapter_number += 1
                    json.dump(examples_list, outfile, ensure_ascii=False, indent=4)
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
    "N3Vocabulary" : "data/n3/vocabulary.json",
    "N4Vocabulary" : "data/n4/vocabulary.json",
}
output_file = 'roku-app/source/Vocabulary.brs'
generate_vocabulary_brs(input_files, output_file)

input_files = {
    "N4Grammar" : "data/n4/grammar.json",
}
output_file = 'roku-app/source/Grammar.brs'
generate_grammar_brs(input_files, output_file)

