all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

html: resume.html
resume.html: style.css resume.md templates/boilerplate.html
	pandoc --smart  \
        --from markdown --to html \
		-o _fragment.html resume.md
	gsed -nf templates/ssi.sed templates/boilerplate.html | gsed 'N;N;s/\n//' | gsed -f - templates/boilerplate.html > resume.html
	rm _fragment.html


docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

clean:
	@rm -f resume.html resume.tex *.tuc *.log *.pdf *.docx *.rtf _fragment.html
