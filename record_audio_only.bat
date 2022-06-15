@echo off

set VID_SOURCE=rtsp://192.168.0.80:9000/live
set AUDIO_OPTS_AAC=-acodec aac
set AUDIO_OPTS_MP3=-acodec libmp3lame
set VIDEO_OPTS=-vn
set OUTPUT_FILE_AAC=audio.aac
set OUTPUT_FILE_MP3=audio.mp3
::set OUTPUT_HLS=-hls_time 10 -hls_list_size 10 -start_number 1

::ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -y %AUDIO_OPTS_AAC% %VIDEO_OPTS% %OUTPUT_FILE_AAC%

ffmpeg -rtsp_transport tcp -i %VID_SOURCE% -y %AUDIO_OPTS_MP3% %VIDEO_OPTS% %OUTPUT_FILE_MP3%