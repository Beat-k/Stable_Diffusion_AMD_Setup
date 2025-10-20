import sys
print('python', sys.version)
try:
    import torch
    print('torch', getattr(torch, '__version__', None))
    print('torch.cuda.version', getattr(torch.version, 'cuda', None))
    try:
        print('cuda_available', torch.cuda.is_available())
        print('cuda_device_count', torch.cuda.device_count())
    except Exception as e:
        print('cuda_check_error', e)
except Exception as e:
    print('TORCH_IMPORT_ERROR', e)
