(function() {
    "use strict";

    angular.module("app").controller("groceryCtrl", function($scope, $http) {
        $scope.message = "hello world";

        $scope.setupGroceries = function() {
            $http.get("/api/v1/groceries.json").then(function(response) {
                $scope.groceries = response.data;
            });
        };

        $scope.setupGrocery = function(grocery_id) {
            $http.get("/api/v1/groceries/" + grocery_id + ".json").then(function(response) {
                $scope.grocery = response.data;
                var grocery_name = response.data.name;
                console.log(grocery_name);
                setupRecipes(grocery_name);
            });
        };

        function setupRecipes(grocery_name) {
            $http.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=" + grocery_name + "&limitLicense=false&number=5&ranking=1", {
                headers: {
                    "X-Mashape-Key": "MyqoDQyK4EmshJIfTYENvqZP0xf3p120R29jsnklru3MuF1cZv",
                    "Accept": "application/json"
                }
            }).then(function(response) {
                console.log(response.data);
                $scope.recipes = response.data;
            });
        };


        $scope.addGroceries = function(name, expiration_date, user_id) {
            var params = {
                name: name,
                user_id: user_id,
                expiration_date: expiration_date
            };
            $http.post("/api/v1/groceries.json", params).then(function(response) {
                console.log(response.config);
                $scope.groceries.push(response.config.data);
            }, function(error) {
                console.log(error);
                $scope.errors = error.data.errors;
            });
        };

        $scope.editGroceries = function(name, expiration_date, grocery) {

            var newParams = {
                name: name || grocery.name,
                expiration_date: expiration_date || grocery.expiration_date
            };

            $http.patch("/api/v1/groceries/" + grocery.id + ".json", newParams);


        };

        $scope.deleteGroceries = function(grocery) {
            $http.delete("/api/v1/groceries/" + grocery.id + ".json").then(function(response) {
                var index = $scope.groceries.indexOf(grocery);
                $scope.groceries.splice(index, 1);
            });
        };

        $scope.orderByMe = function(x, y) {
            $scope.myOrderBy = x;
            $scope.bool = y;
        };

        window.scope = $scope;


    });
}());
