import csv
import os

input_file = 'mock_data.csv'
output_file = './data/usernames.csv'

if not os.path.exists(input_file):
    print(f"Input file {input_file} does not exist.")
    exit(1)

with open(input_file, 'r') as csv_in, open(output_file, 'w', newline='') as csv_out:
    reader = csv.reader(csv_in)
    writer = csv.writer(csv_out)

    writer.writerow(['Email','Username'])

    next(reader)  
    for row in reader:
        roll_number, first_name, last_name = row
        roll = roll_number + "@kiit.ac.in"
        username = roll_number[4:] + "_" + first_name[:5]
        writer.writerow([roll, username])