
/*
 * @module ui-router-breadcrumbs
 * @description ui-router breadcrumbs for AngularJs pages
 * @version v1.0.4
 * @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
 * @licence MIT License, https://opensource.org/licenses/MIT
 */

(function() {
  'use strict';
  var app;

  app = angular.module('uiBreadcrumbs', ['ui.router', 'ngSanitize']);

  app.directive('uiBreadcrumb', function($state, $transitions) {
    return {
      restrict: 'E',
      transclude: true,
      link: function(scope, element, attrs) {
        var abstract, updateBreadCrumbs;
        attrs.abstract = attrs.abstract ? attrs.abstract : false;
        abstract = JSON.parse(attrs.abstract);
        $transitions.onSuccess({}, function() {
          return updateBreadCrumbs();
        });
        angular.element(document).ready(function() {
          return updateBreadCrumbs();
        });

        /*
         * watch for trasition success events
         * on state change success load breadcrumbs
         */
        updateBreadCrumbs = function() {
          var i, parentStates, stateArray;
          scope.$breadcrumbs = [];
          stateArray = [];
          parentStates = [];

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
                parentStates.push($state.get(stateArray[i]).$$state().parent.self);
              }
            }
          }

          /*
           * if abstract is false
           * removes abstract states from breadcrumbs
           */
          if (!abstract) {
            for (i in parentStates) {
              if (!parentStates[i].abstract) {
                scope.$breadcrumbs.push(parentStates[i]);
              }
            }
          } else {
            scope.$breadcrumbs = parentStates;
          }

          /*
           * add current state to breadcrumbs
           */
          scope.$breadcrumbs.push($state.current);
        };
      },
      template: '<ol class="breadcrumb">' + '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label || data.name}}</a></li>' + '</ol>'
    };
  });

}).call(this);
