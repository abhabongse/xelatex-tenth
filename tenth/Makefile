.PHONY: all clean
en_pdfs = tenth_en_oneside.pdf tenth_en_twoside.pdf
th_pdfs = tenth_th_oneside.pdf tenth_th_twoside.pdf
th_texs = $(patsubst %.pdf,%.tex,$(th_pdfs))
pdfs = $(en_pdfs) $(th_pdfs)

all: $(pdfs)

$(en_pdfs): %.pdf: %.tex shared_en.tex tenth.cls
	latexmk -pdf -interaction=nonstopmode $<

$(th_pdfs): %.pdf: %.tex shared_th.tex tenth.cls
	latexmk -pdf -interaction=nonstopmode $<

$(th_texs): %.tex: %.pre.tex
	swath -f latex -u u,u < $< > $@

clean:
	latexmk -c

allclean:
	latexmk -c
	rm -f $(pdfs) $(th_texs)
