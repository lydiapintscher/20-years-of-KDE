20 Years of KDE: Past, Present and Future
=========================================

This is the repository for the 20 Years of KDE book. You can find the LaTeX
source of the book here.

## Building a PDF

To build a pdf file out of the LaTeX source install pdflatex and run the
command

    make

If you don't have make, you can run:

    pdflatex 20yearsofKDE

To build all other formats run:

    make all

## Updating the book after changes

If you have made local changes to the source of the book and want to render
a PDF again:

    make clean
    make

## License

The book and its content is licenced under CC-BY-SA. For questions about the
book contact Lydia Pintscher at lydia@kde.org.
