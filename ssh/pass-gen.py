import csv
import os
import subprocess

def generate_password(length):
    command = f'openssl rand -base64 {length}'
    password = subprocess.check_output(command, shell=True).decode().strip()
    return password[:length]

def read_csv_and_generate_passwords(input_filename, output_filename):
    with open(input_filename, 'r') as infile, open(output_filename, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        next(reader)  # Skip the header row
        writer.writerow(['Email', 'Username', 'Password'])  # Write the header row in output file
        for row in reader:
            email, username = row
            password = generate_password(8)
            writer.writerow([email, username, password])

read_csv_and_generate_passwords('./data/usernames.csv', './data/passwords.csv')