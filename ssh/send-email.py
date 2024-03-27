import csv
import requests
from dotenv import load_dotenv
import os

load_dotenv()

api_key = os.getenv('MAILGUN_API_KEY')
domain = os.getenv('MAILGUN_DOMAIN')

with open('passwords.csv', 'r') as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        email, username, password = row
        response = requests.post(
            f"https://api.mailgun.net/v3/{domain}/messages",
            auth=("api", api_key),
            data={"from": "Game Master <gamemaster@email.d3fc0n.tech>",
                  "to": [email],
                  "subject": "Credentials for D3FC0N Servers",
                  "text": f"Your username is {username} and your password is {password}. Only for SSH access. Username is valid for website as well as server."})

        if response.status_code == 200:
            print(f"Email sent to {email}")
        else:
            print(f"Failed to send email to {email}")