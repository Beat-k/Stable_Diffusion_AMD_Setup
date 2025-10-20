# Stable Diffusion for AMD RX 7900 GRE - Quick Start

## Getting Started in 3 Easy Steps

1. **Check Your System**
   - Double-click `SD_SYSTEM_CHECK.bat`
   - This will verify your system has everything needed
   - Fix any issues it reports before continuing

2. **Install DirectML for AMD**
   - Double-click `INSTALL_DIRECTML.bat`
   - Wait for it to complete (this will install DirectML for AMD GPU support)

3. **Launch Stable Diffusion**
   - Use `SD_AUTO_LAUNCHER.bat` (recommended - tries multiple methods automatically)
   - OR try these individual launchers if the auto launcher doesn't work:
     - `SD_SYSTEM_PYTHON.bat` (uses system Python directly)
     - `SD_SIMPLE_LAUNCHER.bat` (uses webui.bat with proper settings)
     - `SD_DIRECT_LAUNCHER.bat` (bypasses virtual environment)

## Choose Your Generation Mode

When the launcher starts, you'll be asked to choose a mode:

- **Ultra-Fast Mode**: Uses 2-step Lightning LoRA (add `<lora:sdxl_lightning_2step_lora:0.9>` to prompts)
- **Balanced Mode**: Uses 4-step Lightning LoRA (add `<lora:sdxl_lightning_4step_lora:0.8>` to prompts)
- **Quality Mode**: Uses 8-step Lightning LoRA (add `<lora:sdxl_lightning_8step_lora:0.8>` to prompts)
- **Standard Mode**: No Lightning LoRA, uses regular settings

## Need More Help?

For detailed instructions, refer to these guides:
- `AMD_GUIDE.md` - Full guide for AMD GPU optimization
- `CIVITAI_GUIDE.md` - How to download more models

## Troubleshooting

- If Stable Diffusion freezes during startup, make sure you ran `INSTALL_REQUIREMENTS.bat` first
- For VRAM optimization tips, see `AMD_GUIDE.md`