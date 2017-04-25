straightdoc_thai.pdf: straightdoc_thai.ttex
	latexmk -pdf -interaction=nonstopmode straightdoc_thai.ttex
	latexmk -c
straightdoc_thai.ttex: straightdoc_thai.tex
	swath -f latex -u u,u < straightdoc_thai.tex > straightdoc_thai.ttex
clean:
	rm -f straightdoc_thai.ttex straightdoc_thai.pdf
