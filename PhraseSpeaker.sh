#!/bin/bash

# MIT License
# 
# Copyright (c) [year] [fullname]
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Check if enough arguments were provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <start phrase> <end phrase> <file name>"
    exit 1
fi

# Function to escape special characters for sed
escape_for_sed() {
    echo "$1" | sed -E 's/([\\/&])/\\&/g'
}

# Assign the arguments to variables
startPhrase=$(escape_for_sed "$1")
endPhrase=$(escape_for_sed "$2")
fileName="$3"

# Check if the file exists
if [ ! -f "$fileName" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Use awk to extract text between the start and end phrases
text=$(awk -v start="$startPhrase" -v end="$endPhrase" \
    'BEGIN {flag=0;} 
    $0 ~ start {flag=1;} 
    flag && $0 ~ end {print; flag=0; exit;} 
    flag {print;}' "$fileName")

# Use the 'say' command to dictate the text
echo "$text" | say
