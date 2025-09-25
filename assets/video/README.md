# Video Files

Place your video files in this directory:

## ⚠️ IMPORTANT: Video Optimization

Your video file is too large! Here's how to fix it:

### 🎯 Target Specifications:
- **Duration**: **3 seconds only** (no loop)
- **Format**: MP4 (primary), WebM (fallback)
- **Resolution**: 1280x720 (HD) or 1920x1080 (Full HD)
- **Aspect Ratio**: 16:9
- **File Size**: **UNDER 2MB** (preferably 1MB)
- **Bitrate**: 1-2 Mbps for web
- **Frame Rate**: 24-30 fps
- **Behavior**: Plays once, then shows fallback content

### 🛠️ How to Optimize Your Video:

#### Option 1: Online Tools (Easiest)
1. **HandBrake** (Free): https://handbrake.fr/
   - Load your video
   - Preset: "Web" or "Fast 720p30"
   - Target size: 5MB
   - Convert

2. **Online Compressor**: https://www.freeconvert.com/video-compressor
   - Upload your video
   - Set target size to 2MB
   - Download compressed version

#### Option 2: FFmpeg (Advanced)
```bash
ffmpeg -i input.mp4 -c:v libx264 -crf 28 -c:a aac -b:a 128k -movflags +faststart hero-video.mp4
```

### 📁 How to Add Your Optimized Video:
1. **Compress your video** using one of the methods above
2. **Rename** the compressed file to `hero-video.mp4`
3. **Place it** in this directory: `assets/video/hero-video.mp4`
4. **Test** by refreshing your website

### 🚀 Current Status:
- ❌ Video too large - not loading
- ✅ Fallback content showing with countdown timer
- ✅ Loading message with optimization tip
- ✅ All controls and animations working
- ✅ 3-second duration with no loop
- ✅ Lazy loading (only loads when in view)

### 💡 Pro Tips:
- **Start with 720p** instead of 4K
- **Use H.264 codec** for best compatibility
- **Keep audio simple** (128kbps is enough)
- **Test on mobile** - large files are worse on mobile data

### 🎬 Video Features (Ready to Use):
- ✅ Auto-play on page load
- ✅ Continuous looping
- ✅ Beautiful startup animation
- ✅ Loading spinner with helpful messages
- ✅ Play/Pause controls
- ✅ Mute/Unmute controls
- ✅ Fullscreen support
- ✅ Keyboard controls (Space, M, F)
- ✅ Mobile responsive
- ✅ Intersection Observer (pauses when out of view)
- ✅ Fallback content for slow loading

**Once you optimize your video file, everything will work perfectly!**
