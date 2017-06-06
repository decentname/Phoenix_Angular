function AppController($scope, $http) {

    $scope.user = {};
    $scope.auth = {};

    //Attach CSRF token in header
    var token = document.querySelector('meta[name=csrf-token]').content;
    $http.defaults.headers.common['X-CSRF-Token'] = token;

    // Register
    $scope.createUser = function () {
        $http({method: 'POST', url: 'api/user/register/', data: { 'user' : $scope.user }}).then(
            function successCallback(response) {
                $scope.user.email = "";
                $scope.user.password = "";
                $scope.user.first_name = "";
                $scope.user.last_name = "";
                window.location = '/user';
                toastr.success("User Created");
            },
            function errorCallback(response) {
                toastr.error("Error Creating New User");
        });
    };

    // Login
    $scope.authenticateUser = function () {
        $http({method: 'POST', url: 'user/login/', data: { 'email' : $scope.auth.email, 'password' : $scope.auth.password }}).then(
            function successCallback(response) {
                $scope.auth.email = "";
                $scope.auth.password = "";
                window.location = '/user';
                toastr.success("Logged in Successfully");
            },
            function errorCallback(response) {
                $scope.auth.email = "";
                $scope.auth.password = "";
                toastr.error("Invalid credentials");
        });
    };

    //Logout
    $scope.Logout = function(){
      $http({method: 'GET', url: 'api/user/logout/'}).then(
            function successCallback(response) {
                $scope.auth.email = "";
                $scope.auth.password = "";
                window.location = '/';
                toastr.success("Logged out Successfully");
            },
            function errorCallback(response) {
                toastr.error("Cannot Logout");
        });  
    }

}
