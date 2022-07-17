@echo off

REM DESCRIPTION	This script record audio only.
REM
REM
REM HISTORY	ERIC WANG	28/05/2022	create
REM			ERIC WANG	17/07/2022	add datetime to file name surfix


REM	date format subject to your system setting. Below string slicing is based on DD/MM/YYYY format 
set CUR_YYYY=%date:~-4%
set CUR_MM=%date:~3,2%
set CUR_DD=%date:~0,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFOLDERNAME=audio_%CUR_YYYY%%CUR_MM%%CUR_DD%_%CUR_HH%%CUR_NN%
mkdir %SUBFOLDERNAME%

set VID_SOURCE=rtsp://192.168.0.80:9000/live
set AUDIO_OPTS_AAC=-acodec aac
set AUDIO_OPTS_MP3=-acodec libmp3lame
set VIDEO_OPTS=-vn
set OUTPUT_FILE_AAC=audio_%SUBFOLDERNAME%.aac
set OUTPUT_FILE_MP3=audio_%SUBFOLDERNAME%.mp3
::set OUTPUT_HLS=-hls_time 10 -hls_list_size 10 -start_number 1

echo ##
echo ## Audio recording started
echo ##
echo ## Press q to exit
echo ##

::ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -y %AUDIO_OPTS_AAC% %VIDEO_OPTS% %SUBFOLDERNAME%\%OUTPUT_FILE_AAC%

ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -y %AUDIO_OPTS_MP3% %VIDEO_OPTS% %SUBFOLDERNAME%\%OUTPUT_FILE_MP3%