#!/usr/bin/env bash
set -e

# create files and directories for a roku component
# one chapter with 5 sections

SECTION=$1

echo "Creating Section ${SECTION}"

DEST_DIR="roku-app/components/GrammarNameN3Sec${SECTION}"
mkdir ${DEST_DIR}

CHS="GrammarNameN3Sec${SECTION}"
BRS="${DEST_DIR}/${CHS}.brs"
XML="${DEST_DIR}/${CHS}.xml"

cp roku-app/components/GrammarNameN3Sec1/GrammarNameN3Sec1.brs ${BRS}
cp roku-app/components/GrammarNameN3Sec1/GrammarNameN3Sec1.xml ${XML}

CODE="Section${SECTION}"

sed -i '' -e "s/GrammarNameN3Sec1/${CHS}/g" ${XML}
sed -i '' -e "s/Section1/${CODE}/g" ${BRS}
