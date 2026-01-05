@echo off
echo Removing MP4 files...
for /r %%f in (*.mp4) do (
    del "%%f"
    echo Deleted: %%f
)
echo.
echo All MP4 files have been removed!
pause