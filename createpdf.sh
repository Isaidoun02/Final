#!/bin/bash

# Check if the first parameter (LaTeX file name) is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <latex-file> [output-pdf-name]"
    exit 1
fi

# Get the LaTeX file name from the first parameter
latex_file="$1"

# Check if the LaTeX file exists
if [ ! -f "$latex_file.tex" ]; then
    echo "Error: LaTeX file '$latex_file' not found."
    exit 1
fi

# Get the output PDF name from the second parameter or use a default name
output_pdf="${2:-$latex_file}"

# Run pdflatex with the specified file names
pdflatex -interaction=nonstopmode -jobname="$output_pdf" "$latex_file.tex"

# Check if pdflatex command was successful
if [ $? -eq 0 ]; then
    echo "PDF generated successfully as '$output_pdf.pdf'"
else
    echo "Error generating PDF."
    exit 1
fi
rm *.log
rm *.aux