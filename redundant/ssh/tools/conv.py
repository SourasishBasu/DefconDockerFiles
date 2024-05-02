import csv

# Open the existing CSV file
with open('mock_data_1.csv', 'r') as infile:
    reader = csv.DictReader(infile)

    # Open a new CSV file to write the reformatted data
    with open('mod_data.csv', 'w', newline='') as outfile:
        fieldnames = ['rollno', 'first_name', 'last_name']
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)

        writer.writeheader()

        for row in reader:
            # Extract the roll number, first name, and last name from the existing data
            rollno = row['roll']
            first_name = row['name'].split(' ')[0]
            last_name = row['name'].split(' ')[1] if len(row['name'].split(' ')) > 1 else ''

            # Write the reformatted data to the new CSV file
            writer.writerow({'rollno': rollno, 'first_name': first_name, 'last_name': last_name})