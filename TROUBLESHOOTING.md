# Stable Diffusion for AMD RX 7900 GRE - Troubleshooting Guide

## First Steps - Run System Check

Before trying any solutions, run the system check to diagnose issues:

1. Run `SD_SYSTEM_CHECK.bat`
2. Review any warnings or failures reported
3. Follow the recommendations to fix identified issues

## If Stable Diffusion Won't Launch

Try these solutions in order:

### Solution 1: Run the Auto Launcher

1. Run `SD_AUTO_LAUNCHER.bat`
2. This tries multiple Python approaches automatically
3. It will attempt different methods until one works

### Solution 2: Install DirectML Package

1. Run `INSTALL_DIRECTML.bat`
2. This directly installs the torch-directml package needed for AMD GPU support
3. Then try running `SD_AUTO_LAUNCHER.bat` again

### Solution 3: Try Specific Launchers

If the auto launcher doesn't work, try these specific launchers in order:

1. Run `SD_SYSTEM_PYTHON.bat` (uses system Python directly)
2. Run `SD_SIMPLE_LAUNCHER.bat` (uses original webui.bat with optimized settings)
3. Run `SD_DIRECT_LAUNCHER.bat` (bypasses virtual environment completely)

## Common Issues and Solutions

### Issue 1: "Python not found" or Python-related errors

- Make sure Python 3.10.x is installed (not newer versions)
- Make sure Python is added to your PATH environment variable
- Run `INSTALL_DIRECTML.bat` to set up Python packages

### Issue 2: "No module named torch_directml"

- Run `INSTALL_DIRECTML.bat` to install the DirectML package
- If that fails, run `SD_SYSTEM_CHECK.bat` to diagnose Python issues

### Issue 3: Stable Diffusion freezes during startup

- Try using `SD_AUTO_LAUNCHER.bat` which tries multiple methods
- Try using `SD_SYSTEM_PYTHON.bat` which bypasses virtual environment issues
- Try adding `--skip-prepare-environment` to the command line arguments

### Issue 4: Windows Defender or antivirus blocking execution

- Check if Windows Defender or your antivirus is blocking Python or the launcher
- Add exceptions for the Stable Diffusion folder if necessary
- Temporarily disable real-time protection while installing packages

### Issue 5: "No AMD GPU detected" or "DirectML not working"

- Make sure your GPU drivers are up to date
- Verify the environment variable PYTORCH_DIRECTML=1 is set
- Run `INSTALL_DIRECTML.bat` to ensure the DirectML package is installed correctly
- Run `SD_SYSTEM_CHECK.bat` to verify DirectML can detect your GPU

### Issue 6: Virtual environment problems

- If you see errors related to venv or .venv, try `SD_SYSTEM_PYTHON.bat`
- This bypasses virtual environment issues by using system Python directly
- Run `SD_SYSTEM_CHECK.bat` to verify your Python environment

### Issue 7: Out of memory errors

- Try adding `--medvram` or `--lowvram` to the command line arguments
- Reduce image dimensions to 512x512 for testing
- Close other GPU-intensive applications before launching

## Additional Resources

- Run `SD_SYSTEM_CHECK.bat` to generate a detailed system report
- Check the generated `system_check.log` file for technical details
- Visit the [Stable Diffusion WebUI GitHub](https://github.com/AUTOMATIC1111/stable-diffusion-webui) for official documentation
- For AMD-specific optimizations, see the `AMD_GUIDE.md` file