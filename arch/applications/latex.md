# LaTeX Installation Guide for Writing Academic Papers on Arch Linux

This guide provides a clean, lightweight setup for writing academic documents with LaTeX, especially focused on research
papers in computer science. It avoids bloated metapackages while retaining all essential functionality for serious
document preparation.

---

## 1. Install Core LaTeX Engine and Bibliography Processor

Install the core LaTeX engine and the modern bibliography processor for `biblatex`.

```sh
sudo pacman -S texlive-basic biber
```

**Optional packages that were excluded:**

- `perl-tk` (No need to use the TeX Live package manager’s graphical interface)

---

## 2. Install Additional BibTeX Styles

Provides compatibility with various BibTeX citation styles.

```sh
sudo pacman -S texlive-bibtexextra
```

---

## 3. Install Auxiliary Tools and Recommended Packages

Install auxiliary programs, recommended packages, and common macros.

```sh
sudo pacman -S texlive-binextra perl-file-homedir perl-yaml-tiny texlive-latexrecommended wdiff
```

**Optional packages that were excluded:**

- `dialog` (Not needed unless configuring TeX Live via the `texconfig` menu interface)
- `ed` (Not needed unless using `texconfig`, which requires this legacy text editor)
- `java-runtime` (No need to use LaTeX automation or template generation tools like `arara` or `texplate`)
- `perl-ipc-system-simple` (No need to auto-generate Git commit logs when they can be copied manually)
- `perl-tk` (No need to use the graphical interface for LaTeX documentation browsing)

**Packages likely provided by the base system or desktop environment:**

- `python`

---

## 4. Install Additional Font Packages

Installs extra fonts used by certain LaTeX packages, including `fontawesome5`.

```sh
sudo pacman -S texlive-fontsextra
```

---

## 5. Install Font Support

Provides commonly expected fonts in academic documents and templates.

```sh
sudo pacman -S texlive-fontsrecommended
```

---

## 6. Install Fundamental LaTeX Macros

Essential macros and class files for basic LaTeX documents.

```sh
sudo pacman -S texlive-latex
```

---

## 7. Install Additional LaTeX Packages and Syntax Highlighting Tools

Extends LaTeX functionality with commonly used community packages and enables syntax highlighting via `minted`.

```sh
sudo pacman -S texlive-latexextra python-pygments
```

**Optional packages that were excluded:**

- `java-runtime` (No need to extract annotations from PDF files)

---

## 8. Install Science and Math Packages

This set includes packages relevant to math, science, and computer science environments.

```sh
sudo pacman -S texlive-mathscience
```

---

## 9. Install TikZ, PGF, and Graphics Support

For drawing diagrams, figures, and visual elements in LaTeX documents.

```sh
sudo pacman -S texlive-pictures
```

**Packages likely provided by the base system or desktop environment:**

- `ghostscript`

---

## 10. Install Unicode and Font Engine Support

Install XeTeX for modern font and Unicode support.

```sh
sudo pacman -S texlive-xetex
```
