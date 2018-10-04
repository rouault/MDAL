#!/bin/bash
if [ "$#" -ne 1 ] ; then 
  echo "QGIS directory argument required" 
  exit 1
fi 

QGIS_MDAL_DIR=$1/external/mdal/
if [ ! -d "$QGIS_MDAL_DIR" ] ; then  
  echo "Directory $QGIS_MDAL_DIR does not exist"
  exit 1
fi

PWD=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/.. 

echo "Remove old version"
rm -rf $QGIS_MDAL_DIR/*

echo "Copy new version"
cp -RV ./cmake $QGIS_MDAL_DIR/
cp -Rv ./cmake_templates $QGIS_MDAL_DIR/
cp -Rv ./mdal/* $QGIS_MDAL_DIR
find $QGIS_MDAL_DIR -name "*CMakeLists.txt" -type f -delete
find $QGIS_MDAL_DIR -name "*astyle" -type f -delete
find $QGIS_MDAL_DIR -name "*~" -type f -delete

echo "Done"
cd $PWD
