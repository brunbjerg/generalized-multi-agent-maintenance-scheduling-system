#!/bin/fish

zathura main.tex &

ls **.tex | entr tectonic -X compile main.tex
