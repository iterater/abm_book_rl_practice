#!/bin/bash

# Clean HTML output
rm -rf ./_build/html

# Build with HTML builder
jupyter-book build . --builder html

# Clean underscore folder and paths for GitHub pages deployment with Jekyll
./clean_underscore.sh ./_build/html/

# Zip content to out folder
zip -r ./build_results/html.zip ./_build/html/