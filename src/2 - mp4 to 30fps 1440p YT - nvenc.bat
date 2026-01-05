@echo off
setlocal EnableDelayedExpansion
mkdir "youtube_1440p_30fps_nvenc" 2>nul

for /r %%f in (*.mp4) do (
    set "input=%%f"
    echo %%f | findstr /i /c:"youtube_1440p_30fps_nvenc" >nul
    if !errorlevel! neq 0 (
        set "relative=%%f"
        set "relative=!relative:%CD%\=!"
        set "output=youtube_1440p_30fps_nvenc\!relative:.mp4=youtube_1440p_30fps_nvenc.mp4!"
        for %%d in ("!output!") do mkdir "%%~dpd" 2>nul
        echo Processing 1440p 30fps with NVENC: !relative!
        ffmpeg -hwaccel cuda -i "!input!" -filter:v "scale=2560:1440:flags=lanczos,fps=30" -c:v h264_nvenc -preset p4 -tune hq -rc vbr -cq 19 -maxrate 20M -pix_fmt yuv420p -c:a aac -b:a 512k -ar 48000 -movflags +faststart "!output!"
    )
)

echo 1440p 30fps NVENC optimization complete!
pause