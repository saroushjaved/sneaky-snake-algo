# Online Python compiler (interpreter) to run Python online.
# Write Python 3 code in this online editor and run it.
file_path = "data.txt"  # Update with your file path

data = []  # List to store the loaded data

# Open the file
with open(file_path, "r") as file:
    # Read the file line by line
    for line in file:
        # Remove any leading/trailing whitespaces and newline characters
        line = line.strip()
        
        # Append the line to the data list
        data.append(line)

# Print the loaded data

out_data = []
count = 0;

for item in data:
    dna_bit = []
    for i in range(len(item)):
        if item[i] == "A":
            dna_bit.append("00")
        elif item[i] == "T":
            dna_bit.append("01")
        elif item[i] == "G":
            dna_bit.append("10")
        elif item[i] == "C":
            dna_bit.append("11")
    
    dna_bit.append(',')
    dna_res = ''.join(dna_bit)
    out_data.append(dna_res)

file_path_1 = "output.txt"  # Update with your file path

# Open the file in write mode
with open(file_path_1, "w") as file:
    # Write data to the file
    for line in out_data:
        file.write(line + "\n")
        print(len(line))

