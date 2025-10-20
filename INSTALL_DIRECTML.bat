@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"
title Installing DirectML for AMD GPU

echo ===== Installing DirectML for AMD RX 7900 GRE =====
echo.

:: Check if python is available
python --version > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Python not found in PATH. Please install Python 3.10.x and try again.
    pause
    exit /b 1
)

echo Installing torch with DirectML support...
echo This may take a few minutes...
echo.

:: Install torch and torch-directml directly
python -m pip install --upgrade pip

echo First removing any existing torch/torchvision installations to prevent conflicts...
python -m pip uninstall -y torch torchvision torchaudio

echo Installing torch with compatible versions...
python -m pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cpu
if %ERRORLEVEL% NEQ 0 (
    echo Failed to install torch 2.0.1. Trying alternative version...
    python -m pip install torch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 --index-url https://download.pytorch.org/whl/cpu
)

echo Installing torch-directml...
python -m pip install torch-directml

echo.
echo Installation complete!
echo.
echo Verifying installation...
python -c "import torch; import torch_directml; print(f'Successfully installed Torch {torch.__version__} and torch-directml {torch_directml.__version__}')" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo WARNING: Could not verify torch-directml installation.
    echo Please try running the script again or check for errors above.
)

echo.
echo Now you can run SD_AUTO_LAUNCHER.bat to start Stable Diffusion.
echo.
pause