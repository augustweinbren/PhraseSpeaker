# PhraseSpeaker

PhraseSpeaker is a simple yet powerful bash script designed to read text from a specified file and use macOS's text-to-speech capabilities to audibly dictate content found between two defined phrases. It's an excellent tool for extracting and listening to specific sections from large text files, such as documents, transcripts, or code files.

## Features

- Extracts text from a file between two user-specified phrases.
- Handles files with complex structures, including varying spaces and newline characters.
- Utilizes macOS's native `say` command for clear and natural dictation.

## Prerequisites

- macOS (The script uses macOS's native `say` command).
- A text file from which you want to extract and dictate text.

## Installation

1. Download the `PhraseSpeaker.sh` script.
2. Give execute permissions to the script:

   ```bash
   chmod +x PhraseSpeaker.sh
   ```

## Usage

Run the script with three arguments: the start phrase, the end phrase, and the file name. For example:

```bash
./PhraseSpeaker.sh "Start Phrase" "End Phrase" "yourfile.txt"
```

- **Start Phrase**: The phrase where dictation should begin.
- **End Phrase**: The phrase where dictation should end.
- **File Name**: The path to the text file from which to read.

## Example

To dictate text from a file named `example.txt` between the phrases "Hello World" and "Goodbye World", use:

```bash
./PhraseSpeaker.sh "Hello World" "Goodbye World" "example.txt"
```

## Contributing

Contributions, issues, and feature requests are welcome!

## License

Distributed under the MIT License.
