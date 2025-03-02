#!/usr/bin/env bash
set -e

# create files and directories for a roku component
# one chapter with 5 sections

CHAPTER=$1

for i in {1..5}; do

    echo "Creating Chater ${CHAPTER} section ${i}"

    DEST_DIR="roku-app/components/Ch${CHAPTER}S${i}"
    mkdir ${DEST_DIR}

    CHS="Ch${CHAPTER}S${i}"
    CHAPTER_SECTION="Chapter${CHAPTER}Section${i}"
    BRS="${DEST_DIR}/${CHS}.brs"
    XML="${DEST_DIR}/${CHS}.xml"

    cp roku-app/components/Ch1S1/Ch1S1.brs ${BRS}
    cp roku-app/components/Ch1S1/Ch1S1.xml ${XML}
    sed -i '' -e "s/Ch1S1/${CHS}/g" ${XML}
    sed -i '' -e "s/Chapter1Section1/${CHAPTER_SECTION}/g" ${BRS}
done