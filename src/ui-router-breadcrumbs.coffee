###
# @module ui-router-breadcrumbs
# @description A simple directive that creates breadcrumbs on the fly for AngularJs pages using angular-ui-router
# @version v1.1.3
# @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
# @licence MIT License, https://opensource.org/licenses/MIT
###

'use strict'

###
# uiBreadcrumb directive
###
$uiBreadcrumb = ($state, $rootScope, breadcrumbsService) ->
  restrict: 'E',
  transclude: true
  template: '<ol class="breadcrumb">'+
  '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label || data.name}}</a></li>'+
  '</ol>'
  link: (scope, element, attrs) ->

    attrs.abstract = if attrs.abstract then attrs.abstract else false

    abstract = JSON.parse(attrs.abstract)

    render = ->
      if scope.$breadcrumbs isnt breadcrumbsService.getbreadcrumbs(abstract)
        scope.$breadcrumbs = breadcrumbsService.getbreadcrumbs(abstract)
        return

    ###
    # once the view content is updated
    # breadcrumbs are updated
    ###
    scope.$on '$viewContentLoaded', ->
      render()
      return
    return

# END uiBreadcrumb DIRECTIVE

###
# uiBreadcrumbsprovider
###
$breadcrumbconfig = ->

  abstract = false

  setAbstract: (value) ->
    ###
    # parse string to boolean
    # if the input is not a boolean
    ###
    value = JSON.parse(value)
    abstract = value
    return

  $get: ->
    abstract

# END breadcrumbconfig

###
# breadcrumbsService
###
$breadcrumbsService = ($state, breadcrumbconfig) ->

  crateBreadcrumbs = (abstract) ->
    abstract = if abstract then abstract else breadcrumbconfig
    breadcrumbs = []
    stateArray = []
    parentStates = []

    ###
    # gets all states
    ###
    for i of $state.$current.includes
      stateArray.push i

    ###
    # get parent state details
    ###
    for i of stateArray
      if stateArray[i] isnt ''
        if $state.get(stateArray[i]).$$state().parent.self.name isnt ''
          parentStates.push($state.get(stateArray[i]).$$state().parent.self)

    ###
    # if abstract is false
    # removes abstract states from breadcrumbs
    ###
    if not abstract
      for i of parentStates
        if not parentStates[i].abstract
          breadcrumbs.push parentStates[i]
    else
      breadcrumbs = parentStates

    ###
    # add current state to breadcrumbs
    ###
    breadcrumbs.push $state.current
    return breadcrumbs

  getbreadcrumbs: (abstract) ->
    crateBreadcrumbs(abstract)

# END breadcrumbsService

###
# dependency injection
###
$uiBreadcrumb.$inject = ['$state', '$rootScope', 'breadcrumbsService']
$breadcrumbsService.$inject = ['$state', 'breadcrumbconfig']

###
# define angular module
###
angular.module 'uiBreadcrumbs', ['ui.router', 'ngSanitize']
  .directive('uiBreadcrumb', $uiBreadcrumb)
  .provider('breadcrumbconfig', $breadcrumbconfig)
  .factory('breadcrumbsService', $breadcrumbsService)
