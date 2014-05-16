filename=formeln


read:
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex
	xdg-open ${filename}.pdf &

bib:
	pdflatex ${filename}.tex; bibtex ${filename}.aux; 
	xdg-open ${filename}.pdf &

all:  
	pdflatex ${filename}.tex; bibtex ${filename}.aux; 
	#makeindex -s ${filename}.ist -t ${filename}.glg -o ${filename}.gls ${filename}.glo; # Glossar
	#makeindex A.idx;
	#makeindex B.idx;
	#makeindex ${filename}.idx; # falls nur ein Index existiert
	pdflatex ${filename}.tex; pdflatex ${filename}.tex;
	xdg-open ${filename}.pdf &

images:
	for datei in $$(ls *pnm | cut -d \. -f 1) ; do make $$datei.ps ; done

cleanall:
	rm -f *.aux *.toc *.bbl *.idx *.ilg *.ind *.log *.toc *.blg *.out *.glg *.glo *.gls *.ist *.maf *.mtc* *.gz *.backup *.lot *.lof *.pdf *.fls

clean:
	rm -f ${filename}.aux ${filename}.toc ${filename}.bbl ${filename}.idx ${filename}.ilg ${filename}.ind ${filename}.log ${filename}.toc ${filename}.blg ${filename}.out ${filename}.glg ${filename}.glo ${filename}.gls ${filename}.ist ${filename}.maf ${filename}.mtc ${filename}.gz ${filename}.backup ${filename}.lot ${filename}.lof ${filename}.fls

