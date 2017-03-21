(function(){
  "use strict";

  angular.module("app").controller("catagoryCtrl", function($scope, $http){

    $scope.catagorySetup = function(){
      $http.get("/api/v1/catagories.json").then(function(response){
        $scope.catagories = response.data;
      });
    };


  });
}());
