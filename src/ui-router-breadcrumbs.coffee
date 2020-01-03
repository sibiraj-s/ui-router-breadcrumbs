'use strict'

# uiBreadcrumbsprovider
$breadcrumbProvider = ->
  defaiultOptions =
    abstract: false

  options = {}

  configure: (opts) ->
    options = angular.extend {}, options, opts
    return

  $get: ->
    options

# breadcrumbsService
$breadcrumbsService = ($state, breadcrumbconfig) ->
  abstract = breadcrumbconfig.abstract

  generateBreadcrumbs: ->
    breadcrumbs = []
    parentStates = []

    # get parent state details
    angular.forEach $state.$current.includes, (_, state) ->
      if state isnt ''
        parentState = $state.get(state).$$state().parent.self
        if parentState.name isnt ''
          if parentState.abstract and not abstract
            return
          parentStates.push parentState
          return

    # add current state to breadcrumbs
    currentState = $state.current
    breadcrumbs = [].concat parentStates, currentState

    return breadcrumbs

# uiBreadcrumb directive
$breadcrumbDirective = ($state, breadcrumbsService) ->
  restrict: 'E',
  replace: true
  template: '<nav aria-label="breadcrumb">'+
  '  <ol class="breadcrumb">'+
  '    <li class="breadcrumb-item" ng-repeat="data in $breadcrumbs" ui-sref-active="active">'+
  '      <a ui-sref="{{data.abstract || data.name}}" ng-class="{disabled: data.abstract}">'+
  '        {{data.data.label || data.name}}'+
  '      </a>'+
  '    </li>'+
  '  </ol>'+
  '</nav>'
  link: (scope) ->
    # fetch breadcrumbs once the view content is updated
    scope.$on '$viewContentLoaded', ->
      scope.$breadcrumbs = breadcrumbsService.generateBreadcrumbs()
      return
    return

# dependency injection
$breadcrumbProvider.$inject = []
$breadcrumbsService.$inject = ['$state', 'breadcrumb']
$breadcrumbDirective.$inject = ['$state', 'breadcrumbsService']

# define angular module
angular.module 'uiBreadcrumbs', ['ui.router']
  .provider('breadcrumb', $breadcrumbProvider)
  .factory('breadcrumbsService', $breadcrumbsService)
  .directive('uiBreadcrumb', $breadcrumbDirective)
