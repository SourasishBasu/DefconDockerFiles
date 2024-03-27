import csv
import subprocess

def change_password(username, password):
    command = f'echo "{username}:{password}" | chpasswd'
    try:
        subprocess.run(command, shell=True, check=True)
        print(f'Password for {username} changed successfully.')
    except subprocess.CalledProcessError:
        print(f'Failed to change password for {username}.')

def read_csv_and_change_passwords(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip the header row
        for row in reader:
            email, username, password = row
            change_password(username, password)

read_csv_and_change_passwords('./custom/passwords.csv')