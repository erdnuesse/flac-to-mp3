# flac-to-mp3
scriptfiles in order to convert one part of a directory tree which contains flac files to another mp3 directory tree with same relative paths
This project is under the http://www.wtfpl.net License, the best one that's out there.

MULTICORE COMPATIBLE - through a little cheating ; )

Be sure to make it meet your needs.
More comments in the files.
READ THE COMMENTS
You need both scriptfiles in order to make it work.
You also need to make them executable.

You can safely exit your shells after triggering the conversion.
Not sure, if the script will exit clean after finishing. - Still in my first productive run... but I see no reason why not.

IMPORTANT STEPS

1. You need to install ffmpeg or avconv
2. It's best to run it in a screen for testing, since your output will screw your shell
3. mp3s will not be overwritten
4. if you cancel out though, you might end up with corrupted files, so make sure you know at what files/dirs you cancelled (htop!)
5. all processes will process the same fileset, but will skip if the outfile exists automatically
6. you need to rely on linux thread management to push each process to a separate core. Works for me though.
7. For best Testing, comment out the command in transform.sh and uncomment the echo of fullfile (or $i) and your outfile
   CHECK FOR YOUR SLASHES!
   
Have fun!
