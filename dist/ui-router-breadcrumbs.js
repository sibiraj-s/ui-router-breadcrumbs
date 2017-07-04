
/*
 * @module ui-router-breadcrumbs
 * @description ui-router breadcrumbs for AngularJs pages
 * @version v1.0.0
 * @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
 * @licence MIT License, https://opensource.org/licenses/MIT
 */

(function() {
  'use strict';
  var app;

  app = angular.module('uiBreadcrumbs', ['ui.router', 'ngSanitize']);

  app.directive('uiBreadcrumb', ['$state', '$transitions', '$rootScope', '$compile', function($state, $transitions, $rootScope, $compile) {
    return {
      restrict: 'E',
      transclude: true,
      link: function(scope, element, attrs) {
        $rootScope.$on('updateBreadCrumbs', function(event, trans) {
          var i, stateArray;
          scope.$breadcrumbs = [];
          stateArray = [];

          /*
           * gets all states
           */
          for (i in $state.$current.includes) {
            stateArray.push(i);
          }

          /*
           * get parent state details
           */
          for (i in stateArray) {
            if (stateArray[i] !== '') {
              if ($state.get(stateArray[i]).$$state().parent.self.name !== '') {
                scope.$breadcrumbs.push($state.get(stateArray[i]).$$state().parent.self);
              }
            }
          }

          /*
           * if abstract is false
           * removes abstract states from breadcrumbs
           */
          if (!attrs.abstract) {
            for (i in scope.$breadcrumbs) {
              if (scope.$breadcrumbs[i].abstract) {
                scope.$breadcrumbs.splice(i, 1);
              }
            }
          }

          /*
           * add current state to breadcrumbs
           */
          scope.$breadcrumbs.push($state.current);
        });
      },
      template: '<ol class="breadcrumb">' + '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label}}</a></li>' + '</ol>'
    };
  }]);

  app.run(['$rootScope', '$transitions', '$timeout', function($rootScope, $transitions, $timeout) {

    /*
     * on state change success calls a function to update breadcrumbs
     */
    $transitions.onSuccess({}, function(trans) {
      $rootScope.$emit('updateBreadCrumbs', trans);
    });
  }]);

}).call(this);
