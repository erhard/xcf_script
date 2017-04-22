

##workflow description

#First get picture by gimp -> xcf originals put it all in a folder
#run the programm from that folder
#xcf is converted to png original resolution png 
#this png converted to png 1400 and png 600 for better handling
#for overview contact-sheet is build

#you need xcf_tools installed and imageMagick
# got only metatag to work with exiftool
#apt-get install libimage-exiftool-perl

#directorystructure
#project_name
#      |
#      |
#      |
#      |__png_full
#      |
#      |__png_1400
#      |
#      |__png_600
#      |__jpg_600
#
#You have to create a project-folder and put all xcf there.Then go there and run xcf_.sh The rest is created.
#
#      if you want to have a signiture in the right corner put a file with the signiture in the the directory of the programmfile. It must be a transparent file as png in the same directory your xcf_.sh file is 

# recommend the tool contact to create contact-sheets. 
# http://github.com/jmhobbs/helper-scripts


mkdir -p "./full_png"
mkdir -p "./png_1400"
mkdir -p "./png_600"
mkdir -p "./jpg_600"

###change this to your name
author="your name your www.adress"

for file in ./*
do
    if [ -f "$file" ]; then
        echo $file
        filename=${file##*/}
        filename="${filename%.*}.png"
        jpgfilename="${filename%.*}.jpg"
        echo "FILENAME ---->"
        echo $filename
        xcf2png -g "$file" -o "./full_png/$filename"
        ret=$?
        ##if this was ok (no color) then process the rest with greyscale params
        greyscale=""
        if [ $ret == 0 ]; then
        greyscale="-type Grayscale" 
        fi
        if [ $ret == "103" ]; then
            xcf2png "$file" -o "./full_png/$filename"
        fi
          convert  "./full_png/$filename"  $greyscale -resize 1400x1400 "./png_1400/1400_$filename"
          convert  "./full_png/$filename"  $greyscale -resize 600x600 "./png_600/600_$filename"
          convert  "./full_png/$filename"  $greyscale -resize 600x600 "./jpg_600/600_$jpgfilename"
          ##put author in jpg
          exiftool -Comment="$author" ./jpg_600/600_$jpgfilename
          rm ./jpg_600/600_"$jpgfilename"_original
      fi
done

