###
# @module ui-router-breadcrumbs
# @description A simple directive that creates breadcrumbs on the fly for AngularJs pages using angular-ui-router
# @version v1.1.0
# @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
# @licence MIT License, https://opensource.org/licenses/MIT
###

'use strict'

app = angular.module 'uiBreadcrumbs', ['ui.router', 'ngSanitize']

###
# uiBreadcrumb directive
###
app.directive 'uiBreadcrumb', ($state, $rootScope, $transitions, $timeout, breadcrumbsService) ->
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

    # $transitions.onSuccess {}, (trans) ->
    #   console.log("transition")
    #   render()
    #   return

# END uiBreadcrumb DIRECTIVE

###
# uiBreadcrumbsprovider
###
app.provider 'breadcrumbconfig', ->

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
app.factory 'breadcrumbsService', ($state, breadcrumbconfig) ->

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
