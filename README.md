# Stable Diffusion WebUI for AMD GPUs - Complete Setup Guide

A comprehensive guide for the optimized setup of [AUTOMATIC1111's Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) specifically configured for AMD GPUs using DirectML acceleration.

## 🚀 Features

- **AMD GPU Acceleration** - Utilizes DirectML for AMD GPU support
- **ProtoGen X3.4 Ready** - Pre-installed photorealistic model
- **Multiple Launchers** - Three different options for various use cases
- **Lightning LoRA Support** - Ultra-fast generation modes (2-step, 4-step, 8-step)
- **Optimized Settings** - Pre-configured for AMD RX 7900 GRE and similar GPUs
- **Diagnostic Tools** - Built-in system checking and troubleshooting
- **Complete Setup** - All dependencies included and configured

## 🎯 System Requirements

- **GPU**: AMD RX 6000/7000 series (optimized for RX 7900 GRE)
- **OS**: Windows 10/11
- **Python**: 3.10.x (included in setup)
- **RAM**: 16GB+ recommended
- **VRAM**: 8GB+ recommended (optimized for mid-range VRAM)
- **Storage**: 15GB+ free space for models and outputs

## 📦 Installation

1. **Install Python 3.10.x** from [python.org](https://python.org)
2. **Clone or download** this repository
3. **Run the installer**: `INSTALL_DIRECTML.bat`
4. **Test your setup**: `SD_SYSTEM_CHECK.bat`

## 🚀 Quick Start

### Method 1: Main Launcher (Recommended)
```bash
# Double-click or run:
Stable_Diffusion_Launcher.bat
```

### Method 2: Safe Launcher (If issues occur)
```bash
# Double-click or run:
Safe_Launcher.bat
```

### Method 3: Lightning LoRA (Fast generation)
```bash
# Double-click or run:
Lightning_LoRA_Launcher.bat
```

## 🛠️ Launcher Options

| Launcher | Purpose | Use Case |
|----------|---------|----------|
| **`Stable_Diffusion_Launcher.bat`** | Main launcher | Daily use, fastest startup |
| **`Safe_Launcher.bat`** | Compatibility launcher | When having issues, automatic dependency handling |
| **`Lightning_LoRA_Launcher.bat`** | Fast generation modes | Experimenting with 2-8 step generation |
| **`SD_SYSTEM_CHECK.bat`** | Diagnostic tool | Troubleshooting system issues |

## ⚙️ Configuration

### DirectML Settings
The launchers automatically configure:
- `PYTORCH_DIRECTML=1` - Enables DirectML backend
- `TORCH_DIRECTML_DEVICE=0` - Uses primary AMD GPU

### AMD-Optimized Arguments
```bash
--skip-torch-cuda-test      # Skip CUDA compatibility check
--skip-version-check        # Skip version validation
--precision full            # Use full precision for AMD
--no-half                   # Disable half-precision (AMD compatibility)
--medvram                   # Memory optimization for mid-range VRAM
--opt-sdp-attention         # Optimized attention mechanism
--upcast-sampling           # Better sampling for AMD
--no-half-vae               # Disable VAE half-precision
```

## 🎨 Lightning LoRA Modes

The Lightning LoRA launcher offers different speed/quality modes:

| Mode | Steps | Sampler | CFG Scale | Quality | Speed |
|------|-------|---------|-----------|---------|-------|
| **Ultra-Fast** | 2-3 | Euler a | 1.5 | Good | ⚡⚡⚡ |
| **Balanced** | 4-6 | Euler a | 2.0 | Better | ⚡⚡ |
| **Quality** | 8-10 | Euler a | 2.5 | Best | ⚡ |
| **Standard** | 20-30 | DPM++ 2M Karras | 7.0 | Highest | 🐌 |

### Lightning LoRA Usage
1. Download Lightning LoRA models (e.g., `sdxl_lightning_4step_lora.safetensors`)
2. Place in `models/Lora/` directory
3. Add to prompt: `<lora:sdxl_lightning_4step_lora:0.8>`

## 🔧 Troubleshooting

### Common Issues

#### "Python not found"
```bash
# Install Python 3.10.x and ensure it's in PATH
python --version  # Should show Python 3.10.x
```

#### "DirectML not found"
```bash
# Run the DirectML installer
INSTALL_DIRECTML.bat
```

#### "All launch methods failed"
```bash
# Run system diagnostics
SD_SYSTEM_CHECK.bat

# Then try the safe launcher
Safe_Launcher.bat
```

#### GPU Not Detected
1. Update AMD GPU drivers
2. Verify DirectML installation:
```python
python -c "import torch_directml; print('Available:', torch_directml.is_available())"
```

### Performance Tips

1. **Memory Management**
   - Use `--medvram` for 8GB VRAM
   - Use `--lowvram` for 4GB VRAM
   - Close other GPU-intensive applications

2. **Generation Speed**
   - Try Lightning LoRA models for faster generation
   - Use smaller image sizes (512x512 vs 1024x1024)
   - Reduce sampling steps for drafts

3. **Quality Optimization**
   - Use `--precision full` for best quality
   - Enable `--upcast-sampling` for better sampling
   - Use higher step counts for final images

## 📁 Directory Structure

```
stable-diffusion-webui-master/
├── Stable_Diffusion_Launcher.bat     # Main launcher
├── Safe_Launcher.bat                 # Compatibility launcher
├── Lightning_LoRA_Launcher.bat       # Fast generation launcher
├── SD_SYSTEM_CHECK.bat               # Diagnostic tool
├── INSTALL_DIRECTML.bat              # DirectML installer
├── models/                           # Model storage
│   ├── Stable-diffusion/            # Base models
│   ├── Lora/                        # LoRA models
│   └── VAE/                         # VAE models
├── outputs/                          # Generated images
└── extensions/                       # Extensions
```

## 🆘 Support

### Getting Help
1. **First**: Run `SD_SYSTEM_CHECK.bat` for diagnostics
2. **Check**: This README for common solutions
3. **Try**: `Safe_Launcher.bat` for compatibility mode

### Useful Commands
```bash
# Check Python version
python --version

# Test DirectML
python -c "import torch_directml; print('Available:', torch_directml.is_available())"

# Check GPU memory
python -c "import torch_directml; print('Device:', torch_directml.device())"

# Check web interface
# Open browser to: http://127.0.0.1:7860
```

## 📝 Version Information

- **Base**: AUTOMATIC1111 Stable Diffusion WebUI v1.10.1
- **DirectML**: torch-directml 0.2.5+
- **Python**: 3.10.6
- **Torch**: 2.4.1
- **Optimized for**: AMD RX 7900 GRE

## 🔄 What We Accomplished

This setup was optimized by:

1. **Cleaned Installation** - Removed unnecessary files and duplicate shortcuts
2. **Fixed DirectML Integration** - Proper environment variable configuration
3. **Optimized Launchers** - Multiple launch options for different scenarios
4. **Corrected Arguments** - Removed unsupported `--directml` flag, used proper AMD settings
5. **Diagnostic Tools** - Added system checking capabilities

### Files Removed During Optimization
- Redundant shortcut files (`.lnk` files)
- Development files (`.eslintrc.js`, `.pylintrc`, etc.)
- Platform-specific files for macOS/Linux
- Cache and temporary files
- Archive files

### Key Fixes Applied
- Removed unsupported `--directml` command line argument
- Set proper DirectML environment variables (`PYTORCH_DIRECTML=1`)
- Optimized launch arguments for AMD GPU compatibility
- Created multiple launcher options for different use cases

## 🏷️ Tags

`stable-diffusion` `amd-gpu` `directml` `windows` `ai-art` `image-generation` `automatic1111` `webui`

## 📄 License

This project follows the same license as the original AUTOMATIC1111 Stable Diffusion WebUI.

---

**⭐ If this setup helped you, please star this repository!**

*Optimized for AMD GPUs • DirectML Acceleration • Lightning Fast Generation*
