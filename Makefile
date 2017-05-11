tenth_doc_th.pdf: tenth_doc_th.ttex
	latexmk -pdf -interaction=nonstopmode tenth_doc_th.ttex
	latexmk -c
tenth_doc_th.ttex: tenth_doc_th.tex
	swath -f latex -u u,u < tenth_doc_th.tex > tenth_doc_th.ttex
clean:
	latexmk -c
	rm -rf tenth_doc_th.ttex tenth_doc_th.pdf
