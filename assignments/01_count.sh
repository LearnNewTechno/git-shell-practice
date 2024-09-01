
#!/bin/bash

# Check if a file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Read the file, convert all words to lowercase, replace non-alphabetic characters with new lines, sort and count occurrences
tr -cs '[:alpha:]' '\n' < "$1" | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -5
