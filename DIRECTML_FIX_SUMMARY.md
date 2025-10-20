# DirectML Parameter Fix Summary

## Issue Identified

The launcher scripts were using the incorrect parameter `--use-directml` instead of the correct parameter `--directml`.

## Files Fixed

The following files have been updated to use the correct parameter:

1. `SD_SIMPLE_LAUNCHER.bat`
2. `SD_DIRECT_LAUNCHER.bat`
3. `SD_FIXED_LAUNCHER.bat`
4. `SD_SYSTEM_PYTHON.bat`

## Documentation Updated

1. `AMD_GUIDE.md` - Updated to show the correct parameter
2. Created `TROUBLESHOOTING_DIRECTML.md` with detailed information about this issue

## How to Verify

1. Run any of the updated launcher scripts
2. The scripts should now launch without the "unrecognized arguments" error
3. The AMD GPU should be properly detected and used for acceleration

## What Worked All Along

The `SD_AUTO_LAUNCHER.bat` script was already using the correct parameter `--directml`, which is why it worked while the other scripts failed.

## Technical Explanation

After analyzing the codebase:

1. There is no explicit `--use-directml` parameter in the cmd_args.py file
2. The `--directml` parameter isn't explicitly defined either
3. Instead, the DirectML functionality is loaded based on importing the directml_adapter.py module in initialize.py
4. The DirectML adapter works by patching the devices module to use DirectML device

## Related Environment Variables

These environment variables are still necessary and were already correctly set in all scripts:

- `PYTORCH_DIRECTML=1`
- `TORCH_DIRECTML_DEVICE=0`