# ========HomeController=======
fantastic.controller 'HomeController', ($scope, $http, $log, _, postService) ->
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
fantastic.controller 'LoginController', ($scope, $http, $log, _) ->
    $scope.logError = (data, status) ->
        $log.log('code ' + status + ': ' + data);

    $scope.login = () ->
        $http.get '/admin/login',
            params:
                username: $scope.username,
                password: MD5($scope.password)

        .success () ->
            window.location.href = "/"
        .error $scope.logError


# =====RegisterController=====
fantastic.controller 'RegisterController', ($scope, $http, $log, _) ->
    $scope.logError = (data, status) ->
        $log.log('code ' + status + ': ' + data)


    $scope.register = () ->
        return $http.post '/admin/register',
            params:
                username: $scope.username,
                password: $scope.password

        .success () ->
            window.location.href = "/"
        .error $scope.logError



