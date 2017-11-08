var app = angular.module('myApp', ['ui.router', 'ngSanitize', 'uiBreadcrumbs']);

app.config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home');

    $urlRouterProvider.when('/', '/home');

    $stateProvider.state('app', {
        abstract: true,
        data: {
          label: 'App',
        }
      })

      .state('app.home', {
        url: '/home',
        data: {
          label: 'Home',
        },
        views: {
          'content@': {
            templateUrl: 'templates/home.html'
          }
        }
      })

      .state('app.home.usage', {
        url: '/usage',
        data: {
          label: 'Usage',
        },
        views: {
          'content@': {
            templateUrl: 'templates/usage.html'
          }
        }
      })

      .state('app.home.usage.options', {
        url: '/options',
        data: {
          label: 'Options',
        },
        views: {
          'content@': {
            templateUrl: 'templates/options.html'
          }
        }
      });

  }
]);
