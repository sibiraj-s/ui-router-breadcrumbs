###
# @module ui-router-breadcrumbs
# @description ui-router breadcrumbs for AngularJs pages
# @version v1.0.4
# @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
# @licence MIT License, https://opensource.org/licenses/MIT
###

'use strict'

app = angular.module 'uiBreadcrumbs', ['ui.router', 'ngSanitize']

app.directive 'uiBreadcrumb', ($state, $transitions) ->
  restrict: 'E',
  transclude: true
  link: (scope, element, attrs) ->

    attrs.abstract = if attrs.abstract then attrs.abstract else false

    abstract = JSON.parse(attrs.abstract)

    $transitions.onSuccess {}, ->
      updateBreadCrumbs()

    angular.element(document).ready ->
      updateBreadCrumbs()

    ###
    # watch for trasition success events
    # on state change success load breadcrumbs
    ###
    updateBreadCrumbs = ->
      scope.$breadcrumbs = []
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
            scope.$breadcrumbs.push parentStates[i]
      else
        scope.$breadcrumbs = parentStates

      ###
      # add current state to breadcrumbs
      ###
      scope.$breadcrumbs.push $state.current
      return

    return

  template: '<ol class="breadcrumb">'+
    '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label || data.name}}</a></li>'+
    '</ol>'
