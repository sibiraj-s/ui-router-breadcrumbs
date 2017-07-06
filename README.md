# ui-router-breadcrumbs [![Build Status](https://travis-ci.org/Sibiraj-S/ui-router-breadcrumbs.svg?branch=master)](https://travis-ci.org/Sibiraj-S/ui-router-breadcrumbs)

ui-router-breadcrumbs is a simple directive that creates breadcrumbs on the fly for AngularJs pages using angular-ui-router 1.x

live demo [here][demo]

## Getting Started

### Installation

You can directly clone/download [here][ui-router-breadcrumbs]

```bash
git clone git@github.com:Sibiraj-S/ui-router-breadcrumbs.git
```
or use cdn

##### Minified

```bash
//unpkg.com/ui-router-breadcrumbs@latest/dist/ui-router-breadcrumbs.min.js
//unpkg.com/ui-router-breadcrumbs@latest/dist/ui-router-breadcrumbs.min.css
```

##### Pretty Printed

```bash
//unpkg.com/ui-router-breadcrumbs@latest/dist/ui-router-breadcrumbs.js
//unpkg.com/ui-router-breadcrumbs@latest/dist/ui-router-breadcrumbs.css
```
or

Install via Package managers such as [npm][npm], [yarn][yarn] and [bower][bower]

```bash
npm install ui-router-breadcrumbs --save
# or
yarn add ui-router-breadcrumbs
# or
bower install ui-router-breadcrumbs --save
```

### Usage

Import the modules required for ui-router-breadcrumbs. It is necessary to include [ngSanitize][ngSanitize] and [ui.router][uiRouter] for ui-router-breadcrumbs to work

 ```html
<-- styles -->
<link rel="stylesheet" href="ui-router-breadcrumbs/dist/ui-router-breadcrumbs.min.css">

<-- scripts -->
<script src="angular/angular.min.js"></script>
<script src="angular-sanitize/angular-sanitize.min.js"></script>
<script src="angular-animate/angular-animate.min.js"></script>
<script src="ui-router-breadcrumbs/dist/ui-router-breadcrumbs.min.js"></script>
 ```

add `uiBreadcrumbs` dependency to the module

```js
angular.module('myApp', ['uiBreadcrumbs'])
```

in routes config

```js
.state('app.home', {
    url: '/home',
    label: 'Home', // label to show in breadcrumbs
    templateUrl: 'templates/home.html'
})
```

and in your html
```html
<ui-breadcrumb></ui-breadcrumb>
```

### Options

you can specify to show or hide abstract states

can provide globally as

```js
app.config(['breadcrumbconfigProvider', function(breadcrumbconfigProvider) {
  breadcrumbconfigProvider.setAbstract(false);
}]);
```

or can be provided as attribute in the directive which will override the default configuration

```html
<ui-breadcrumb abstract=true></ui-breadcrumb>
```

## Pull Requests

Send Pull Requests only to `.coffeescript` and `.scss` files only. JS and CSS files are generated by grunt

* **grunt serve** - sets up a local server with livereload

* **grunt develop** - converts coffeescript files to js and watches for changes and enables livereload

* **grunt dist** - converts, annotates, minifies coffeescript to js and also converts and minifies scss to css




[uiRouter]: https://ui-router.github.io/
[ngSanitize]: https://docs.angularjs.org/api/ngSanitize
[npm]: https://www.npmjs.com/
[yarn]: https://yarnpkg.com/lang/en/
[bower]: https://bower.io/
[github]: https://sibiraj-s.github.io/
[ui-router-breadcrumbs]: https://github.com/Sibiraj-S/ui-router-breadcrumbs
[demo]: https://sibiraj-s.github.io/ui-router-breadcrumbs/
