(function() {
    "use strict";

    angular.module("app").controller("userCtrl", function($scope, $http) {

      $scope.message = "hello world";

      $scope.setupUsers = function(){
        $http.get("/api/v1/users.json").then(function(response){
          $scope.user = response.data;
        });
      };

      $scope.editUsers = function(first_name,last_name,email,user){
        var params = {
          first_name: first_name || user.first_name,
          last_name: last_name || user.last_name,
          email: email || user.email
        };

        $http.patch("/api/v1/users/"+user.id+".json", params).then(function(response){
          $scope.user.push(params);
        }, function(error){
          console.log(error);
        });

      };

      $scope.deleteUsers = function(user){

      };

    });
}());
