@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"
title Stable Diffusion for AMD - Launcher

echo ===== Stable Diffusion for AMD GPU =====
echo.
echo Starting Stable Diffusion with AMD GPU support...
echo DirectML is automatically detected and used.
echo.

:: Set environment variables for DirectML
set PYTORCH_DIRECTML=1
set TORCH_DIRECTML_DEVICE=0

:: AMD-optimized command line arguments
set COMMANDLINE_ARGS=--skip-torch-cuda-test --skip-version-check --precision full --no-half --medvram --opt-sdp-attention --upcast-sampling --no-half-vae

echo Environment: DirectML enabled
echo Arguments: %COMMANDLINE_ARGS%
echo.

:: Run the web UI
echo Starting Stable Diffusion WebUI...
python launch.py %COMMANDLINE_ARGS%

echo.
echo Stable Diffusion has exited. Press any key to close.
pause > nul