#!/bin/bash

rm ./_build/latex/*

jupyter-book build . --builder pdflatex

cp ./_build/latex/python.pdf ./build_results/book.pdf
