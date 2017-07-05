
/*
 * @module ui-router-breadcrumbs
 * @description ui-router breadcrumbs for AngularJs pages
 * @version v1.0.5
 * @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
 * @licence MIT License, https://opensource.org/licenses/MIT
 */

(function() {
  'use strict';
  var app, loaded;

  loaded = false;

  app = angular.module('uiBreadcrumbs', ['ui.router', 'ngSanitize']);

  app.directive('uiBreadcrumb', ['$state', '$rootScope', function($state, $rootScope) {
    return {
      restrict: 'E',
      transclude: true,
      link: function(scope, element, attrs) {
        var abstract;
        attrs.abstract = attrs.abstract ? attrs.abstract : false;
        abstract = JSON.parse(attrs.abstract);

        /*
         * watch for trasition success events
         * on state change success load breadcrumbs
         */
        $rootScope.$on('updateBreadCrumbs', function(event, trans) {
          var i, parentStates, stateArray;
          loaded = true;
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
        });
      },
      template: '<ol class="breadcrumb">' + '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label || data.name}}</a></li>' + '</ol>'
    };
  }]);

  app.run(['$rootScope', '$transitions', '$timeout', function($rootScope, $transitions, $timeout) {
    return $transitions.onSuccess({}, function(trans) {
      if (loaded) {
        $timeout(function() {
          $rootScope.$emit('updateBreadCrumbs', trans);
        }, 0);
      } else {
        $timeout(function() {
          $rootScope.$emit('updateBreadCrumbs', trans);
        }, 1000);
      }
    });
  }]);

}).call(this);
