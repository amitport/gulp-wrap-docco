var groupAggregatePlugin = require('../');
var assert = require('assert');
var gutil = require('gulp-util');
var fs = require('fs');

require('mocha');

describe('gulp-wrap-docco', function() {
	describe('wrapDoccoPlugin()', function() {
		var expectedFile = new gutil.File({
			path: 'test/expected/code.html',
			contents: fs.readFileSync('test/expected/code.html')
		});

		it('should produce expected file via buffer', function (done) {
			var srcFile = new gutil.File({
				path: 'test/fixtures/code.coffee',
				contents: fs.readFileSync('test/fixtures/code.coffee')
			});

			var stream = groupAggregatePlugin();

			stream.on('error', function (err) {
				assert(err);
				done(err);
			});

			stream.on('data', function (newFile) {
				assert(newFile);
				assert(newFile.contents);

				assert.equal(String(newFile.contents), String(expectedFile.contents));
				done();
			});

			stream.write(srcFile);
			stream.end();
		});

	});
});