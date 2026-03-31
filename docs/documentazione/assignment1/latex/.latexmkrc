# latexmk configuration
$pdf_mode = 1;            # Use pdflatex
$out_dir  = 'build';      # Output directory
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
