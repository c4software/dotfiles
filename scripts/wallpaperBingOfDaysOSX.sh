#!/bin/bash

# $bing is needed to form the fully qualified URL for
# the Bing pic of the day
bing="http://www.bing.com/"

# $xmlURL is needed to get the xml data from which
# the relative URL for the Bing pic of the day is extracted
#
# The mkt parameter determines which Bing market you would like to
# obtain your images from.
# Valid values are: en-US, zh-CN, ja-JP, en-AU, en-UK, de-DE, en-NZ, en-CA.
#
# The idx parameter determines where to start from. 0 is the current day,
# 1 the previous day, etc.
xmlURL=$bing"HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US"

# $saveDir is used to set the location where Bing pics of the day
# are stored.  $HOME holds the path of the current user's home directory
saveDir="$HOME/Images/BingDesktopImages/"

# Create saveDir if it does not already exist
mkdir -p $saveDir

# The desired Bing picture resolution to download
# Valid options: "_1024x768" "_1280x720" "_1366x768" "_1920x1200"
desiredPicRes="_1920x1200"

# The file extension for the Bing pic
picExt=".jpg"

# Extract the relative URL of the Bing pic of the day from
# the XML data retrieved from xmlURL, form the fully qualified
# URL for the pic of the day, and store it in $picURL

# Form the URL for the desired pic resolution
desiredPicURL=$bing$(echo $(curl -s $xmlURL) | egrep -o "<urlBase>(.*)</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$desiredPicRes$picExt

# Form the URL for the default pic resolution
defaultPicURL=$bing$(echo $(curl -s $xmlURL) | egrep -o "<url>(.*)</url>" | cut -d ">" -f 2 | cut -d "<" -f 1)

# $picName contains the filename of the Bing pic of the day

# Attempt to download the desired image resolution. If it doesn't
# exist then download the default image resolution
if wget --quiet --spider "$desiredPicURL"
then

    # Set picName to the desired picName
    picName=${desiredPicURL##*/}
    # Download the Bing pic of the day at desired resolution
    curl -s -o $saveDir$picName $desiredPicURL
else
    # Set picName to the default picName
    picName=${defaultPicURL##*/}
    # Download the Bing pic of the day at default resolution
    curl -s -o $saveDir$picName $defaultPicURL
fi

echo $saveDir$picName;

osascript -e "tell application \"System Events\" to tell every desktop to set picture to POSIX file \"$saveDir$picName\" "

# Remove pictures older than 30 days
#find $saveDir -atime 30 -delete
