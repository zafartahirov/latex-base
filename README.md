Latex Base
===

This is a general buildflow for latex-based papers. Just place your `sty` files under the [sty](sty) directory, and run `make`.

Setup
---

The main file that will be processed is [`main.tex`](main.tex), located in the root directory. I usually place all the source files under [`src`](src) directory, and just use `\input{filename}` in the `main.tex`. If you want to rename your main file, just modify the [`Makefile`](Makefile):

```
MAIN=main
```

to

```
MAIN=some_other_filename
```

I also place all the "prelimiinary" text or setup in the [`preliminary.tex`](prelimiinary.tex) file, but you don't have to.

Dependencies
---

* texlive
* latexmk
