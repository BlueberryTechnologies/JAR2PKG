#!/bin/sh
sips --version
echo "What is the program called? (No spaces)"
read programName
FOLDER=$programName.iconset
mkdir $FOLDER
echo "Saved as $FOLDER"

echo "What is the PNG file called for the icon? (No spaces):"
read pngFile
PNGFILE=$pngFile
sips --resampleHeightWidth 128 128 \
   $PNGFILE --out $FOLDER/icon_128x128.png
iconutil --convert icns $FOLDER


mkdir -p package/macos
cp -v *.png *.icns package/macos
echo "What is the main jar name? (No spaces)"
read mainJar
jpackage --name $programName --input . --main-jar $mainJar \
   --resource-dir package/macos --type pkg
rm -R $FOLDER
rm -R package/macos
rm -R $programName.icns
rm -R package