
/*
 * @module ui-router-breadcrumbs
 * @description ui-router breadcrumbs for AngularJs pages
 * @version v1.1.0
 * @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
 * @licence MIT License, https://opensource.org/licenses/MIT
 */

(function() {
  'use strict';
  var app;

  app = angular.module('uiBreadcrumbs', ['ui.router', 'ngSanitize']);


  /*
   * uiBreadcrumb directive
   */

  app.directive('uiBreadcrumb', ['$state', '$rootScope', '$transitions', '$timeout', 'breadcrumbsService', function($state, $rootScope, $transitions, $timeout, breadcrumbsService) {
    return {
      restrict: 'E',
      transclude: true,
      template: '<ol class="breadcrumb">' + '  <li ng-repeat="data in $breadcrumbs"><a ui-sref="{{data.abstract || data.name}}" ng-class="{\'disabled\': data.abstract}">{{data.label || data.name}}</a></li>' + '</ol>',
      link: function(scope, element, attrs) {
        var abstract, render;
        attrs.abstract = attrs.abstract ? attrs.abstract : false;
        abstract = JSON.parse(attrs.abstract);
        render = function() {
          if (scope.$breadcrumbs !== breadcrumbsService.getbreadcrumbs(abstract)) {
            scope.$breadcrumbs = breadcrumbsService.getbreadcrumbs(abstract);
          }
        };

        /*
         * once the view content is updated
         * breadcrumbs are updated
         */
        scope.$on('$viewContentLoaded', function() {
          render();
        });
      }
    };
  }]);


  /*
   * uiBreadcrumbsprovider
   */

  app.provider('breadcrumbconfig', function() {
    var abstract;
    abstract = false;
    return {
      setAbstract: function(value) {

        /*
         * parse string to boolean
         * if the input is not a boolean
         */
        value = JSON.parse(value);
        abstract = value;
      },
      $get: function() {
        return abstract;
      }
    };
  });


  /*
   * breadcrumbsService
   */

  app.factory('breadcrumbsService', ['$state', 'breadcrumbconfig', function($state, breadcrumbconfig) {
    var crateBreadcrumbs;
    crateBreadcrumbs = function(abstract) {
      var breadcrumbs, i, parentStates, stateArray;
      abstract = abstract ? abstract : breadcrumbconfig;
      breadcrumbs = [];
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
            breadcrumbs.push(parentStates[i]);
          }
        }
      } else {
        breadcrumbs = parentStates;
      }

      /*
       * add current state to breadcrumbs
       */
      breadcrumbs.push($state.current);
      return breadcrumbs;
    };
    return {
      getbreadcrumbs: function(abstract) {
        return crateBreadcrumbs(abstract);
      }
    };
  }]);

}).call(this);
