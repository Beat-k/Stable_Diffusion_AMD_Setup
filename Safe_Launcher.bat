@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"
title Stable Diffusion for AMD - Safe Launcher

echo ===== Stable Diffusion for AMD GPU - SAFE LAUNCHER =====
echo.
echo This launcher uses webui.bat for maximum compatibility.
echo It handles virtual environments and dependencies automatically.
echo DirectML is automatically detected and used.
echo.

:: Set environment variables for DirectML
set PYTORCH_DIRECTML=1
set TORCH_DIRECTML_DEVICE=0

:: AMD-optimized command line arguments (removed --directml as it's not supported)
set COMMANDLINE_ARGS=--skip-torch-cuda-test --skip-version-check --precision full --no-half --medvram --opt-sdp-attention --upcast-sampling --no-half-vae

echo Environment: DirectML enabled
echo Arguments: %COMMANDLINE_ARGS%
echo.

:: Run webui
echo Starting Stable Diffusion WebUI...
call webui.bat

echo.
echo Stable Diffusion has exited. Press any key to close.
pause > nul