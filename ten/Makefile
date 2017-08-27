main: ten_example_oneside_contnum.pdf
	
%.pdf: %.tex
	latexmk -pdf -interaction=nonstopmode $<
	latexmk -c
clean:
	latexmk -c
