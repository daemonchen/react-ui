underscore = angular.module 'underscore', []

underscore.factory '_', ->
    window._

fantastic = angular.module "fantastic", ["underscore", "ngSanitize",'ngRoute']
    .config ($interpolateProvider) ->
        $interpolateProvider.startSymbol '[['
        $interpolateProvider.endSymbol ']]'

fantastic.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/',
        templateUrl: '/public/partials/home.html',
        controller: 'PhoneListCtrl'
    .when '/phones',
        templateUrl: 'partials/phone-list.html',
        controller: 'PhoneListCtrl'
    .when '/phones/:phoneId',
        templateUrl: 'partials/phone-detail.html',
        controller: 'PhoneDetailCtrl'
    .otherwise
        redirectTo: '/phones'
  ]
