# Bio332
Files for Bio 332 Independent Project

Here's how to use this information:

Step 1. Search for taxa of interest on ITS2 database (http://its2.bioapps.biozentrum.uni-wuerzburg.de/)

Step 2. Click on all the taxa you want to analyze and save both sequence + structure data to an xfasta file + save sequences in a fasta file.

Step 3. Open xfasta file in 4SALE to clean up the alignments and view the secondary structures

Step 4. Export new xfasta file from 4SALE

Step 5. Use PreNexClean.py to convert the structural data into a form that can be read by Mesquite. The program will create a new fasta file with A, C, T, and G corresponding to ., (, ), and -. 

Step 6.  Use MasterNexus.py to clean up and combine the structural and sequence data into one fasta file. The way this is output will create one long string where each nucleotides sequence information and structural position is evenly-weighted.

Step 7. Convert all fasta files to Nexus files with this website: http://sequenceconversion.bugaco.com/converter/biology/sequences/fasta_to_nexus.php

Step 8. Upload each Nexus file individually to PAUP to calculate trees using the Parsimony method.

Step 9. Download trees as .tre files and upload .tre files to respective Mesquite files.

Step 10. Compare outputs.

See powerpoint for more information about the background and results of this project.
