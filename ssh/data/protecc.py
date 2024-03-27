import os

with open('./custom/paths.txt', 'r') as f:
    file_paths = f.read().splitlines()

with open('./custom/error_paths.txt', 'w') as error_file:
    for file_path in file_paths:
        try:
            if os.path.exists(file_path):
                os.chmod(file_path, 0o700)
            else:
                print(f"Path does not exist: {file_path}")
                error_file.write(f"Path does not exist: {file_path}\n")
        except PermissionError:
            print(f"Permission denied: {file_path}")
            error_file.write(f"Permission denied: {file_path}\n")