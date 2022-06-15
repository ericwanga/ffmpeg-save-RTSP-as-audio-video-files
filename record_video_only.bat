@echo off

set VID_SOURCE=rtsp://192.168.0.80:9000/live
set AUDIO_OPTS=-an
set VIDEO_OPTS_TS=-f mpegts -r 25 -vcodec libx264 -s 640x480 -aspect 4:3 -bufsize 6000k
set VIDEO_OPTS_MP4=-f mp4 -r 25 -vcodec libx264 -s 640x480 -aspect 4:3 -bufsize 6000k
set OUTPUT_FILE_MP4=video.mp4
set OUTPUT_FILE_AVI=video.avi
set OUTPUT_FILE_TS=video.ts
::set OUTPUT_HLS=-hls_time 10 -hls_list_size 10 -start_number 1

::Option 1 - .ts file
::ffmpeg -use_wallclock_as_timestamps 1 -rtsp_transport tcp -i %VID_SOURCE% -y %VIDEO_OPTS% %AUDIO_OPTS_TS% %OUTPUT_FILE_TS%

::Option 2 - .mp4 file
ffmpeg -use_wallclock_as_timestamps 1 -rtsp_transport tcp -i %VID_SOURCE% -y %VIDEO_OPTS_MP4% %AUDIO_OPTS% %OUTPUT_FILE_MP4%