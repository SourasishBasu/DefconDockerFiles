import csv
import subprocess

with open('./custom/usernames.csv', 'r') as file:
    reader = csv.reader(file)
    next(reader)  

    with open('./custom/passwords.csv', 'w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerow(['Email','Username', 'Password'])  

        for row in reader:
            email, username = row
            password = subprocess.check_output("openssl rand -base64 8", shell=True).decode('utf-8').strip()
            command = f"echo '{username}:{password}' | chpasswd"
            subprocess.run(command, shell=True, check=True)
            print(f"Password for {username} was changed successfully.")

            writer.writerow([email, username, password])