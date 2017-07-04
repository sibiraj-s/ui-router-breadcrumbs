###
# @module ui-router-breadcrumbs
# @description ui-router breadcrumbs for AngularJs pages
# @version v1.0.0
# @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
# @licence MIT License, https://opensource.org/licenses/MIT
###

'use strict'

app = angular.module 'uiBreadcrumbs', ['ui.router', 'ngSanitize']

app.directive 'uiBreadcrumb', ($state, $transitions, $rootScope, $compile) ->
  restrict: 'E',
  transclude: true
  link: (scope, element, attrs) ->

    $rootScope.$on 'updateBreadCrumbs', (event, trans) ->

      scope.$breadcrumbs = []
      stateArray = []

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
            scope.$breadcrumbs.push($state.get(stateArray[i]).$$state().parent.self)

      ###
      # if abstract is false
      # removes abstract states from breadcrumbs
      ###
      if not attrs.abstract
        for i of scope.$breadcrumbs
          if scope.$breadcrumbs[i].abstract
            scope.$breadcrumbs.splice(i, 1)

      ###
      # add current state to breadcrumbs
      ###
      scope.$breadcrumbs.push $state.current
      return

    return

  template: '<ol class="breadcrumb">'+
    '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label}}</a></li>'+
    '</ol>'

app.run ($rootScope, $transitions, $timeout) ->

  ###
  # on state change success calls a function to update breadcrumbs
  ###
  $transitions.onSuccess {}, (trans) ->
    $rootScope.$emit 'updateBreadCrumbs', trans
    return
  return
