file_path = "data_in.txt"  # Replace with the actual file path
data = []
with open(file_path, 'r') as file:
    # Read and process each line in the file
    for line in file:
        dna_bit = []
        for item in line:
            if item == "A":
                dna_bit.append("00")
            elif item == "T":
                dna_bit.append("01")
            elif item == "G":
                dna_bit.append("10")
            elif item == "C":
                dna_bit.append("11")
            
        dna_res = ''.join(dna_bit)
        data.append(dna_res)
    
        file_path = "output.txt"  # Replace with the desired path and filename

        with open(file_path, 'w') as file:
            # Write each line of data to the file
            for line in data:
                file.write(line + "\n")

