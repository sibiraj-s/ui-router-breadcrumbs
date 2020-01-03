# ui-router-breadcrumbs [![Tests](https://github.com/sibiraj-s/ui-router-breadcrumbs/workflows/Tests/badge.svg)](https://github.com/sibiraj-s/ui-router-breadcrumbs/actions)

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

Import the modules required for ui-router-breadcrumbs.

```html
<-- styles -->
<link rel="stylesheet" href="ui-router-breadcrumbs.min.css" />

<-- scripts -->
<script src="angular.min.js"></script>
<script src="angular-ui-router.min.js"></script>
<script src="ui-router-breadcrumbs.min.js"></script>
```

add `uiBreadcrumbs` dependency to the module

```js
angular.module('myApp', ['uiBreadcrumbs']);
```

in routes config

```js
$stateProvider.state('app.home', {
  url: '/home',
  data: {
    label: 'Home' //label to show in breadcrumbs
  },
  templateUrl: 'templates/home.html'
});
```

and in your html

```html
<ui-breadcrumb></ui-breadcrumb>
```

### Options

you can specify to show or hide abstract states

```js
const config = breadcrumbProvider => {
  breadcrumbProvider.configure({
    abstract: true
  });
};

config.$inject = ['breadcrumbProvider'];
app.config(config);
```

[npm]: https://www.npmjs.com/
[yarn]: https://yarnpkg.com/lang/en/
[ui-router-breadcrumbs]: https://github.com/sibiraj-s/ui-router-breadcrumbs
[demo]: https://sibiraj-s.github.io/ui-router-breadcrumbs/
