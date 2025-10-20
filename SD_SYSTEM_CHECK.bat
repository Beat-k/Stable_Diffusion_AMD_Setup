@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"
title Stable Diffusion - System Check Tool

echo ===== Stable Diffusion System Check Tool =====
echo.

echo Creating detailed system report...
echo This will help identify issues with your setup.
echo.

:: Create log file
set LOG_FILE=system_check.log
echo Stable Diffusion System Check - %DATE% %TIME% > %LOG_FILE%
echo. >> %LOG_FILE%

:: System information
echo === SYSTEM INFORMATION === >> %LOG_FILE%
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" >> %LOG_FILE%
echo. >> %LOG_FILE%

:: Check Python installation
echo === PYTHON INSTALLATION === | tee -a %LOG_FILE%
echo.
echo Checking for Python...
echo Checking for Python... >> %LOG_FILE%
where python >> %LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [FAIL] Python not found in PATH! >> %LOG_FILE%
    echo [FAIL] Python not found in PATH!
    echo        Install Python 3.10.x and make sure it's in your PATH.
) else (
    python --version >> %LOG_FILE% 2>&1
    echo [PASS] Python found. >> %LOG_FILE%
    echo [PASS] Python found.
)
echo. >> %LOG_FILE%

:: Check pip
echo === PIP INSTALLATION === | tee -a %LOG_FILE%
echo.
echo Checking for pip...
echo Checking for pip... >> %LOG_FILE%
python -m pip --version >> %LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [FAIL] pip not found! >> %LOG_FILE%
    echo [FAIL] pip not found!
) else (
    echo [PASS] pip found. >> %LOG_FILE%
    echo [PASS] pip found.
)
echo. >> %LOG_FILE%

:: Check torch installation
echo === TORCH INSTALLATION === | tee -a %LOG_FILE%
echo.
echo Checking for PyTorch...
echo Checking for PyTorch... >> %LOG_FILE%
python -c "import torch; print(f'Torch version: {torch.__version__}')" >> %LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [FAIL] PyTorch not installed! >> %LOG_FILE%
    echo [FAIL] PyTorch not installed!
    echo        Run INSTALL_DIRECTML.bat to install PyTorch.
) else (
    echo [PASS] PyTorch installed. >> %LOG_FILE%
    echo [PASS] PyTorch installed.
)
echo. >> %LOG_FILE%

:: Check DirectML installation
echo === DIRECTML INSTALLATION === | tee -a %LOG_FILE%
echo.
echo Checking for DirectML...
echo Checking for DirectML... >> %LOG_FILE%
python -c "import torch_directml; print(f'DirectML version: {torch_directml.__version__}')" >> %LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [FAIL] torch-directml not installed! >> %LOG_FILE%
    echo [FAIL] torch-directml not installed!
    echo        Run INSTALL_DIRECTML.bat to install DirectML.
) else (
    echo [PASS] DirectML installed. >> %LOG_FILE%
    echo [PASS] DirectML installed.
)
echo. >> %LOG_FILE%

:: Check files
echo === FILE CHECKS === | tee -a %LOG_FILE%
echo.
echo Checking for required files...
echo Checking for required files... >> %LOG_FILE%

if exist "%~dp0launch.py" (
    echo [PASS] launch.py found. >> %LOG_FILE%
    echo [PASS] launch.py found.
) else (
    echo [FAIL] launch.py not found! >> %LOG_FILE%
    echo [FAIL] launch.py not found!
)

if exist "%~dp0webui.bat" (
    echo [PASS] webui.bat found. >> %LOG_FILE%
    echo [PASS] webui.bat found.
) else (
    echo [FAIL] webui.bat not found! >> %LOG_FILE%
    echo [FAIL] webui.bat not found!
)

echo. >> %LOG_FILE%

:: Test DirectML device detection
echo === DIRECTML DEVICE DETECTION === | tee -a %LOG_FILE%
echo.
echo Testing DirectML device detection...
echo Testing DirectML device detection... >> %LOG_FILE%

:: Create a temporary Python script to test DirectML
echo import torch > test_directml.py
echo import torch_directml >> test_directml.py
echo try: >> test_directml.py
echo     device = torch_directml.device() >> test_directml.py
echo     print(f"DirectML device found: {device}") >> test_directml.py
echo     success = True >> test_directml.py
echo except Exception as e: >> test_directml.py
echo     print(f"Error detecting DirectML device: {e}") >> test_directml.py
echo     success = False >> test_directml.py
echo with open('directml_test_result.txt', 'w') as f: >> test_directml.py
echo     f.write(str(success)) >> test_directml.py

:: Run the test script
python test_directml.py >> %LOG_FILE% 2>&1

:: Check the result
if exist directml_test_result.txt (
    set /p DML_RESULT=<directml_test_result.txt
    if "!DML_RESULT!"=="True" (
        echo [PASS] DirectML device detected successfully! >> %LOG_FILE%
        echo [PASS] DirectML device detected successfully!
    ) else (
        echo [FAIL] DirectML device detection failed! >> %LOG_FILE%
        echo [FAIL] DirectML device detection failed!
        echo        Make sure your AMD GPU drivers are up to date.
    )
) else (
    echo [FAIL] DirectML test failed to run! >> %LOG_FILE%
    echo [FAIL] DirectML test failed to run!
)

:: Clean up test files
if exist test_directml.py del test_directml.py
if exist directml_test_result.txt del directml_test_result.txt

echo. >> %LOG_FILE%

:: Summary
echo === SUMMARY === | tee -a %LOG_FILE%
echo.
echo System check complete. Results saved to %LOG_FILE%
echo.
echo If you see any [FAIL] messages above, please address those issues.
echo.
echo Recommended actions:
echo 1. If Python is missing: Install Python 3.10.x
echo 2. If torch or DirectML is missing: Run INSTALL_DIRECTML.bat
echo 3. If DirectML device detection failed: Update your AMD GPU drivers
echo.
echo After fixing these issues, use SD_AUTO_LAUNCHER.bat
echo.

echo Press any key to exit...
pause > nul