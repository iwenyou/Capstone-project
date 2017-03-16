(function(){
  "use strict";

  angular.module("app").controller("groceryCtrl", function($scope, $http){
    $scope.message = "hello world";

    $scope.setupGroceries = function(){
      $http.get("/api/v1/groceries.json").then(function(response){
        $scope.groceries = response.data;
      });
    };

    $scope.addGroceries = function(name,expiration_date){
      var params = {
        name: name,
        expiration_date: expiration_date
      };
      $http.post("/api/v1/groceries.json", params).then(function(response){
        $scope.groceries.push(params);
      }, function(error){
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.editGroceries = function(name,expiration_date){
      var params = {
        name: name,
        expiration_date: expiration_date
      };
    };

    window.scope = $scope;


  });
}());
