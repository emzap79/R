@default_files = ("*.Rnw");
$pdf_mode = 1;
$pdflatex = 'R CMD Sweave %B.Rnw && pdflatex -shell-escape %B';
