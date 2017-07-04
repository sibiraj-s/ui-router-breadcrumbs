var app = angular.module('myApp', ['ui.router', 'ngSanitize', 'uiBreadcrumbs']);

app.config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home');

    $urlRouterProvider.when('/', '/home');

    $stateProvider.state('app', {
        abstract: true,
        label: "App"
      })

      .state('app.home', {
        url: '/home',
        label: 'Home',
        views: {
          'content@': {
            templateUrl: 'templates/home.html'
          }
        }
      })

      .state('app.home.usage', {
        url: '/usage',
        label: 'Usage',
        views: {
          'content@': {
            templateUrl: 'templates/usage.html'
          }
        }
      })

      .state('app.home.usage.options', {
        url: '/options',
        label: 'Options',
        views: {
          'content@': {
            templateUrl: 'templates/options.html'
          }
        }
      })

  }
]);
