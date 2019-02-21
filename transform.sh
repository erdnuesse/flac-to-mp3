#!/bin/bash
## - The IFS takes care of spaces in file and dirnames 
## - your folders may vary
## - what you mount to the folders does not matter
## - in RELDIR, the f5 most likely MUST be edited,
##    since its responsible, how many leading directories 
##    will be removed from the directory structure in order 
##    to append that exact path to the outfile
## - the commented echos are still in place in order to give 
##    you the variables for testing, before running. 
##    just comment the ffmpeg / avconv command with a #
## - on my raspberry I could only use avconv, not ffmpeg. 
##    choose, whatever suits you best

IFS=$'\n'

## the paths given here contain my Directory structure, that I want to keep
## remote=/mnt/music/FLAC/ARTIST/ALBUM/FLACFILE.flac
## local=/mnt/1tb/mp3/ARTIST/ALBUM/MP3FILE.mp3

remote=/mnt/music/FLAC
local=/mnt/1tb/mp3

for i in $(find $remote -type f -iname '*.flac' );
do
## SET VARIABLES for PATHS and FILENAMES
        fullfile=$i
        filename="${i##*/}"
        filename="${filename%.*}.mp3"
        fulldir=$(dirname "${i}")
        reldir="$(echo $fulldir | cut -d'/' -f5-)"
        reldir=${reldir//flac}
        outdir="$local/$reldir"
        outfile="$outdir/$filename"

# is that working? 
# outfile='$local/""$(echo $(dirname "${i}") | cut -d'/' -f5-)"//flac"/"${i##*/}"'
#       echo 'output file: ' "$outfile"

## SHOW ME THE CONTENTS of the VARIABLES
#       echo 'File found:' "$i"
#       echo 'Relative dir: ' "$reldir"
#       echo 'directory will be created: ' "$outdir"
#       echo 'Filename: ' "$filename"
#       echo 'FileExt: ' "$extension"
#       echo 'output file: ' "$outfile"

## CREATE Output Folders
        mkdir -p "$outdir"

## RUN
#        ffmpeg -loglevel info -i "$fullfile" -codec:a libmp3lame -qscale:a 0 "$outfile"
        avconv -n -nostats -loglevel info -i "$fullfile" -codec:a libmp3lame -qscale:a 0 "$outfile"
## just for testing
#        sleep 1
done
