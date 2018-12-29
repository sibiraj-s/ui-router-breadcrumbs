# ui-router-breadcrumbs [![Build Status](https://travis-ci.com/sibiraj-s/ui-router-breadcrumbs.svg?branch=master)](https://travis-ci.com/sibiraj-s/ui-router-breadcrumbs)

This is a simple directive that creates breadcrumbs on the fly for AngularJs pages using angular-ui-router

live demo [here][demo]

## Getting Started

### Installation

You can directly clone/download [here][ui-router-breadcrumbs]

```bash
git clone git@github.com:sibiraj-s/ui-router-breadcrumbs.git
```

or use cdn

##### Minified

```bash
//cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.min.js
//cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.min.css
```

##### Pretty Printed

```bash
//cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.js
//cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.css
```

or

Install via Package managers such as [npm][npm] or [yarn][yarn]

```bash
npm install ui-router-breadcrumbs --save
# or
yarn add ui-router-breadcrumbs
```

### Usage

Import the modules required for ui-router-breadcrumbs. It is necessary to include [ngSanitize][ngSanitize] and [ui.router][uiRouter] for ui-router-breadcrumbs to work

 ```html
<-- styles -->
<link rel="stylesheet" href="../ui-router-breadcrumbs.min.css">

<-- scripts -->
<script src="angular/angular.min.js"></script>
<script src="angular-sanitize/angular-sanitize.min.js"></script>
<script src="angular-animate/angular-animate.min.js"></script>
<script src="../ui-router-breadcrumbs.min.js"></script>
 ```

add `uiBreadcrumbs` dependency to the module

```js
angular.module('myApp', ['uiBreadcrumbs'])
```

in routes config

```js
.state('app.home', {
    url: '/home',
    data: {
      label: 'Home', //label to show in breadcrumbs
    },
    templateUrl: 'templates/home.html',
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

[uiRouter]: https://ui-router.github.io/
[ngSanitize]: https://docs.angularjs.org/api/ngSanitize
[npm]: https://www.npmjs.com/
[yarn]: https://yarnpkg.com/lang/en/
[github]: https://sibiraj-s.github.io/
[ui-router-breadcrumbs]: https://github.com/sibiraj-s/ui-router-breadcrumbs
[demo]: https://sibiraj-s.github.io/ui-router-breadcrumbs/
