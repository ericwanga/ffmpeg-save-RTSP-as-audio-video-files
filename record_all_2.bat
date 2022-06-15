@echo off

set VID_SOURCE=rtsp://192.168.0.80:9000/live
set OUTPUT_FILE_TS=record_all.ts
set OUTPUT_FILE_MP4=record_all.mp4

ffmpeg -use_wallclock_as_timestamps 1 -rtsp_transport tcp -i %VID_SOURCE% -f mpegts -b 400k -r 25 -vcodec libx264 -s 640x480 -aspect 4:3 -bufsize 6000k -acodec aac -ab 56k -ac 2 -ar 22050 -bf 0 -level 30 -y record_all.ts
