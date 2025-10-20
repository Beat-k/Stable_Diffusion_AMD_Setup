# Using Civitai to Download Models for Stable Diffusion

[Civitai](https://civitai.com) is the largest community platform for Stable Diffusion models, featuring thousands of high-quality models created by users.

## Steps to Download Models from Civitai

1. **Visit Civitai**: Go to [Civitai website](https://civitai.com)

2. **Create an Account**: While not required for downloading most models, creating an account allows you to track favorites and access adult content.

3. **Browse Models**: Use the search or filter options to find models that interest you.
   - Filter by model type: Checkpoint, LoRA, VAE, etc.
   - Filter by base model: SD 1.5, SDXL, etc.

4. **Download the Model**:
   - Click on a model card to view details
   - Click the "Download" button
   - Select the version you want if multiple are available

5. **Place in the Correct Folder**:
   - Checkpoint/Base Models → `models/Stable-diffusion/`
   - LoRA Models → `models/Lora/`
   - VAE Models → `models/VAE/`
   - Textual Inversion Embeddings → `embeddings/`

## Recommended Beginner Models from Civitai

### Base Models (Checkpoints)

- **Dreamshaper** - Great all-purpose model for beginners
- **Realistic Vision** - Excellent for photorealistic images
- **Deliberate** - Good for artistic images with detailed control

### LoRA Models

- **Detail Tweaker** - Enhances details in any image
- **More Details** - Another detail enhancer
- **LCM** - Makes generation faster

### Recommended SDXL Models

- **SDXL Lightning** - Faster generation with SDXL quality
- **Juggernaut XL** - High-detail SDXL variant
- **Dreamshaper XL** - SDXL version of the popular Dreamshaper

## Using Models in the WebUI

1. Start Stable Diffusion WebUI using your `run_sdxl_for_amd.bat` file
2. For base models:
   - Select the model from the dropdown at the top of the interface
3. For LoRA models:
   - Type `<lora:filename:weight>` in your prompt (replace "filename" with the name without extension)
   - Example: `a portrait of a woman <lora:more_details:0.7>`
   - Or use the LoRA tab in the WebUI

## Tips for Your AMD GPU

- Start with smaller models if you have limited VRAM
- Use SD 1.5 based models for faster generation
- SDXL models require more VRAM but produce better results
- Try using `--medvram` option for larger models (already included in your launch script)
- The VAE is processed on GPU, so good VAE models can help quality without much VRAM impact

