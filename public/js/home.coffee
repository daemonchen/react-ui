underscore = angular.module 'underscore', []

underscore.factory '_', ->
    window._

fantastic = angular.module "fantastic", [
    "underscore",
    "ngSanitize",
    'ngRoute',
    'fantasticControllers'

]
    .config ($interpolateProvider) ->
        $interpolateProvider.startSymbol '[['
        $interpolateProvider.endSymbol ']]'

fantastic.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/',
        templateUrl: '/public/partials/home.html',
        controller: 'HomeController'
    .when '/login',
        templateUrl: '/public/partials/login.html',
        controller: 'LoginController'
    .when '/register',
        templateUrl: '/public/partials/register.html',
        controller: 'RegisterController'
    .otherwise
        redirectTo: '/'
  ]
