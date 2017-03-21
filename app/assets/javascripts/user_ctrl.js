(function() {
    "use strict";

    angular.module("app").controller("userCtrl", function($scope, $http) {

      $scope.message = "hello world";

      $scope.userSetup = function(){
        $http.get("/api/v1/users.json").then(function(response){
          console.log(response.data);
          $scope.user = response.data;
        });
      };


    });
}());
