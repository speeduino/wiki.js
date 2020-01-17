#!/bin/bash
PANDOC_PATH=/home/pi/pandoc_src/bin/
MAKEFILE=Makefile
OUTPUT_FILENAME='offline/Speeduino_manual.pdf'
METADATA='offline/metadata.yaml'
DEFINITION='offline/std_manual.md'
BUILD='/home/pi/book/tmp'
CHAPTERS=`tail -n +8 ${DEFINITION}`
IMAGES_FOLDER="img"
IMAGES=${IMAGES_FOLDER}/*
COVER_IMAGE=${IMAGES_FOLDER}/Speeduino\ logo.png
TEMPLATE=offline/eisvogel.tex
TEMPLATE_OPTIONS='--listings --toc --toc-depth=2'
METADATA_ARG=--metadata-file=${METADATA}
ARGS="${TEMPLATE_OPTIONS} --template=${TEMPLATE}"
#ARGS="${TEMPLATE_OPTIONS}"
#PDF_ARGS="--pdf-engine=xelatex"
PDF_ARGS="-f markdown-markdown_in_html_blocks --pdf-engine=xelatex"

#This contains all the fonts that might be needed
#sudo apt-get install texlive-fonts-extra

CUR_PATH=`pwd`
mkdir -p ${BUILD}
cd ${BUILD}
git clone --depth=1 https://github.com/speeduino/wiki.js.git
cd wiki.js

#Add a blank line on the top of each file to prevent issues with pandoc concatenation
for f in ${CHAPTERS}
do
  sed -s -i '1i\\' $f
done


echo ${PANDOC_PATH}pandoc ${ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}
${PANDOC_PATH}pandoc ${ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}

#Copy the produced PDF back to the main directory
cp ${OUTPUT_FILENAME} ${CUR_PATH}/offline
#	@echo "$@ was built"


#Cleanup
cd ${BUILD}/..
rm -rf ./tmp
cd ${CUR_PATH}
