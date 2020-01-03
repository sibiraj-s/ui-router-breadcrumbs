const config = ($stateProvider, $urlRouterProvider, breadcrumbProvider) => {
  $urlRouterProvider.otherwise('/home');
  $urlRouterProvider.when('/', '/home');

  breadcrumbProvider.configure({ abstract: false });

  const appState = {
    name: 'app',
    abstract: true,
    data: {
      label: 'App',
    },
  };

  const homeState = {
    name: 'app.home',
    url: '/home',
    data: {
      label: 'Home',
    },
    views: {
      'content@': {
        templateUrl: 'templates/home.html',
      },
    },
  };

  const usageState = {
    name: 'app.home.usage',
    url: '/usage',
    data: {
      label: 'Usage',
    },
    views: {
      'content@': {
        templateUrl: 'templates/usage.html',
      },
    },
  };

  const optionsState = {
    name: 'app.home.usage.options',
    url: '/options',
    data: {
      label: 'Options',
    },
    views: {
      'content@': {
        templateUrl: 'templates/options.html',
      },
    },
  };

  $stateProvider.state(appState);
  $stateProvider.state(homeState);
  $stateProvider.state(usageState);
  $stateProvider.state(optionsState);
};

config.$inject = ['$stateProvider', '$urlRouterProvider', 'breadcrumbProvider'];

const app = angular.module('myApp', ['ui.router', 'uiBreadcrumbs']);
app.config(config);
