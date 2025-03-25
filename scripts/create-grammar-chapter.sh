#!/usr/bin/env bash
set -e

# create files and directories for a roku component
# one chapter with 5 sections

LEVEL=$1
CHAPTER=$2


echo "Creating N${LEVEL} Grammar Chapter ${CHAPTER}"

DEST_DIR="roku-app/components/GrammarN${LEVEL}Ch${CHAPTER}"
mkdir ${DEST_DIR}

CHS="GrammarN${LEVEL}Ch${CHAPTER}"
#N4Grammar_Chapter1_database
CHAPTER_SECTION="N${LEVEL}Grammar_Chapter${CHAPTER}"
BRS="${DEST_DIR}/${CHS}.brs"
XML="${DEST_DIR}/${CHS}.xml"

cp roku-app/components/GrammarN4Ch1/GrammarN4Ch1.brs ${BRS}
cp roku-app/components/GrammarN4Ch1/GrammarN4Ch1.xml ${XML}
sed -i '' -e "s/GrammarN4Ch1/${CHS}/g" ${XML}
sed -i '' -e "s/N4Grammar_Chapter1/${CHAPTER_SECTION}/g" ${BRS}