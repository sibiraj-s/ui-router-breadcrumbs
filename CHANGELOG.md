# CHANGELOG

All notable changes to this project will be documented in this file.

> **Tags**
>
> - Features
> - Bug Fixes
> - Performance Improvements
> - Dependency Updates
> - Breaking Changes
> - Documentation
> - Internal

## v2.0.1 (2020-12-14)

#### Internal

- update LICENSE ([6dd0f1e](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/6dd0f1e))

## v2.0.0 (2020-01-03)

#### Internal

- add karma-jasmine unit tests ([69b5718](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/69b5718))
- migrate to github-actions from travis-ci ([4219f41](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/4219f41))
- use browser-sync instead of grunt connect ([5447ff0](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/5447ff0))
- remove grunt-eslint in favour of eslint ([f798f4f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/f798f4f))
- cleanup build steps ([aca03be](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/aca03be))
- update LICENSE ([f3d5256](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/f3d5256))
- remove grunt-ng-annotate ([55d4aca](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/55d4aca))
- remove angular-sanitize dependency ([3dc9a0b](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3dc9a0b))

#### Dependency Updates

- update cdn dependencies ([43a9118](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/43a9118))
- bump devDependencies ([3dc9a0b](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3dc9a0b))

#### Breaking Changes

- rename `breadcrumbconfigProvider` to `breadcrumbProvider` ([ece479c](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/ece479c))
- use `angular.forEach` instead of `Array.forEach` for better browser compatibility ([ece479c](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/ece479c))

```js
const config = breadcrumbProvider => {
  breadcrumbProvider.configure({
    abstract: true
  });
};

config.$inject = ['breadcrumbProvider'];
app.config(config);
```

- `abstract` option in directive is no longer supported, use `breadcrumbProvider` to configure

## v1.2.4 (2018-12-29)

#### Internal

- update angular.js to v1.7.5 in demo page ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))
- update angularjs-sanitize to v1.7.5 in demo page ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))
- extend LICENSE to year 2019 ([fb51953](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fb51953))
- replace `eslint-config-standard` with `eslint-config-airbnb-base` ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))
- replace `grunt-contrib-sass` with `grunt-sass`
- migrate from `unpkg` cdn to `jsdelivr` ([a343feb](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/a343feb))

#### Dependency Updates

- update husky to v1.3.1 ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))
- update eslint to v5.11.1 ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))
- update grunt-coffeelintr to v1.1.2 ([3b63453](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3b63453))

## v1.2.3 (2018-10-05)

#### Dependency Updates

- update grunt-contrib-uglify to v4.0.0 ([14237d4](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/14237d4))
- update grunt-cofeelintr to v1.1.1 ([3c0125dc](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/3c0125dc))
- update eslint to v5.6.1 ([230e92d](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/230e92d))
- update eslint-plugin-promise to v4.0.1 ([230e92d](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/230e92d))
- update grunt-contrib-connect to v2.0.0 ([230e92d](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/230e92d))
- update grunt-contrib-cssmin to v3.0.0 ([230e92d](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/230e92d))
- update husky to v1.1.0 ([230e92d](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/230e92d))

#### Internal

- apply standardjs rules to eslint ([738c2d5](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/738c2d5))
- use two space indentation instead of four ([5d4e534](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/5d4e534))
- remove vscode settings in favour of editorconfig ([1f6333a](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/1f6333a))
- update github username ([31bba58](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/31bba58))

## v1.2.2 (2018-07-27)

Just a Maintenance Patch

#### Internal

- use eslint to lint javascript files ([fec093f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fec093f))
- prevent direct execution of `npm publish` ([fec093f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fec093f))
- remove commitizen and cz-conventional-changelog dependencies ([fec093f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fec093f))
- run travis builds in trusty environments ([fec093f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fec093f))
- replace grunt-coffeelint with grunt-coffeelintr ([fec093f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/fec093f))

## v1.2.1 (2018-07-16)

#### Internal

- remove pullapprove
- migrate to travis-ci.com

#### Dependency Updates

- update devDependencies, which removes vulnerable packages
- updated dependencies in demo page

## v1.2.0 (2018-05-08)

#### Features

- add `active` class to active breadcrumbs ([f49b16f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/f49b16f))

#### Internal

- style tweaks for docs

#### Dependency Updates

- update devDependencies

#### Breaking Changes

- refactor the HTML snippet and styles for breadcrumbs ([f49b16f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/f49b16f))

## v1.1.6 (2018-03-27)

#### Internal

- add post build scripts ([0f345b6](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/0f345b6))
- add shebang lines to shell scritps ([674dfda](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/674dfda))
- use yarn instead of npm ([b8cd5dd](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/b8cd5dd))

#### Dependency Updates

- update devDependencies ([176a47f](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/176a47f))
- update dependencies in demo page ([18af54e](https://github.com/sibiraj-s/ui-router-breadcrumbs/commit/18af54e))

## v1.1.5 (2017-11-28)

#### INTERNAL

- drop bower support
- publish only `dist/` folder to npm
- move dependencies to peerDependencies

#### Dependency Updates

- update cz-conventional-changelog to v2.1.0
- update grunt-contrib-uglify to v3.2.1
- update grunt-contrib-coffee to v2.0.0

#### BREAKING CHANGES

- bower installations will not be supported anymore, use npm or yarn

## v1.1.4 (2017-08-28)

#### Breaking Changes

The label is now given as

```js
$stateProvider.state('app.home', {
  url: '/home',
  data: {
    label: 'Home' //label to show in breadcrumbs
  },
  templateUrl: 'templates/home.html'
});
```

## v1.1.3 (2017-07-07)

#### Bug Fixes

- fixes the dependency injection error with the minified js in previous release
- prevent throwing error when strict-di mode is enabled

## v1.1.2 (2017-07-07)

#### Performance Improvements

- follow modular/syntax approach for ui-router-breadcrumbs module

## v1.1.1 (2017-07-07)

#### Internal

- fix invalid bower dependency for angular-ui-router

## v1.1.0 (2017-07-06)

#### Performance Improvements

- Improves stability

#### Bug Fixes

- Fixed breadcrumbs not generated in few applications

## v1.0.5 (2017-07-05)

#### Bug Fixes

- Prevent multiple function to update breadcrumb call on page load

## v1.0.4 (2017-07-05)

#### Bug Fixes

- renders breadcrumb correctly on statechange
- abstract classes are now parsed as boolean
- an error in loop is now fixed

## v1.0.3 (2017-07-05)

#### Performance Improvements

- state transitions are now watched within the directive

## v1.0.2 (2017-07-04)

#### Documentation

- update documentation

## v1.0.1 (2017-07-04)

#### Documentation

- update broken links in demo

## v1.0.0 (2017-07-04)

#### Features

Initial Release. Dynamic breadcrumbs for angular apps using ui.router
