_ =               require('highland')
processTemplate = require('lodash.template')
docco =           require('./lib/docco')
fs =              require('fs')

# @module gulp-wrap-docco
module.exports = (options = {src: "#{__dirname}/lib/default.template.html"}) -> 
	templateStr = if (typeof(options) is 'object') then fs.readFileSync(options.src, 'utf-8') else options
	templateFn = processTemplate(templateStr)

	return _.pipeline(
		_.map (file) -> 
			file.contents = new Buffer(templateFn(docco(file.path, file.contents.toString())))
			file
	)