
/*
 * @module ui-router-breadcrumbs
 * @description A simple directive that creates breadcrumbs on the fly for AngularJs pages using angular-ui-router
 * @version v1.1.2
 * @link https://github.com/Sibiraj-S/ui-router-breadcrumbs
 * @licence MIT License, https://opensource.org/licenses/MIT
 */

(function() {
  'use strict';

  /*
   * uiBreadcrumb directive
   */
  var $breadcrumbconfig, $breadcrumbsService, $uiBreadcrumb;

  $uiBreadcrumb = function($state, $rootScope, breadcrumbsService) {
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
  };


  /*
   * uiBreadcrumbsprovider
   */

  $breadcrumbconfig = function() {
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
  };


  /*
   * breadcrumbsService
   */

  $breadcrumbsService = function($state, breadcrumbconfig) {
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
  };


  /*
   * define angular module
   */

  angular.module('uiBreadcrumbs', ['ui.router', 'ngSanitize']).directive('uiBreadcrumb', $uiBreadcrumb).provider('breadcrumbconfig', $breadcrumbconfig).factory('breadcrumbsService', $breadcrumbsService);

}).call(this);
