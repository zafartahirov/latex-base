MAIN=main
OUTDIR=out

LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf -jobname=$(OUTDIR)/$(MAIN)
# -pvc specifies if "continuous build" is enabled
CONTINUOUS=-pvc

SOURCES=$(MAIN).tex Makefile
FIGURES := $(shell find figures/* images/* -type f)

all: $(MAIN).pdf

.refresh:
	touch .refresh

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(MAIN).pdf: $(MAIN).tex .refresh $(OUTDIR) $(SOURCES) $(FIGURES)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)


force: $(OUTDIR)
	touch .refresh
	mkdir -p $(OUTDIR)
	rm $(MAIN).pdf
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk
	rm -rf $(OUTDIR)

once: $(OUTDIR)
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug: $(OUTDIR)
	$(LATEX) $(LATEXOPT) $(MAIN)

.PHONY: clean force once all
