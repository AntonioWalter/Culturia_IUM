# 📄 Documentazione — Guida alla compilazione LaTeX

Ogni assignment contiene una cartella `latex/` con i sorgenti e produce il PDF finale nella cartella dell'assignment stesso.

```
assignment1/
├── assignment1.pdf        ← PDF compilato (output)
└── latex/
    ├── main.tex           ← sorgente LaTeX
    ├── Makefile           ← build macOS / Linux
    ├── build.bat          ← build Windows
    ├── .latexmkrc         ← configurazione latexmk
    ├── build/             ← artefatti di compilazione (git-ignored)
    └── img/               ← immagini del documento
```

---

## 1. Installazione del compilatore LaTeX

### 🍎 macOS

**Opzione consigliata — MacTeX (distribuzione completa):**

1. Vai su [https://tug.org/mactex/](https://tug.org/mactex/)
2. Scarica **MacTeX.pkg** (~5 GB, include tutto)
3. Apri il `.pkg` e segui l'installazione guidata
4. Verifica aprendo il Terminale:
   ```bash
   pdflatex --version
   latexmk --version
   ```

**Opzione leggera — BasicTeX + pacchetti manuali:**

```bash
brew install --cask basictex
# Riavvia il terminale, poi installa i pacchetti mancanti:
sudo tlmgr update --self
sudo tlmgr install latexmk collection-langitalian booktabs enumitem titlesec fancyhdr parskip cm-super
```

---

### 🪟 Windows

**Opzione consigliata — MiKTeX:**

1. Vai su [https://miktex.org/download](https://miktex.org/download)
2. Scarica l'**installer** per Windows
3. Durante l'installazione:
   - Seleziona **"Install missing packages on-the-fly: Yes"** (scaricherà automaticamente i pacchetti necessari)
   - Scegli installazione per l'utente corrente
4. Dopo l'installazione, apri **MiKTeX Console** → **Updates** → aggiorna tutto
5. Installa `latexmk` da MiKTeX Console → **Packages** → cerca "latexmk" → installa
6. Verifica aprendo il **Prompt dei comandi**:
   ```cmd
   pdflatex --version
   latexmk --version
   ```

**Opzione alternativa — TeX Live:**

1. Vai su [https://tug.org/texlive/acquire-netinstall.html](https://tug.org/texlive/acquire-netinstall.html)
2. Scarica `install-tl-windows.exe`
3. Esegui e seleziona l'installazione completa (~5 GB)
4. Verifica come sopra

> **Nota:** Se `latexmk` non viene riconosciuto su Windows con MiKTeX, assicurati che sia installato Perl. Scaricalo da [https://strawberryperl.com/](https://strawberryperl.com/).

---

## 2. Compilazione del documento

### macOS / Linux

```bash
cd docs/documentazione/assignment1/latex

make            # compila → genera ../assignment1.pdf
make clean      # rimuove build/ e il PDF
make watch      # ricompila automaticamente ad ogni modifica salvata
```

### Windows

```cmd
cd docs\documentazione\assignment1\latex

build.bat             REM compila → genera ..\assignment1.pdf
build.bat clean       REM rimuove build\ e il PDF
build.bat watch       REM ricompila automaticamente ad ogni modifica
```

---

## 3. Aggiungere un nuovo assignment

Per creare la struttura per un nuovo assignment (es. `assignment2`):

1. Copia la cartella `assignment1/latex/` in `assignment2/latex/`
2. Rinomina il riferimento nel `Makefile` / `build.bat`:
   - `OUT_PDF = $(OUT_DIR)/assignment2.pdf` (Makefile)
   - `copy build\main.pdf ..\assignment2.pdf` (build.bat)
3. Aggiorna titolo e header in `main.tex`

---

## Troubleshooting

| Problema | Soluzione |
|----------|-----------|
| `latexmk: command not found` | Installa `latexmk` tramite `tlmgr install latexmk` (macOS) o MiKTeX Console (Windows) |
| `pdflatex: command not found` | La distribuzione LaTeX non è installata o non è nel PATH |
| Pacchetto LaTeX mancante | macOS: `sudo tlmgr install <pacchetto>` · Windows con MiKTeX: si installa automaticamente |
| Errore di compilazione | Esegui `make clean` / `build.bat clean` e ricompila |
| `latexmk` non funziona su Windows | Installa Perl da [strawberryperl.com](https://strawberryperl.com/) |
