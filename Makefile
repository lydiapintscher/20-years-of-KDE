default: pdf
all: pdf mobi epub

# 10-12" screen readers, tablets, etc
pdf: 20yearsofKDE.pdf

# only really useful as a e-reader pre-stage
html: 20yearsofKDE.html

# recommended for Amazon Kindle 7/8" screen readers
mobi: 20yearsofKDE.mobi

# for everyone elses 7/8" screen readers
epub: 20yearsofKDE.epub

AUTHORS = "Lydia Pintscher"
COVER 	= "frontcover.jpg"

####### Helpers #######

%.pdf: %.tex *.tex
	pdflatex $<
	pdflatex $<

%.html:	%.tex *.tex
	htlatex $< "xhtml,fn-in"

%.epub:	%.html
	# requires calibre
	ebook-convert $< $(basename $<).epub \
		--cover $(COVER) \
		--authors $(AUTHORS) \
		--change-justification justify

%.mobi:	%.html
	# requires calibre
	ebook-convert $< $(basename $<).mobi \
		--cover $(COVER) \
		--authors $(AUTHORS) 

clean:
	-rm -rf 20yearsofKDE.pdf 20yearsofKDE.log 20yearsofKDE.toc 20yearsofKDE.aux
	-rm -rf 20yearsofKDE.out 20yearsofKDE.tdo 20yearsofKDE.xmpi
	-rm -rf 20yearsofKDE*.html 20yearsofKDE.css 20yearsofKDE.4* 20yearsofKDE.idv
	-rm -rf 20yearsofKDE.lg 20yearsofKDE.dvi 20yearsofKDE.tmp 20yearsofKDE.toc 20yearsofKDE.xref
	-rm -rf 20yearsofKDE.epub 20yearsofKDE.mobi
	-find . -name "*.aux" -and -not -path ./.git -prune | xargs rm -f
