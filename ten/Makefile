main: ten_oneside.pdf ten_twoside.pdf

%.pdf: %.tex
	latexmk -pdf -interaction=nonstopmode $<
	latexmk -c
clean:
	latexmk -c
