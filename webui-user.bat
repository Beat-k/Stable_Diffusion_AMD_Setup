@echo off 
 
rem Set the full path to Python executable to avoid path issues
set PYTHON=%~dp0venv\Scripts\python.exe
set GIT=
set VENV_DIR=%~dp0venv
set SKIP_PREPARE_ENVIRONMENT=1

rem Set environment variables for DirectML on AMD GPUs
set PYTORCH_DIRECTML=1
set TORCH_DIRECTML_DEVICE=0

rem Configure command line args with skip-git
if "%COMMANDLINE_ARGS%"=="" (
    set COMMANDLINE_ARGS=--skip-torch-cuda-test --precision full --no-half --api --opt-sdp-attention --upcast-sampling --no-half-vae --medvram-sdxl --skip-version-check --theme dark
)
 
call webui.bat
