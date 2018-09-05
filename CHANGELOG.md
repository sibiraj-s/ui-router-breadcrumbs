# CHANGELOG

All notable changes to this project will be documented in this file.

> **Tags**
> - Features
> - Bug Fixes
> - Performance Improvements
> - Dependency Updates
> - Breaking Changes
> - Documentation
> - Internal

## Unreleased

#### Dependency Updates

* update eslint to v5.5.0 ([14237d4](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/14237d4))
* update grunt-contrib-uglify to v4.0.0 ([14237d4](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/14237d4))
* update grunt-cofeelintr to v1.1.1 ([3c0125dc](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/3c0125dc))

#### Internal

* apply standardjs rules to eslint ([738c2d5](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/738c2d5))
* use two space indentation instead of four ([5d4e534](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/5d4e534))

## v1.2.2 (2018-07-27)

Just a Maintenance Patch

#### Internal

* use eslint to lint javascript files ([fec093f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/fec093f))
* prevent direct execution of `npm publish` ([fec093f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/fec093f))
* remove commitizen and cz-conventional-changelog dependencies ([fec093f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/fec093f))
* run travis builds in trusty environments ([fec093f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/fec093f))
* replace grunt-coffeelint with grunt-coffeelintr ([fec093f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/fec093f))

## v1.2.1 (2018-07-16)

#### Internal

* remove pullapprove
* migrate to travis-ci.com

#### Dependency Updates

* update devDependencies, which removes vulnerable packages
* updated dependencies in demo page

## v1.2.0 (2018-05-08)

#### Features

* add `active` class to active breadcrumbs ([f49b16f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/f49b16f))

#### Internal

* style tweaks for docs

#### Dependency Updates

* update devDependencies

#### Breaking Changes

* refactor the HTML snippet and styles for breadcrumbs ([f49b16f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/f49b16f))

## v1.1.6 (2018-03-27)

#### Internal

* add post build scripts ([0f345b6](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/0f345b6))
* add shebang lines to shell scritps ([674dfda](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/674dfda))
* use yarn instead of npm ([b8cd5dd](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/b8cd5dd))

#### Dependency Updates

* update devDependencies ([176a47f](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/176a47f))
* update dependencies in demo page ([18af54e](https://github.com/Sibiraj-S/ui-router-breadcrumbs/commit/18af54e))

## v1.1.5 (2017-11-28)

#### INTERNAL

* drop bower support
* publish only `dist/` folder to npm
* move dependencies to peerDependencies

#### Dependency Updates

* update cz-conventional-changelog to v2.1.0
* update grunt-contrib-uglify to v3.2.1
* update grunt-contrib-coffee to v2.0.0

#### BREAKING CHANGES

* bower installations will not be supported anymore, use npm or yarn

## v1.1.4 (2017-08-28)

#### Breaking Changes

The label is now given as

```js
.state('app.home', {
    url: '/home',
    data: {
      label: 'Home', //label to show in breadcrumbs
    },
    templateUrl: 'templates/home.html'
})
```

## v1.1.3 (2017-07-07)

#### Bug Fixes

* fixes the dependency injection error with the minified js in previous release
* prevent throwing error when strict-di mode is enabled

## v1.1.2 (2017-07-07)

#### Performance Improvements

* follow modular/syntax approach for ui-router-breadcrumbs module

## v1.1.1 (2017-07-07)

#### Internal

* fix invalid bower dependency for angular-ui-router

## v1.1.0 (2017-07-06)

#### Performance Improvements 

* Improves stability 

#### Bug Fixes

* Fixed breadcrumbs not generated in few applications

## v1.0.5 (2017-07-05)

#### Bug Fixes

* Prevent multiple function to update breadcrumb call on page load

## v1.0.4 (2017-07-05)

#### Bug Fixes

* renders breadcrumb correctly on statechange
* abstract classes are now parsed as boolean
* an error in loop is now fixed

## v1.0.3 (2017-07-05)

#### Performance Improvements

* state transitions are now watched within the directive

## v1.0.2 (2017-07-04)

#### Documentation

* update documentation

## v1.0.1 (2017-07-04)

#### Documentation

* update broken links in demo

## v1.0.0 (2017-07-04)

#### Features

Initial Release. Dynamic breadcrumbs for angular apps using ui.router
