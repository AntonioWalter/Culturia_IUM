# ────────────────────────────────────────────────────────────
# Culturia IUM — LaTeX Build System (Assignment 3)
# ────────────────────────────────────────────────────────────
# Usage:
#   make          → compila il PDF (output in ../assignment3.pdf)
#   make clean    → rimuove la cartella build e il PDF
# ────────────────────────────────────────────────────────────

MAIN      = main
BUILD_DIR = build
OUT_DIR   = ..
OUT_PDF   = $(OUT_DIR)/assignment3.pdf

# Path per MacTeX su macOS
export PATH := $(PATH):/Library/TeX/texbin:/usr/local/bin:/usr/bin

# Tutti i sorgenti
TEX_FILES = $(MAIN).tex $(wildcard chapters/*.tex) bibliography.bib

.PHONY: all clean

all: $(OUT_PDF)

$(OUT_PDF): $(TEX_FILES)
	@mkdir -p $(BUILD_DIR)
	@echo "⌛ Compilazione (Pass 1 - Lettura document)..."
	@pdflatex -interaction=nonstopmode -halt-on-error \
		-output-directory=$(BUILD_DIR) \
		-synctex=0 \
		$(MAIN).tex > /dev/null || true
	@echo "⌛ Generazione Bibliografia (BibTeX)..."
	@cp bibliography.bib $(BUILD_DIR)/ 2>/dev/null || true
	@cd $(BUILD_DIR) && bibtex $(MAIN) > /dev/null 2>&1 || true
	@echo "⌛ Compilazione (Pass 2 - Inclusione citazioni)..."
	@pdflatex -interaction=nonstopmode -halt-on-error \
		-output-directory=$(BUILD_DIR) \
		-synctex=0 \
		$(MAIN).tex > /dev/null || true
	@echo "⌛ Compilazione (Pass 3 - Finalizzazione riferimenti)..."
	@pdflatex -interaction=nonstopmode -halt-on-error \
		-output-directory=$(BUILD_DIR) \
		-synctex=0 \
		$(MAIN).tex > /dev/null
	@cp $(BUILD_DIR)/$(MAIN).pdf $(OUT_PDF)
	@echo "✅  PDF generato: $(OUT_PDF)"

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f $(OUT_PDF)
	@echo "🧹  Build pulita."
