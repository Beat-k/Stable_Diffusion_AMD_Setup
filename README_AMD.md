# Stable Diffusion for AMD RX 7900 GRE

This is a customized version of the AUTOMATIC1111 Stable Diffusion WebUI optimized specifically for AMD RX 7900 GRE and other AMD GPUs using DirectML acceleration.

## Quick Start Guide

Please see the `QUICK_START.md` file for the fastest way to get up and running.

## Tools and Launchers

This package includes several specialized tools to help you run Stable Diffusion on your AMD GPU:

### Launcher Options

- **SD_AUTO_LAUNCHER.bat** (RECOMMENDED) - Automatically tries multiple Python methods
- **SD_SYSTEM_PYTHON.bat** - Uses your system Python directly
- **SD_SIMPLE_LAUNCHER.bat** - Uses webui.bat with optimized settings
- **SD_DIRECT_LAUNCHER.bat** - Bypasses the virtual environment completely

### Utility Tools

- **SD_SYSTEM_CHECK.bat** - Diagnoses your system for compatibility issues
- **INSTALL_DIRECTML.bat** - Installs the necessary DirectML packages

## Documentation

- **QUICK_START.md** - Step-by-step instructions to get started quickly
- **TROUBLESHOOTING.md** - Solutions for common issues
- **AMD_GUIDE.md** - Detailed guide for optimizing Stable Diffusion on AMD GPUs

## Why This Custom Version?

The standard Stable Diffusion WebUI is primarily optimized for NVIDIA GPUs using CUDA. This customized version includes:

1. **DirectML Integration** - Allows AMD GPUs to accelerate the image generation process
2. **Specialized Launchers** - Multiple options to work around common issues
3. **Diagnostic Tools** - Help identify and fix AMD-specific problems
4. **Optimized Settings** - Command line arguments and settings tailored for AMD GPUs
5. **Comprehensive Guides** - Documentation specific to AMD usage

## System Requirements

- AMD GPU (optimized for RX 7900 GRE)
- Windows 10/11
- Python 3.10.x (not newer versions)
- 16GB+ RAM recommended
- 4GB+ VRAM recommended (8GB+ preferred)

## If You Have Issues

If you encounter any problems:

1. First run `SD_SYSTEM_CHECK.bat` to diagnose your system
2. Check `TROUBLESHOOTING.md` for solutions to common issues
3. Try the different launcher options in order

---

For the original AUTOMATIC1111 Stable Diffusion WebUI documentation, see README_ORIGINAL.md