@echo off
setlocal EnableDelayedExpansion
mkdir "youtube_4k_24fps_nvenc" 2>nul

for /r %%f in (*.mp4) do (
    set "input=%%f"
    echo %%f | findstr /i /c:"youtube_4k_24fps_nvenc" >nul
    if !errorlevel! neq 0 (
        set "relative=%%f"
        set "relative=!relative:%CD%\=!"
        set "output=youtube_4k_24fps_nvenc\!relative:.mp4=_4K_24fps_nvenc.mp4!"
        for %%d in ("!output!") do mkdir "%%~dpd" 2>nul
        echo Processing 4K 24fps with NVENC: !relative!
        ffmpeg -hwaccel cuda -i "!input!" -filter:v "scale=3840:2160:flags=lanczos,fps=24" -c:v h264_nvenc -preset p4 -tune hq -rc vbr -cq 19 -maxrate 45M -pix_fmt yuv420p -c:a aac -b:a 512k -ar 48000 -movflags +faststart "!output!"
    )
)

echo 4K 24fps NVENC optimization complete!
pause