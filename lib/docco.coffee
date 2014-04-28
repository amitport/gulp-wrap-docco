
# [Docco](https://github.com/jashkenas/docco) 
# =====
# > Refactored by [@Amit Portnoy](https://github.com/amitport)
#
# **Docco** is a quick-and-dirty documentation generator, written in
# [Literate CoffeeScript](http://coffeescript.org/#literate).
# It produces an HTML document that displays your comments intermingled with your
# code. All prose is passed through
# [Markdown](http://daringfireball.net/projects/markdown/syntax), and code is
# passed through [Highlight.js](http://highlightjs.org/) syntax highlighting.
# This page is the result of running Docco against its own
# [source file](https://github.com/jashkenas/docco/blob/master/docco.litcoffee).


fs          = require 'fs'
path        = require 'path'

marked      = require 'marked'
highlightjs = require 'highlight.js'
highlightjs.configure tabReplace: '  '


marked.setOptions smartypants: yes

languages = JSON.parse fs.readFileSync("#{__dirname}/languages.json")

for ext, l of languages
	l.commentMatcher = ///^\s*#{l.symbol}\s?///
	l.commentFilter = /(^#![/]|^\s*#\{)/

module.exports = (filename, contents) ->

	# ### configure 

	ext = path.extname(filename)
	language = languages[ext]
	if not language 
		throw new Error('Docco cannot find a language associated with files with a \'' + ext + '\' extension')
	if language and language.name is 'markdown'
		codeExt = path.extname(path.basename(filename, ext))
		if codeExt and codeLang = languages[codeExt]
			language = 
				name:     codeLang.name
				symbol:   codeLang.symbol
				literate: yes

	# ### parse

	lines    = contents.split '\n'
	sections = []
	hasCode  = docsText = codeText = ''

	save = ->
		sections.push {docsText, codeText}
		hasCode = docsText = codeText = ''

	if language.literate
		isText = maybeCode = yes
		for line, i in lines
			lines[i] = if maybeCode and match = /^([ ]{4}|[ ]{0,3}\t)/.exec line
				isText = no
				line[match[0].length..]
			else if maybeCode = /^\s*$/.test line
				if isText then language.symbol else ''
			else
				isText = yes
				language.symbol + ' ' + line

	for line in lines
		if line.match(language.commentMatcher) and not line.match(language.commentFilter)
			save() if hasCode
			docsText += (line = line.replace(language.commentMatcher, '')) + '\n'
			save() if /^(---+|===+)$/.test line
		else
			hasCode = yes
			#console.log (/^(\t.*)/.exec(line))?[0].replace /\t/, '\\t-'
			codeText += line + '\n'
	save()

	# ### format sections 

	marked.setOptions {
		highlight: (code, lang) ->
			lang or= language.name

			if highlightjs.getLanguage(lang)
				highlightjs.fixMarkup(highlightjs.highlight(lang, code).value)
			else
				console.warn "docco: couldn't highlight code block with unknown language '#{lang}' in #{source}"
				code
	}

	for section, i in sections
		code = highlightjs.fixMarkup(highlightjs.highlight(language.name, section.codeText).value)
		code = code.replace(/\s+$/, '')
		section.codeHtml = "<div class='highlight'><pre>#{code}</pre></div>"
		section.docsHtml = marked(section.docsText)

	{sections}