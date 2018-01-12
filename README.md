# flac-to-mp3
scriptfiles in order to convert one part of a directory tree which contains flac files to another mp3 directory tree with same relative paths
This project is under the http://www.wtfpl.net License, the best one that's out there.

Be sure to make it meet your needs.

IMPORTANT STEPS

1. You need to install ffmpeg or avconv
2. It's best to run it in a screen for testing, since your output will screw your shell
3. mp3s will not be overwritten, so if you cancel out, you might end up with corrupted files, so make sure you know at what files you cancelled
4. all processes will process the same fileset, but will skip if the outfile exists automatically
5. you need to rely on linux thread management to push each process to a separate core. Works for me though.
6. For best Testing, comment out the command in transform.sh and uncomment the echo of fullfile (or $i) and your outfile
   CHECK FOR YOUR SLASHES!
   
Have fun!
