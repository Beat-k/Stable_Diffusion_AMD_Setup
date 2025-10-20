# DirectML Troubleshooting Guide

This guide addresses common issues with DirectML and the AMD RX 7900 GRE GPU.

## Command-Line Argument Issue

The correct command-line argument for enabling DirectML acceleration is:

```bash
--directml
```

NOT:

```bash
--use-directml
```

## How to Fix Your Scripts

If you're experiencing "unrecognized arguments" errors with `--use-directml`, update your batch files to use `--directml` instead.

The following launcher scripts have been updated to use the correct parameter:

1. SD_SIMPLE_LAUNCHER.bat
2. SD_DIRECT_LAUNCHER.bat
3. SD_FIXED_LAUNCHER.bat
4. SD_SYSTEM_PYTHON.bat

## How DirectML Works

DirectML support in Stable Diffusion WebUI works as follows:

1. The `--directml` parameter triggers the importing of the `directml_adapter` module
2. The module patches the device management to use DirectML device instead of CUDA
3. Environment variables `PYTORCH_DIRECTML=1` and `TORCH_DIRECTML_DEVICE=0` are set to configure DirectML

## Additional Troubleshooting

If you're still experiencing issues:

1. Run `INSTALL_DIRECTML.bat` to ensure the proper torch-directml package is installed
2. Run `SD_SYSTEM_CHECK.bat` to verify DirectML is properly detecting your GPU
3. Try `SD_AUTO_LAUNCHER.bat` which already uses the correct parameter

## Common Errors

### "error: unrecognized arguments: --use-directml"

This occurs because the parameter should be `--directml`, not `--use-directml`. The launcher scripts have been updated to use the correct parameter.

### "No module named torch_directml"

Run `INSTALL_DIRECTML.bat` to install the DirectML package.

### "DirectML device not found" or "Cannot initialize DirectML"

Check that your AMD drivers are up to date. The RX 7900 GRE is supported, but requires recent drivers.