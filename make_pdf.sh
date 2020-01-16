#!/bin/bash

BUILD=build
MAKEFILE=Makefile
OUTPUT_FILENAME='offline/Speeduino_manual.pdf'
METADATA=metadata.yml
DEFINITION='offline/std_manual.md'
CHAPTERS=`cat ${DEFINITION}`
IMAGES_FOLDER="img"
IMAGES=${IMAGES_FOLDER}/*
COVER_IMAGE=${IMAGES_FOLDER}/Speeduino\ logo.png
TEMPLATE=offline/eisvogel.tex
TEMPLATE_OPTIONS='--top-level-division=chapter --listings --toc'
#METADATA_ARG=--metadata-file=${METADATA}
ARGS="${TEMPLATE_OPTIONS} --template=${TEMPLATE} ${METADATA_ARG}"
PDF_ARGS="-V book --pdf-engine=xelatex"

#This contains all the fonts that might be needed
#sudo apt-get install texlive-fonts-extra

mkdir -p ${BUILD}/pdf
echo pandoc ${ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}
pandoc ${ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}
#	@echo "$@ was built"

