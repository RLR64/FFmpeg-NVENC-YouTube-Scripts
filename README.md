# FFmpeg NVENC YouTube Scripts

Batch scripts that optimize MP4 videos for YouTube using FFmpeg with CUDA acceleration. Automatically processes videos to YouTube's recommended HDR bitrates and settings across 4K, 1440p and 1080p resolutions and frame rates.

## Features

- Hardware-accelerated encoding using NVIDIA NVENC
- Processes all MP4 files recursively in the current directory
- Maintains folder structure in output
- Optimized for YouTube with HDR bitrate recommendations (+10 Mbps buffer)
- 4K, 1440 and 1080p resolution and frame rate options ranging from 60, 50, 30, 25, 24 fps

## Prerequisites

- **FFmpeg** with CUDA support
- **NVIDIA GPU** with NVENC support (GTX 600 series or newer)
- **CUDA drivers** installed

## The Following FFmpeg NVENC YouTube Scripts

### 4K (2160p)
- `1 - mp4 to 24fps 4K YT - nvenc.bat` - 3840x2160 @24fps (45 Mbps)
- `1 - mp4 to 25fps 4K YT - nvenc.bat` - 3840x2160 @25fps (45 Mbps)
- `1 - mp4 to 30fps 4K YT - nvenc.bat` - 3840x2160 @30fps (45 Mbps)
- `1 - mp4 to 50fps 4K YT - nvenc.bat` - 3840x2160 @50fps (90 Mbps)
- `1 - mp4 to 60fps 4K YT - nvenc.bat` - 3840x2160 @60fps (90 Mbps)

### 1440p
- `2 - mp4 to 24fps 1440p YT - nvenc.bat` - 2560x1440 @ 24fps (20 Mbps)
- `2 - mp4 to 25fps 1440p YT - nvenc.bat` - 2560x1440 @ 25fps (20 Mbps)
- `2 - mp4 to 30fps 1440p YT - nvenc.bat` - 2560x1440 @ 30fps (20 Mbps)
- `2 - mp4 to 50fps 1440p YT - nvenc.bat` - 2560x1440 @ 50fps (40 Mbps)
- `2 - mp4 to 60fps 1440p YT - nvenc.bat` - 2560x1440 @ 60fps (40 Mbps)

### 1080p
- `3 - mp4 to 24fps 1080p YT - nvenc.bat` - 1920x1080 @ 24fps (15 Mbps)
- `3 - mp4 to 25fps 1080p YT - nvenc.bat` - 1920x1080 @ 25fps (15 Mbps)
- `3 - mp4 to 30fps 1080p YT - nvenc.bat` - 1920x1080 @ 30fps (15 Mbps)
- `3 - mp4 to 50fps 1080p YT - nvenc.bat` - 1920x1080 @ 50fps (30 Mbps)
- `3 - mp4 to 60fps 1080p YT - nvenc.bat` - 1920x1080 @ 60fps (30 Mbps)

## Usage

1. Place the desired batch script in the folder containing your MP4 files
2. Double-click the script to run
3. Processed videos will be saved in a new folder that will show the resolution and framerate (e.g., `youtube_4k_60fps_nvenc` if you run the 4K 60fps bat file)
4. Original files remain untouched since it only makes a copy in a separate folder
5. Once you have uploaded the video and want to remove them you can use the 0 - remove mp4 files.bat file to automatically remove the .mp4 files

## Encoding Settings

- **Video Codec:** H.264 (h264_nvenc)
- **Preset:** P4 (high quality)
- **Rate Control:** VBR with Constant Quality (CQ 19)
- **Pixel Format:** yuv420p
- **Audio Codec:** AAC @ 512 kbps, 48 kHz
- **Faststart flag:** Enabled for web streaming which moves metadata to beginning of file (enables instant streaming playback)

## Notes

- Scripts automatically skip files already in output folders to prevent re-processing
- Bitrates are set 10 Mbps above YouTube's HDR recommendations for better headroom
- Lanczos scaling is used for high-quality resolution conversion

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.