# Makefile for compiling the phd thesis with pdflatex

# Trashy file formats
TRASH = *.aux *.ist *.log *.out *.sbl *.acn *.lol *.lot *.toc *.lof *.xml main-blx.bib *.bbl *.blg *.auxlock *.glo *.gls *.glg *.alg *.acr *.fls *.fdb_latexmk

# LaTeX compiler flags
FLAGS = -shell-escape

all: main

dbg: main

# We need to run it twice for the refs and stuff to be picked up!
main: main.tex
	pdflatex $(FLAGS) -jobname $@ $<
	bibtex main.aux
	makeglossaries main
	pdflatex $(FLAGS) -jobname $@ $<
	pdflatex $(FLAGS) -jobname $@ $<

.PHONY: clean clean_pdf

clean:
	rm -f $(TRASH)

clean_pdf:
	rm -f *.pdf
