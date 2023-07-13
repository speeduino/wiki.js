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
START_LINE=`awk '/home.md/{ print NR; exit }' ${WORKING_DIR}/offline/std_manual.md`
CHAPTERS=`tail -n +${START_LINE} ${DEFINITION}`
IMAGES_FOLDER="img"
IMAGES=${IMAGES_FOLDER}/*
COVER_IMAGE=${IMAGES_FOLDER}/Speeduino\ logo.png
TEMPLATE=offline/eisvogel.latex
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


for f in ${CHAPTERS}
do
  #Add a blank line on the top of each file to prevent issues with pandoc concatenation
  sed -s -i '1i\\' $f
  
  #Remove the css classes from highlighted notes
  sed -i 's/{.is-success}//g' $f
  sed -i 's/{.is-info}//g' $f
  sed -i 's/{.is-warning}//g' $f
  sed -i 's/{.is-danger}//g' $f
done


echo ${PANDOC_PATH}pandoc ${ARGS} ${METADATA_ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}
${PANDOC_PATH}pandoc ${ARGS} ${METADATA_ARGS} ${PDF_ARGS} -o ${OUTPUT_FILENAME} ${CHAPTERS}

#Copy the produced PDF back to the main directory
#cp ${OUTPUT_FILENAME} ${CUR_PATH}/offline
#	@echo "$@ was built"


#Cleanup
cd ${CUR_PATH}
rm -rf ${BUILD}
