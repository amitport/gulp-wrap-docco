# gulp-wrap [![NPM version][npm-image]][npm-url] [![Build status][travis-image]][travis-url]
> <>

## Usage

First, install `gulp-wrap-docco` as a development dependency:

```shell
npm install --save-dev gulp-wrap-docco
```

Then, add it to your `gulpfile.js`:

```javascript
var wrapDocco = require('gulp-wrap-docco');
 

gulp.task('folderWrap', function(){
  gulp.src(...)
  	.pipe(wrapDocco({...}));
    .pipe(gulp.dest('build'));
});
```

## API

gulp-wrap-docco is a ```function(options)``` that returns a ```read-write stream```. The _options_ argument should include ...


[travis-url]: http://travis-ci.org/amitport/gulp-wrap-docco
[travis-image]: https://secure.travis-ci.org/amitport/gulp-wrap-docco.png?branch=master
[npm-url]: https://npmjs.org/package/gulp-wrap-docco
[npm-image]: https://badge.fury.io/js/gulp-wrap-docco.png
