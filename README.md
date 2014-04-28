# gulp-wrap-docco [![NPM version][npm-image]][npm-url] [![NPM dep][npm-dep-image]][npm-dep-url] [![Build status][travis-image]][travis-url]
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

### Options

**type**: either ```string``` or ```{src: string}```

if ```options``` is a string than it is interperted as a literal [lodash template](http://lodash.com/docs#template).
Otherwise ```options.src``` is expected to contain a path to a file that contains a template.


**default**: ```{src: 'lib/default.template.html'}```

[travis-url]: http://travis-ci.org/amitport/gulp-wrap-docco
[travis-image]: https://secure.travis-ci.org/amitport/gulp-wrap-docco.svg?branch=master
[npm-url]: https://npmjs.org/package/gulp-wrap-docco
[npm-image]: https://badge.fury.io/js/gulp-wrap-docco.svg
[npm-dep-url]: https://david-dm.org/amitport/gulp-wrap-docco
[npm-dep-image]: https://david-dm.org/amitport/gulp-wrap-docco.svg
