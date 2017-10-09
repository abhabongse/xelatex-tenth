.PHONY: all clean cleanall
dep_files = tenth.cls thaienum.sty thaicaptions.sty thaifont-setup.sty
en_pdfs = tenth_en_oneside.pdf tenth_en_twoside.pdf
th_pdfs = tenth_th_oneside.pdf tenth_th_twoside.pdf
pdfs = $(en_pdfs) $(th_pdfs)

all: $(pdfs)

$(en_pdfs): %.pdf: %.tex shared_en.tex $(dep_files)
	latexmk -pdf -interaction=nonstopmode $<

$(th_pdfs): %.pdf: %.tex shared_th.tex $(dep_files)
	latexmk -pdf -interaction=nonstopmode $<

shared_th.tex: shared_th.pre.tex
	swath -f latex -u u,u < $< > $@

clean:
	latexmk -c
	rm -f $(th_texs) *.synctex.gz

cleanall: clean
	rm -f $(pdfs)
