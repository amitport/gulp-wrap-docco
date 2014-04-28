# gulp-wrap [![NPM version][npm-image]][npm-url] [![Build status][travis-image]][travis-url]
> A gulp plugin to convert code into html using docco's parser, marked, highlight.js and lodash.template

## Usage

First, install `gulp-wrap-docco` as a development dependency:

```shell
npm install --save-dev gulp-wrap-docco
```

Then, add it to your `gulpfile.js`:

```javascript
var wrapDocco = require('gulp-wrap-docco');
 
gulp.task('wrapDocco', function(){
  gulp.src(...)
  	.pipe(wrapDocco({src: 'template.html'}));
    .pipe(gulp.dest(...));
});
```

## API

gulp-wrap-docco is a ```function(options)``` that returns a ```read-write stream```.
The _options_ argument can be either a [lodash.template](http://lodash.com/docs#template) string 
or an object with a ```src``` property pointing to a file that contains such a template.

**default** options = {src: 'lib/default.template.html'}

[travis-url]: http://travis-ci.org/amitport/gulp-wrap-docco
[travis-image]: https://secure.travis-ci.org/amitport/gulp-wrap-docco.png?branch=master
[npm-url]: https://npmjs.org/package/gulp-wrap-docco
[npm-image]: https://badge.fury.io/js/gulp-wrap-docco.png
