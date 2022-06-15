# ffmpeg-save-RTSP-as-audio-video-files
Windows batch scripts to use ffmpeg tool to save RTSP stream from 1 IP camera as audio only, video only and audio+video files to local directory. The original idea was through OpenCV in Python, but I am not aware of a way to save audio tracks from a RTSP stream through OpenCV. I can save video using OpenCV no problem. So, to make the scripts in one place and suit for all purposes, changed to FFmpeg. If you know how to save audio in OpenCV in Python, please share. Thanks.



# Install FFmpeg on Windows 10

Download and install FFmpeg from https://www.ffmpeg.org/download.html#build-windows or https://github.com/BtbN/FFmpeg-Builds/releases

If you don't have Admin access to your laptop, or it is a work laptop and you don't have elevation, add to Path of *User variables*, no need to add to Path of *System variables*. For example, if FFmpeg is installed to `C:\ffmpeg`, then add `C:\ffmpeg\bin` to Path of *User variables*:

![image-20220615103419849](C:\Users\erwang\Documents\EricWang\U\phd\work4_openvino\recordings\ffmpeg-save-RTSP-as-audio-video-files\img\image-20220615103419849.png)

![image-20220615103506608](C:\Users\erwang\Documents\EricWang\U\phd\work4_openvino\recordings\ffmpeg-save-RTSP-as-audio-video-files\img\image-20220615103506608.png)

# The scripts

So far, the scripts do not support arguments options. Some key options are hard-coded as below. If want to change output file name or format, open the scripts in a text editor and make changes in there. They will support somewhat argument inputs in future updates. 

|                    | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| Input              | RTSP link, e.g rtsp://192.168.0.80:9000/live                 |
| video output       | video codec: libx264<br>video size: 640x480<br>video aspect: 4:3<br>video bufsize: 6000k<br>filename and format: *video.mp4* |
| audio output       | audio codec: libmp3lame<br>filename and format: *audio.mp3*  |
| video+audio output | video codec: libx264<br>video size: 640x480<br>audio codec: aac<br>audio channels: 2<br>filename and format: *record_all.ts* |

# Run the scripts in cmd

Then start cmd as normal, no need to *Run as administrator*, and run the script of your choice: audio only, video only, or all:

![image-20220615103713800](C:\Users\erwang\Documents\EricWang\U\phd\work4_openvino\recordings\ffmpeg-save-RTSP-as-audio-video-files\img\image-20220615103713800.png)

