@echo off

REM	date format subject to your system setting. Below string slicing is based on DD/MM/YYYY format 
set CUR_YYYY=%date:~-4%
set CUR_MM=%date:~3,2%
set CUR_DD=%date:~0,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
::set CUR_MS=%time:~9,2%

set SUBFILENAME=videoonly_%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%
mkdir %SUBFILENAME%

set VID_SOURCE=rtsp://192.168.0.80:9000/live
set AUDIO_OPTS=-an
set VIDEO_OPTS_TS=-f mpegts -r 25 -vcodec libx264 -s 640x480 -aspect 4:3 -b:v 2000k -bufsize 2000k
set VIDEO_OPTS_MP4=-f mp4 -r 30 -vcodec libx264 -s 640x480 -aspect 4:3 -b:v 500k
::set OUTPUT_FILE_AVI=video_%SUBFILENAME%.avi
set OUTPUT_FILE_TS=videoonly_%SUBFILENAME%.ts
set OUTPUT_FILE_MP4=videoonly_%SUBFILENAME%.mp4

::set OUTPUT_HLS=-hls_time 10 -hls_list_size 10 -start_number 1

::Option 1 - .ts file
::ffmpeg -use_wallclock_as_timestamps 1 -rtsp_transport tcp -i %VID_SOURCE% -y %VIDEO_OPTS% %AUDIO_OPTS_TS% %OUTPUT_FILE_TS%

::Option 2 - .mp4 file
:: -use_wallclock_as_timestamps 1
ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -y %VIDEO_OPTS_MP4% %AUDIO_OPTS% %SUBFILENAME%\%OUTPUT_FILE_MP4% 