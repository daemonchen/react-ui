# =====fantasticControllers=====
fantasticControllers = angular.module('fantasticControllers', []);

# ========HomeController=======

fantasticControllers.controller 'HomeController', ($scope, $http, $log, _, postService) ->
    $scope.posts = [];

    logError = (data, status) ->
        $log.log 'code ', status, ': ', data

    $scope.loading = true
    init = () ->
        $http.get('/app/getAllPosts')
        .success (data) ->
            if data
                _.each data, (v,k) ->
                    v.Date = moment(parseInt(v.Stamp)).fromNow()

                $scope.posts = data
                postService.addPosts data
                $scope.loading = false


        .error logError

    # init()


# =======LoginController=========
fantasticControllers.controller 'LoginController', ($scope, $http, $log, _, md5) ->
    $scope.logError = (data, status) ->
        $log.log('code ' + status + ': ' + data);

    $scope.login = () ->
        $http.get '/admin/login',
            username: $scope.username,
            password: md5.createHash($scope.password || '')

        .success (data) ->
            # window.location.href = "/"
            console.log "login success:", data
        .error $scope.logError


# =====RegisterController=====
fantasticControllers.controller 'RegisterController', ($scope, $http, $location, $log, _, md5) ->
    $scope.logError = (data, status) ->
        $log.log 'code ', status, ': ', data


    $scope.register = () ->
        # $log.log($scope.username, $scope.password, $scope.email);
        return $http.post '/register',
            username: $scope.username,
            password: md5.createHash($scope.password || ''),
            email: $scope.email

        .success (data) ->
            $location.path "/"
            # window.location.href = "/"
        .error $scope.logError



