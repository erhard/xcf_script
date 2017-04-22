# xcf_script
generates png and jpgs in different solution from xcf (Gimp) files (takes care to grayscale or color)

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





