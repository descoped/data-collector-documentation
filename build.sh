#!/usr/bin/env bash

JAR_URL="https://search.maven.org/remotecontent?filepath=net/sourceforge/plantuml/plantuml/1.2020.26/plantuml-1.2020.26.jar"
JAR_FILE="$PWD/bin/plantuml.jar"

SOURCE_FOLDER="$PWD/docs/puml"
DOCS_TARGET_FOLDER="$PWD/docs/diagrams"

# Check if realpath CLI exists
if ! command -v realpath &> /dev/null
then
    echo "realpath NOT found. On macOS install coreutils!"
    exit
fi

# Download JAR
if [ ! -f "$JAR_FILE" ]; then
  mkdir -p "$PWD/bin"
  curl -sL "$JAR_URL" -o "$JAR_FILE"
fi

# Print PUML-files to convert
echo "Files to process:"
for file in "$SOURCE_FOLDER"/*
do
  echo $(realpath --relative-to="$PWD" "$file")
done

# Convert folder
java -jar "$JAR_FILE" -progress "$SOURCE_FOLDER" -o "$DOCS_TARGET_FOLDER"

# Generate AsciiDoc
asciidoctor -r asciidoctor-diagram -a allow-uri-read -b html5 -a linkcss -B $PWD/docs/ README.adoc -D $PWD/target/
