'use strict'

# uiBreadcrumb directive
$uiBreadcrumbDirective = ($state, $rootScope, breadcrumbsService) ->
  restrict: 'E',
  transclude: true
  template: '<nav aria-label="breadcrumb">'+
  '  <ol class="breadcrumb">'+
  '    <li class="breadcrumb-item" ng-repeat="data in $breadcrumbs" ui-sref-active="active">'+
  '      <a ui-sref="{{data.abstract || data.name}}" ng-class="{disabled: data.abstract}">'+
  '        {{data.data.label || data.name}}'+
  '      </a>'+
  '    </li>'+
  '  </ol>'+
  '</nav>'
  link: (scope, element, attrs) ->

    attrs.abstract = if attrs.abstract then attrs.abstract else false

    abstract = JSON.parse(attrs.abstract)

    render = ->
      if scope.$breadcrumbs isnt breadcrumbsService.getbreadcrumbs(abstract)
        scope.$breadcrumbs = breadcrumbsService.getbreadcrumbs(abstract)
        return

    # once the view content is updated
    # breadcrumbs are updated
    scope.$on '$viewContentLoaded', ->
      render()
      return
    return

# uiBreadcrumbsprovider
$breadcrumbProvider = ->

  abstract = false

  setAbstract: (value) ->
    # parse string to boolean
    # if the input is not a boolean
    value = JSON.parse(value)
    abstract = value
    return

  $get: ->
    abstract


# breadcrumbsService
$breadcrumbsService = ($state, breadcrumbconfig) ->

  crateBreadcrumbs = (abstract) ->
    abstract = if abstract then abstract else breadcrumbconfig
    breadcrumbs = []
    stateArray = []
    parentStates = []

    # gets all states
    for i of $state.$current.includes
      stateArray.push i

    # get parent state details
    for i of stateArray
      if stateArray[i] isnt ''
        if $state.get(stateArray[i]).$$state().parent.self.name isnt ''
          parentStates.push($state.get(stateArray[i]).$$state().parent.self)

    # if abstract is false
    # removes abstract states from breadcrumbs
    if not abstract
      for i of parentStates
        if not parentStates[i].abstract
          breadcrumbs.push parentStates[i]
    else
      breadcrumbs = parentStates

    # add current state to breadcrumbs
    breadcrumbs.push $state.current
    return breadcrumbs

  getbreadcrumbs: (abstract) ->
    crateBreadcrumbs(abstract)

# dependency injection
$breadcrumbProvider.$inject = []
$uiBreadcrumbDirective.$inject = ['$state', '$rootScope', 'breadcrumbsService']
$breadcrumbsService.$inject = ['$state', 'breadcrumbconfig']

# define angular module
angular.module 'uiBreadcrumbs', ['ui.router']
  .provider('breadcrumbconfig', $breadcrumbProvider)
  .factory('breadcrumbsService', $breadcrumbsService)
  .directive('uiBreadcrumb', $uiBreadcrumbDirective)
