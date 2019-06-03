all: *.tex */*.tex *.bib
	pdflatex main
	pbibtex main
	pdflatex main
	pdflatex main

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.toc *.cut *.out

