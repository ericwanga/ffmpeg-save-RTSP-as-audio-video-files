@echo off

REM	DESCRIPTION		Resize from file to file. Input is a file, not a RTSP stream, output is a file with same format.
REM HISTORY			Eric Wang	17/07/2022		create

:: input
set INPUTFILE=video_20220716_5m.mp4


REM INPUT NAME is everything before the .
for /f "tokens=1 delims=." %%a in ("%INPUTFILE%") do ( set INPUTNAME=%%a )

REM INPUT FORMAT is everything after the .
set "INPUTFORMAT=%INPUTFILE:.=" & set "INPUTFORMAT=%"

echo %INPUTNAME%
echo %INPUTFORMAT%

REM resize to 720x480
ffmpeg -i %INPUTFILE% -vf scale=720:480 %INPUTNAME%_resize.%INPUTFORMAT%

REM resize to half (half of WxH)
::ffmpeg -i %INPUTFILE% -vf scale="iw/2:ih/2" %INPUTNAME%_resize.%INPUTFORMAT%