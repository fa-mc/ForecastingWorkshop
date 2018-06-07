SOURCES=$(shell find . -name *.Rmd)
SOURCES := $(wildcard *.Rmd)
TARGETS=$(SOURCES:%.Rmd=%.pdf)

%.pdf: %.Rmd header.tex
	@echo "$< -> $@"
	@Rscript -e "rmarkdown::render('$<')"

default: $(TARGETS)

latex:
	latexmk 3-3-Hierarchical.tex
	latexmk 3-5-Wrapup.tex

clean:
	rm -rfv $(TARGETS)
	latexmk -c
	rm -rfv *_cache/
	rm -rfv *_files/
	rm -rfv 3-3-Hierarchical.pdf
	rm -rfv 3-5-Wrapup.pdf