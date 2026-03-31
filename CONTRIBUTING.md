<p align="center">
  <h1 align="center">🤝 Contributing</h1>
  <p align="center"><b>Guida al flusso di lavoro</b></p>
</p>

<br>

## 1. 🌿 Struttura dei branch

```
main        ← codice stabile e consegnabile (protetto)
 └── dev    ← integrazione continua del lavoro (protetto)
      └── feature/...   ← branch di lavoro per ogni task
```

> | Branch | Scopo | Protezione |
> |--------|-------|------------|
> | `main` | Versione finale di ogni assignment | Push diretto **bloccato**, solo PR con review |
> | `dev` | Lavoro in corso sull'assignment attivo | Push diretto **bloccato**, solo PR con review |
> | `feature/*` | Branch temporanei per le singole task | Creati da `dev`, eliminati dopo il merge |

<br>

## 2. 🏷️ Convenzione di naming dei branch

Ogni branch di lavoro parte da `dev` e segue questo formato:

```
<tipo>/<numero-issue>-<breve-descrizione>
```

<details>
<summary>📋 <b>Tipi consentiti</b></summary>

<br>

| Tipo | Uso |
|------|-----|
| `feature/` | Nuova funzionalità o sezione del documento |
| `fix/` | Correzione di errori |
| `docs/` | Modifiche esclusivamente alla documentazione |
| `refactor/` | Ristrutturazione senza cambiare il risultato |

</details>

**Esempi:**

```
feature/12-personas
docs/7-descrizione-problema
fix/15-errore-tabella-task
refactor/20-struttura-latex
```

<br>

## 3. 💬 Convenzione dei commit

Ogni messaggio di commit segue il formato:

```
<tipo>(<scope>): <descrizione breve>
```

| Parametro | Regola |
|-----------|--------|
| **tipo** | `feat` · `fix` · `docs` · `refactor` · `style` · `chore` |
| **scope** | componente interessata (es. `personas`, `latex`, `webapp`, `empowerment`) |
| **descrizione** | verbo all'imperativo, minuscolo, senza punto finale |

<details>
<summary>📋 <b>Esempi di commit</b></summary>

<br>

```
feat(personas): aggiungi persona Marco il turista occasionale
docs(latex): correggi struttura sezione analisi task
fix(empowerment): sistema calcolo indicatori scala 1-5
chore(repo): aggiorna gitignore per build artifacts
style(latex): uniforma formattazione tabelle
refactor(webapp): estrai componente mappa AR
```

</details>

<br>

## 4. 📌 Gestione del lavoro con Milestone e Issue

### 🎯 Milestone = Assignment

Ogni assignment del corso corrisponde a una **Milestone** su GitHub:
- `Assignment 1 — User & Task Analysis`
- `Assignment 2 — ...`

### 🎫 Issue = Task

Ogni task da completare è una **Issue** assegnata alla milestone corrispondente.

> **Ogni issue deve avere:**
>
> | Campo | Descrizione |
> |-------|-------------|
> | **Titolo** | chiaro e specifico |
> | **Assegnee** | chi la svolge |
> | **Milestone** | a quale assignment appartiene |
> | **Label** | *(opzionale)* `documentation`, `feature`, `bug`, ecc. |

<br>

## 5. 🔄 Workflow completo (passo per passo)

### A. Iniziare una task

```bash
# 1. Assicurati di essere su dev aggiornato
git checkout dev
git pull origin dev

# 2. Crea il branch dalla issue (es. Issue #12 "Creare personas")
git checkout -b feature/12-personas
```

### B. Lavorare sulla task

```bash
# Lavora e committa seguendo la convenzione
git add .
git commit -m "feat(personas): aggiungi persona Marco il turista occasionale"

# Pusha il branch
git push origin feature/12-personas
```

### C. Chiedere la review (PR su dev)

> 1. Vai su GitHub → **Pull Requests** → **New Pull Request**
> 2. Base: `dev` ← Compare: `feature/12-personas`
> 3. Titolo: `feat(personas): aggiungi persona Marco (#12)`
> 4. Nella descrizione:
>    - Descrivi cosa è stato fatto
>    - Collega la issue: `Closes #12`
> 5. Assegna l'altro membro come **Reviewer**
> 6. ⏳ **Attendi l'approvazione** — il merge è bloccato senza review

### D. Chiudere l'assignment (PR su main)

Quando tutte le issue della milestone sono completate e mergiate in `dev`:

> 1. Crea una PR: Base: `main` ← Compare: `dev`
> 2. Titolo: `release: Assignment 1 completato`
> 3. Review obbligatoria dell'altro membro
> 4. Dopo il merge, chiudi la **Milestone** su GitHub

<br>

## 6. 🗺️ Riepilogo visivo del flusso

```
  Issue #12 creata nella Milestone "Assignment 1"
           │
           ▼
    git checkout dev
    git checkout -b feature/12-personas
           │
           ▼
    ┌─────────────────────┐
    │  Lavoro + Commit    │
    │  seguendo le        │
    │  convenzioni        │
    └─────────┬───────────┘
              ▼
    PR: feature/12-personas → dev
    Review obbligatoria ✅
    Merge + elimina branch
              │
              ▼
    (ripeti per ogni issue della milestone)
              │
              ▼
    PR: dev → main
    Review obbligatoria ✅
    Merge + chiudi Milestone
```
