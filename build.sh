#!/bin/bash

rm ./_build/latex/python.pdf
jupyter-book build . --builder pdflatex
