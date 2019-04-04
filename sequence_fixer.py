'''
This file simply takes lowercase DNA sequences and converts them to uppercase RNA 
sequences so that they can be more easily run through RNAstructure
'''

inputfile = open("Brassicaceae_DNA.txt", "r")
input= inputfile.read()
output = ""
file = open("Brassicaceae_RNA_Sequences.txt", "a")
for nucleotide in input:
	if nucleotide == "a":
		output = output + "A"
	elif nucleotide == "t":
		output = output + "U"
	elif nucleotide == "c":
		output = output + "C"
	elif nucleotide == "g":
		output = output + "G"

file.write(output)
file.write("/n")
print(output)