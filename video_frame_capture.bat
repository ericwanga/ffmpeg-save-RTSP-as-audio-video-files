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

set SUBFILENAME=frames_%CUR_YYYY%%CUR_MM%%CUR_DD%_%CUR_HH%%CUR_NN%
mkdir %SUBFILENAME%

set VID_SOURCE=rtsp://192.168.0.80:9000/live

:: capture frames every 4 seconds
ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -r 0.25 -s 480x480 -f image2 %SUBFILENAME%\pic_%%04d.jpeg