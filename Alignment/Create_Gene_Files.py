from Bio import SeqIO
import os
import subprocess


def create_directories_for_genes(base_output_dir):
    gene_dirs = []
    for i in range(37):  # Assuming 37 genes as per your original script
        gene_dir = os.path.join(base_output_dir, f'gene_{i + 1}')
        os.makedirs(gene_dir, exist_ok=True)
        gene_dirs.append(gene_dir)
    return gene_dirs


def concatenate_fasta_files(input_dir, output_file, partition_file, base_output_dir):
    Length_List = [[] for _ in range(37)]
    gene_dirs = create_directories_for_genes(base_output_dir)

    # Handles for each gene-specific fasta file
    gene_handles = [open(os.path.join(gene_dir, f'gene_{i + 1}.fasta'), 'w') for i, gene_dir in enumerate(gene_dirs)]

    with open(output_file, 'w') as output_handle:
        for filename in os.listdir(input_dir):
            if filename.endswith('.fas'):
                fasta_path = os.path.join(input_dir, filename)
                individual = os.path.splitext(filename)[0]  # Extract filename without extension
                individual_header_written = False

                with open(fasta_path, 'r') as input_handle:
                    records = list(SeqIO.parse(input_handle, 'fasta'))

                    for i, record in enumerate(records):
                        sequence = record.seq
                        length = len(sequence)
                        Length_List[i].append(length)

                        # Write individual header only once per individual in the concatenated file
                        if not individual_header_written:
                            output_handle.write(f'>{individual}\n')
                            individual_header_written = True

                        # Write sequence without gene header in the concatenated file
                        for j in range(0, len(sequence), 50):
                            output_handle.write(str(sequence[j:j + 50]) + '\n')

                        # Write to gene-specific fasta file
                        gene_handles[i].write(f'>{individual}\n')
                        for j in range(0, len(sequence), 50):
                            gene_handles[i].write(str(sequence[j:j + 50]) + '\n')

    # Close all gene-specific handles
    for handle in gene_handles:
        handle.close()

    max_values = [max(sublist) for sublist in Length_List]
    # Write partition lengths to the partition_file
    with open(partition_file, 'w') as partition_handle:
        total_length = 0
        for i, length in enumerate(max_values):
            partition_handle.write(f'DNA, part{i + 1} = {total_length + 1}-{total_length + length}\n')
            total_length += length

    # Align each gene-specific file using MAFFT
    for gene_dir in gene_dirs:
        fasta_files = [f for f in os.listdir(gene_dir) if f.endswith('.fasta')]
        for fasta_file in fasta_files:
            input_fasta_path = os.path.join(gene_dir, fasta_file)
            output_mafft_fasta_path = os.path.join(gene_dir, f"{os.path.splitext(fasta_file)[0]}_Aligned.fasta")

            # Run MAFFT
            mafft_command = f"mafft {input_fasta_path} > {output_mafft_fasta_path}"
            subprocess.run(mafft_command, shell=True)


# Directory containing fasta files
directory = "/Users/tannervanorden/Desktop/Cutthroat_Mitogenome_Publication/Current_Phylogeny_Directory"

# Base output directory
base_output_dir = "/Users/tannervanorden/Desktop/Cutthroat_Mitogenome_Publication/Current_Phylogeny_Directory/Phylogeny/"
os.makedirs(base_output_dir, exist_ok=True)

# Output file paths
output_file = os.path.join(base_output_dir, "concatenated_sequences.fasta")
partition_output = os.path.join(base_output_dir, "partition.txt")

# Call function to concatenate fasta files
concatenate_fasta_files(directory, output_file, partition_output, base_output_dir)

# Run MAFFT to align the concatenated sequences
aligned_output = os.path.join(base_output_dir, "Aligned.fasta")
subprocess.run(["mafft", "--auto", output_file], stdout=open(aligned_output, 'w'))

# File paths
input_fasta = aligned_output
output_nexus = os.path.join(base_output_dir, "Aligned.nex")

# Run seqmagick to convert FASTA to NEXUS
#subprocess.run(["seqmagick", "convert", "--output-format", "nexus", "--alphabet", "dna", input_fasta, output_nexus])
