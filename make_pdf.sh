#!/bin/bash

PANDOC_PATH=/usr/bin/
for arg in "$@"
do
    if [ "$arg" == "--local" ]
    then
        PANDOC_PATH=/home/pi/pandoc_src/bin/
    fi
done

MAKEFILE=Makefile
WORKING_DIR=`pwd`
OUTPUT_FILENAME=${WORKING_DIR}'/offline/Speeduino_manual.pdf'
METADATA=${WORKING_DIR}'/offline/metadata.yaml'
DEFINITION=${WORKING_DIR}'/offline/std_manual.md'
BUILD='/tmp/book'
CHAPTERS=`tail -n +8 ${DEFINITION}`
IMAGES_FOLDER="img"
IMAGES=${IMAGES_FOLDER}/*
COVER_IMAGE=${IMAGES_FOLDER}/Speeduino\ logo.png
TEMPLATE=offline/eisvogel.tex
TEMPLATE_OPTIONS='--listings --toc --toc-depth=2'
ARGS="${TEMPLATE_OPTIONS} --template=${TEMPLATE}"
#ARGS="${TEMPLATE_OPTIONS}"
#PDF_ARGS="--pdf-engine=xelatex"
PDF_ARGS="-f markdown-markdown_in_html_blocks --pdf-engine=xelatex --metadata-file=${WORKING_DIR}/offline/metadata.yml"
METADATA_ARGS="--metadata date=`date +%D`"

#This contains all the fonts that might be needed
#sudo apt-get install texlive-fonts-extra
CUR_PATH=`pwd`
mkdir -p ${BUILD}
cd ${BUILD}
echo "Temp directory:" `pwd`
git clone --depth=1 https://github.com/speeduino/wiki.js.git
cd wiki.js

#Add a blank line on the top of each file to prevent issues with pandoc concatenation
for f in ${CHAPTERS}
do
  sed -s -i '1i\\' $f
done


echo ${PANDOC_PATH}pandoc ${ARGS} ${PDF_ARGS} ${METADATA_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}
${PANDOC_PATH}pandoc ${ARGS} ${PDF_ARGS} ${METADATA_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}

#Copy the produced PDF back to the main directory
#cp ${OUTPUT_FILENAME} ${CUR_PATH}/offline
#	@echo "$@ was built"


#Cleanup
cd ${CUR_PATH}
rm -rf ${BUILD}
