const loadAngularModule = (appName, breadcrumbConfig) => {
  const config = ($stateProvider, breadcrumbProvider) => {
    breadcrumbProvider.configure(breadcrumbConfig);

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
          template: '',
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
          template: '',
        },
      },
    };

    $stateProvider.state(appState);
    $stateProvider.state(homeState);
    $stateProvider.state(usageState);
  };

  config.$inject = ['$stateProvider', 'breadcrumbProvider'];
  const app = angular.module(appName, ['ui.router', 'uiBreadcrumbs']);
  app.config(config);

  return app;
};

describe('ui.breadcrumbs `abstract` false', () => {
  loadAngularModule('app', { abstract: false });

  beforeEach(module('app'));
  let $compile;
  let $rootScope;
  let $state;

  beforeEach(inject(($injector) => {
    $compile = $injector.get('$compile');
    $rootScope = $injector.get('$rootScope');
    $state = $injector.get('$state');
  }));

  it('should respond to the url', () => {
    expect($state.href('app.home')).toEqual('#!/home');
  });

  it('should set the render breadcrumbs correctly', () => {
    const template = '<ui-breadcrumb></ui-breadcrumb>';
    const element = $compile(template)($rootScope);
    $rootScope.$digest();

    $state.go('app.home');
    $rootScope.$digest();

    $rootScope.$broadcast('$viewContentLoaded');
    $rootScope.$digest();

    expect(element[0].querySelectorAll('li').length).toBe(1);
    expect(element[0].querySelectorAll('li')[0].textContent).not.toContain('App');
    expect(element[0].querySelectorAll('li')[0].textContent).toContain('Home');

    $state.go('app.home.usage');
    $rootScope.$digest();

    $rootScope.$broadcast('$viewContentLoaded');
    $rootScope.$digest();

    expect(element[0].querySelectorAll('li').length).toBe(2);
    expect(element[0].querySelectorAll('li')[1].textContent).toContain('Usage');
  });
});

describe('ui.breadcrumbs `abstract` true', () => {
  loadAngularModule('abstractApp', { abstract: true });

  beforeEach(module('abstractApp'));
  let $compile;
  let $rootScope;
  let $state;

  beforeEach(inject(($injector) => {
    $compile = $injector.get('$compile');
    $rootScope = $injector.get('$rootScope');
    $state = $injector.get('$state');
  }));

  it('should set the render breadcrumbs correctly', () => {
    const template = '<ui-breadcrumb></ui-breadcrumb>';
    const element = $compile(template)($rootScope);
    $rootScope.$digest();

    $state.go('app.home');
    $rootScope.$digest();

    $rootScope.$broadcast('$viewContentLoaded');
    $rootScope.$digest();

    expect(element[0].querySelectorAll('li').length).toBe(2);
    expect(element[0].querySelectorAll('li')[0].textContent).toContain('App');
    expect(element[0].querySelectorAll('li')[1].textContent).toContain('Home');
  });
});
