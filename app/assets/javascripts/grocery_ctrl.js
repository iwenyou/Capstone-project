(function(){
  "use strict";

  angular.module("app").controller("groceryCtrl", function($scope, $http){
    $scope.message = "hello world";

    $scope.setup = function(){
      $http.get("/api/v1/groceries.json").then(function(response){
        $scope.groceries = response.data;
      });
    };

    window.scope = $scope;


  });
}());
