# Stable Diffusion for AMD RX 7900 GRE - Setup Guide

## Launcher Files

### Key Files
- **INSTALL_REQUIREMENTS.bat** - Run this FIRST to set up all necessary packages
- **SD_FIXED_LAUNCHER.bat** - Use this to start Stable Diffusion with different optimization modes

### Desktop Shortcuts
- **SD_AMD_Fixed_Launcher.lnk** - Shortcut to the main launcher

## Documentation Files
- **AMD_GUIDE.md** - Comprehensive guide for using Stable Diffusion with AMD GPU
- **CIVITAI_GUIDE.md** - Guide for downloading models from Civitai

## How to Run Stable Diffusion

### First Time Setup:
1. Run `INSTALL_REQUIREMENTS.bat` and wait for it to complete
2. Run `SD_FIXED_LAUNCHER.bat` or use the desktop shortcut

### Regular Usage:
1. Double-click the `SD_AMD_Fixed_Launcher.lnk` shortcut on your desktop
2. Choose your preferred mode:
   - Ultra-Fast Mode (2-step Lightning LoRA)
   - Balanced Mode (4-step Lightning LoRA)
   - Quality Mode (8-step Lightning LoRA)
   - Standard Mode (No Lightning LoRA)
3. Follow the on-screen recommendations for each mode

## Optimization Notes
- The launcher automatically configures DirectML for AMD GPU acceleration
- Memory optimization settings are pre-configured for your RX 7900 GRE
- Lightning LoRAs are recommended for faster generation

## Troubleshooting
If you encounter any issues:
1. Make sure to run INSTALL_REQUIREMENTS.bat first
2. Try using the Ultra-Fast mode which uses the least VRAM
3. Check AMD_GUIDE.md for more detailed troubleshooting tips