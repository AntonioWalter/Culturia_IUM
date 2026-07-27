# ────────────────────────────────────────────────────────────
# Culturia IUM — LaTeX Build System
# ────────────────────────────────────────────────────────────
# Usage:
#   make          → compila il PDF (output in ../assignment4.pdf)
#   make clean    → rimuove la cartella build
#   make watch    → compila in continuo (richiede latexmk)
# ────────────────────────────────────────────────────────────

MAIN      = main
BUILD_DIR = build
OUT_DIR   = ..
OUT_PDF   = $(OUT_DIR)/assignment4.pdf

.PHONY: all clean watch
TEX_FILES = $(MAIN).tex $(wildcard chapters/*.tex) bibliography.bib

all: $(OUT_PDF)

$(OUT_PDF): $(TEX_FILES)
	@mkdir -p $(BUILD_DIR)
	@echo "⌛ Compilazione (Pass 1 - Lettura document)..."
	@pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(MAIN).tex > /dev/null || true
	@echo "⌛ Generazione Bibliografia (BibTeX)..."
	@bibtex $(BUILD_DIR)/$(MAIN) > /dev/null || true
	@echo "⌛ Compilazione (Pass 2 - Inclusione citazioni)..."
	@pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(MAIN).tex > /dev/null || true
	@echo "⌛ Compilazione (Pass 3 - Finalizzazione riferimenti)..."
	@pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(MAIN).tex > /dev/null
	@cp $(BUILD_DIR)/$(MAIN).pdf $(OUT_PDF)
	@echo "✅  PDF generato: $(OUT_PDF)"

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f $(OUT_PDF)
	@echo "🧹  Build pulita."

watch:
	@mkdir -p $(BUILD_DIR)
	latexmk -pdf -pvc -output-directory=$(BUILD_DIR) $(MAIN).tex
