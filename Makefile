REPORT=paper
LATEX=pdflatex
BIBTEX=bibtex --min-crossrefs=1000
REF1=ref
REF2=rfc

TEX = $(wildcard *.tex)
CLS = $(wildcard *.cls)
SRCS = $(TEX)
REFS=$(REF1).bib $(REF2).bib

all: pdf

$(REPORT).pdf: $(SRCS) $(CLS)
	$(LATEX) $(REPORT)
#	$(BIBTEX) $(REPORT)
#	perl -pi -e "s/%\s+//" $(REPORT).bbl
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)

$(REPORT).ps: $(REPORT).dvi figures
#	dvips -Pcmz -t letter $(REPORT).dvi -o $(REPORT).ps
	dvips -Ppdf -G0 -t letter $(REPORT).dvi -o $(REPORT).ps

web: pdf
	scp -C $(REPORT).pdf feamster@rigel.cc.gatech.edu:www/

view: $(REPORT).dvi
	xdvi $(REPORT).dvi

print: $(REPORT).dvi
	dvips $(REPORT).dvi

pdf: $(REPORT).pdf
#	ps2pdf14 $< $(REPORT).pdf

printer: $(REPORT).ps
	lpr $(REPORT).ps

tidy:
	rm -f *.dvi *.aux *.log *.blg *.bbl

clean:
	rm -f *~ *.dvi *.aux *.log *.blg *.bbl *.brf *.out $(REPORT).ps $(REPORT).pdf

