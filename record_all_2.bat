@echo off

REM	date format subject to your system setting. Below string slicing is based on DD/MM/YYYY format 
set CUR_YYYY=%date:~-4%
set CUR_MM=%date:~3,2%
set CUR_DD=%date:~0,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
::set CUR_SS=%time:~6,2%
::set CUR_MS=%time:~9,2%

set SUBFILENAME=videoall_%CUR_YYYY%%CUR_MM%%CUR_DD%_%CUR_HH%%CUR_NN%
mkdir %SUBFILENAME%


set VID_SOURCE=rtsp://192.168.0.80:9000/live
::set VIDEO_OPTS=-f mpegts -b 400k -r 25 -vcodec libx264 -s 640x480 -aspect 4:3 -b:v 2000k -bufsize 6000k
set VIDEO_OPTS=-f mpegts -b 800k -r 30 -vcodec libx264 -s 640x480 -aspect 4:3 -bufsize 6000k
::set AUDIO_OPTS=-acodec aac -ab 128k -ac 2 -ar 22050 -bf 0 -level 30
set AUDIO_OPTS=-af asetrate=48000 -acodec aac -b:a 96k -ac 2


set OUTPUT_FILE_TS=recordall_%SUBFILENAME%.ts
set OUTPUT_FILE_MP4=recordall_%SUBFILENAME%.mp4

:: -use_wallclock_as_timestamps 1
ffmpeg -use_wallclock_as_timestamps 1 -rtsp_transport tcp -i %VID_SOURCE% %VIDEO_OPTS% %AUDIO_OPTS% -y %SUBFILENAME%\%OUTPUT_FILE_MP4%
