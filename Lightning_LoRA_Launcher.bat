@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"
title Stable Diffusion Lightning LoRA Launcher - AMD RX 7900 GRE

echo ===== Lightning LoRA Launcher for AMD RX 7900 GRE =====
echo.

:MENU
echo Choose your launch configuration:
echo.
echo [1] Ultra-Fast Mode (2-step Lightning LoRA)
echo [2] Balanced Mode (4-step Lightning LoRA)
echo [3] Quality Mode (8-step Lightning LoRA)
echo [4] Standard Mode (No Lightning LoRA)
echo [5] Exit
echo.

set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto ULTRA_FAST
if "%choice%"=="2" goto BALANCED
if "%choice%"=="3" goto QUALITY
if "%choice%"=="4" goto STANDARD
if "%choice%"=="5" goto EXIT
echo Invalid choice. Please try again.
echo.
goto MENU

:ULTRA_FAST
echo.
echo Starting Ultra-Fast Mode with 2-step Lightning LoRA
echo.
echo Recommended settings:
echo - Sampler: Euler a
echo - Steps: 2-3
echo - CFG Scale: 1.5
echo - Add to prompt: ^<lora:sdxl_lightning_2step_lora:0.9^>
set LORA_INFO=sdxl_lightning_2step_lora for 2-3 steps
goto LAUNCH

:BALANCED
echo.
echo Starting Balanced Mode with 4-step Lightning LoRA
echo.
echo Recommended settings:
echo - Sampler: Euler a
echo - Steps: 4-6
echo - CFG Scale: 2.0
echo - Add to prompt: ^<lora:sdxl_lightning_4step_lora:0.8^>
set LORA_INFO=sdxl_lightning_4step_lora for 4-6 steps
goto LAUNCH

:QUALITY
echo.
echo Starting Quality Mode with 8-step Lightning LoRA
echo.
echo Recommended settings:
echo - Sampler: Euler a
echo - Steps: 8-10
echo - CFG Scale: 2.5
echo - Add to prompt: ^<lora:sdxl_lightning_8step_lora:0.8^>
set LORA_INFO=sdxl_lightning_8step_lora for 8-10 steps
goto LAUNCH

:STANDARD
echo.
echo Starting Standard Mode (No Lightning LoRA)
echo.
echo Recommended settings:
echo - Sampler: DPM++ 2M Karras
echo - Steps: 20-30
echo - CFG Scale: 7.0
set LORA_INFO=standard settings (no Lightning LoRA)
goto LAUNCH

:LAUNCH

:LAUNCH
echo.
echo Starting Stable Diffusion with AMD GPU acceleration...
echo Using DirectML backend for AMD RX 7900 GRE
echo Using %LORA_INFO%
echo.

rem Setting key environment variables
set PYTORCH_DIRECTML=1
set TORCH_DIRECTML_DEVICE=0
set SKIP_PREPARE_ENVIRONMENT=1
set PYTHONPATH=%~dp0
set VENV_DIR=%~dp0venv
set GIT=

rem Debug information
echo Virtual environment directory: "%~dp0venv"
echo Current directory: "%CD%"
echo.

rem Create a log file for debugging
echo Starting launch at %DATE% %TIME% > lightning_debug_log.txt
echo Current directory: "%CD%" >> lightning_debug_log.txt
echo Using LORA_INFO: "%LORA_INFO%" >> lightning_debug_log.txt

rem Use the Python executable directly from the virtual environment
set PYTHON_EXE=%~dp0venv\Scripts\python.exe

if exist "%PYTHON_EXE%" (
    echo Found Python at: "%PYTHON_EXE%"
    echo Found Python at: "%PYTHON_EXE%" >> lightning_debug_log.txt
) else (
    echo Python executable not found at "%PYTHON_EXE%"
    echo Attempting to create virtual environment...
    echo Python executable not found at "%PYTHON_EXE%" >> lightning_debug_log.txt
    
    python -m venv "%~dp0venv"
    if exist "%PYTHON_EXE%" (
        echo Successfully created virtual environment
        echo Successfully created virtual environment >> lightning_debug_log.txt
    ) else (
        echo Failed to create virtual environment. Please install Python and try again.
        echo Failed to create virtual environment >> lightning_debug_log.txt
        pause
        exit /b 1
    )
)

echo.
echo Press any key to continue...
pause > nul

echo Running launch.py with DirectML settings...
echo Running launch.py with DirectML settings... >> lightning_debug_log.txt

rem Run webui with optimized parameters for AMD GPU using explicit python path
"%PYTHON_EXE%" "%~dp0launch.py" --skip-torch-cuda-test --skip-version-check --precision full --no-half --medvram-sdxl --opt-sdp-attention --upcast-sampling --no-half-vae --theme dark >> lightning_debug_log.txt 2>&1

echo.
echo Stable Diffusion has exited. Press any key to close this window.
pause > nul
goto EXIT

:EXIT
echo Exiting launcher.
exit /b 0