import csv
import os
import subprocess

input_file = './custom/usernames.csv'

if os.geteuid() != 0:
    print("This script must be run as root.")
    exit(1)

with open(input_file, 'r') as csv_file:
    reader = csv.reader(csv_file)

    next(reader)  # Skip the header row
    for row in reader:
        username = row[0]

        result = subprocess.run(['./custom/gen.sh', username], stderr=subprocess.PIPE)
        
        if result.returncode == 0:
            print(f"User {username} created successfully.")
        else:
            print(f"Failed to create user {username}: {result.stderr.decode()}")