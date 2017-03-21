(function(){
  "use strict";

  angular.module("app").controller("groceryCtrl", function($scope, $http){
    $scope.message = "hello world";

    $scope.setupGroceries = function(){
      $http.get("/api/v1/groceries.json").then(function(response){
        $scope.groceries = response.data;
        $scope.catagories = response.data.catagories;
        console.log(response.data.catagories);
      });
    };

    $scope.addGroceries = function(name,expiration_date,user_id){
      var params = {
        name: name,
        user_id: user_id,
        expiration_date: expiration_date
      };
      $http.post("/api/v1/groceries.json", params).then(function(response){
        console.log(response.config);
        $scope.groceries.push(response.config.data);
      }, function(error){
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.editGroceries = function(name,expiration_date,grocery){

      var newParams = {
        name: name || grocery.name,
        expiration_date: expiration_date || grocery.expiration_date
      };

      $http.patch("/api/v1/groceries/"+ grocery.id +".json", newParams);


    };

    $scope.deleteGroceries = function(grocery){
      $http.delete("/api/v1/groceries/"+grocery.id+".json").then(function(response){
        var index = $scope.groceries.indexOf(grocery);
        $scope.groceries.splice(index, 1);
      });
    };

    window.scope = $scope;


  });
}());
