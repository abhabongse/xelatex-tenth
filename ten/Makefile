.PHONY: all clean
pdfs = ten_oneside.pdf ten_twoside.pdf

all: $(pdfs)

$(pdfs): %.pdf: %.tex shared.tex ten.cls
	latexmk -pdf -interaction=nonstopmode $<

clean:
	latexmk -c

cleanall: clean
	rm -f $(pdfs)
