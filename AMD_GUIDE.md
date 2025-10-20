# Stable Diffusion Guide for AMD RX 7900 GRE

This is a comprehensive guide for running Stable Diffusion with your AMD RX 7900 GRE GPU using DirectML acceleration.

## 1. Quick Start

First, run `SD_SYSTEM_CHECK.bat` to verify your system is properly configured.

Then launch Stable Diffusion using one of these methods:

- `SD_AUTO_LAUNCHER.bat` (recommended - tries multiple approaches automatically)
- Or one of the specialized launchers based on your needs:

1. **Ultra-Fast Mode** - Uses 2-step Lightning LoRA for near-instant generation
2. **Balanced Mode** - Uses 4-step Lightning LoRA for good speed/quality balance
3. **Quality Mode** - Uses 8-step Lightning LoRA for better quality with decent speed
4. **Standard Mode** - Uses standard settings without Lightning LoRA

## 2. Available Models

### LoRA Models (in models/Lora/)

- **SDXL Lightning 2-step** (`sdxl_lightning_2step_lora.safetensors`)
  - Purpose: Ultra-fast generation with only 2 steps
  - Best settings: Euler a sampler, 2-3 steps, CFG 1.5
  - Usage: Add `<lora:sdxl_lightning_2step_lora:0.9>` to your prompt

- **SDXL Lightning 4-step** (`sdxl_lightning_4step_lora.safetensors`)
  - Purpose: Very fast generation with decent quality
  - Best settings: Euler a sampler, 4-6 steps, CFG 2.0
  - Usage: Add `<lora:sdxl_lightning_4step_lora:0.8>` to your prompt

- **SDXL Lightning 8-step** (`sdxl_lightning_8step_lora.safetensors`)
  - Purpose: Good balance of speed and quality
  - Best settings: Euler a sampler, 8-10 steps, CFG 2.5
  - Usage: Add `<lora:sdxl_lightning_8step_lora:0.8>` to your prompt

- **LCM LoRA for SDXL** (`lcm-lora-sdxl.safetensors`)
  - Purpose: Latent Consistency Model for fast generation
  - Best settings: Euler a sampler, 4-8 steps, CFG 1.5-2.0
  - Usage: Add `<lora:lcm-lora-sdxl:1.0>` to your prompt

- **SDXL Offset Example** (`sd_xl_offset_example-lora_1.0.safetensors`)
  - Purpose: Style modification example from StabilityAI
  - Best settings: Any sampler, weight 0.5-1.0
  - Usage: Add `<lora:sd_xl_offset_example-lora_1.0:0.7>` to your prompt

### VAE Models (in models/VAE/)

- **SDXL VAE** (`sdxl_vae.safetensors`)
  - Purpose: Official VAE for SDXL
  - Usage: Select in Settings → Stable Diffusion → VAE

- **Fine-tuned MSE VAE** (`vae-ft-mse-840000-ema-pruned.safetensors`)
  - Purpose: Improved color fidelity and details
  - Usage: Select in Settings → Stable Diffusion → VAE

## 3. Optimizing for AMD RX 7900 GRE

Your AMD RX 7900 GRE has 16GB of VRAM, which is enough to run SDXL models with the right optimizations.

### Command Line Parameters

These parameters are already included in your launcher:

```bash
--skip-torch-cuda-test --precision=full --no-half --directml --medvram-sdxl --opt-sdp-attention --upcast-sampling --no-half-vae
```

### Memory Optimization Tips

1. **Use Lightning LoRAs**: These drastically reduce the number of steps needed, which reduces VRAM usage and generation time
2. **Lower Batch Size**: Start with batch size 1, then increase if your GPU can handle it
3. **Clear Cache**: Use the "Clear Cache" option in Settings if you experience slowdown after many generations
4. **Lower Resolution for Testing**: Generate at 768x768 for testing, then use 1024x1024 for final images
5. **Enable Tiled VAE**: For large images (above 1024px), enable the Tiled VAE option

## 4. Sample Prompts

### Ultra-Fast Portrait (2-step)

```text
Portrait of a woman with blonde hair and blue eyes, detailed features, outdoor lighting, professional photography
<lora:sdxl_lightning_2step_lora:0.9>
```

### Balanced Landscape (4-step)

```text
Epic mountain landscape, sunset, dramatic clouds, photorealistic, high detail
<lora:sdxl_lightning_4step_lora:0.8>
```

### Quality Character Art (8-step)

```text
Detailed character concept art, fantasy warrior, intricate armor, dramatic lighting, high quality, sharp details
<lora:sdxl_lightning_8step_lora:0.8>
```

### Combining LoRAs

You can combine the Lightning LoRA with other style LoRAs for more creative control:

```text
Beautiful city street, cinematic lighting, detailed, 8k
<lora:sdxl_lightning_4step_lora:0.7> <lora:sd_xl_offset_example-lora_1.0:0.3>
```

## 5. Adding More Models

### From Hugging Face

1. Use the Hugging Face token you've already set up
2. Go to the model page on Hugging Face
3. Download the model (.safetensors or .pt file)
4. Place it in the appropriate folder:
   - LoRA models: `models/Lora/`
   - VAE models: `models/VAE/`
   - Base models: `models/Stable-diffusion/`

### From Civitai

1. Go to [Civitai](https://civitai.com)
2. Search for SDXL models, LoRAs, or VAEs
3. Download the model
4. Place it in the appropriate folder as above

## 6. Troubleshooting

### Common Issues and Solutions

1. **Out of Memory Errors**
   - Use a Lightning LoRA with fewer steps
   - Lower the resolution to 512x512 or 768x768 for testing
   - Enable --medvram or --lowvram settings
   - Close other GPU-intensive applications

2. **Slow Generation**
   - Make sure you're using the Lightning LoRAs with Euler a sampler
   - Clear cache between generations using the "Clear Cache" button
   - Check if DirectML is working properly with `SD_SYSTEM_CHECK.bat`
   - Close other applications using VRAM

3. **Poor Image Quality**
   - Try increasing steps (4→8→more)
   - Try increasing CFG scale slightly (7-9 range)
   - Try different samplers (DPM++ 2M Karras often works well)
   - Make sure the correct VAE is selected

4. **DirectML Not Working**
   - Run `SD_SYSTEM_CHECK.bat` to diagnose DirectML issues
   - Run `INSTALL_DIRECTML.bat` to reinstall torch-directml
   - Make sure AMD GPU drivers are up to date
   - Try using `SD_SYSTEM_PYTHON.bat` to bypass virtual environment issues

5. **Launcher Freezes or Crashes**
   - Try `SD_AUTO_LAUNCHER.bat` which attempts multiple methods
   - If the web UI doesn't load, check the terminal for error messages
   - Run `SD_SYSTEM_CHECK.bat` for comprehensive diagnostics
   - See `TROUBLESHOOTING.md` for more detailed solutions

For additional help, check the comprehensive `TROUBLESHOOTING.md` guide.

Enjoy creating with your optimized AMD GPU setup!