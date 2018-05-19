<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <meta name="layout" content="kickstart" />
        <title>Dictionary</title>
    </head>
    <body>
        <div ng-app="bookSearch" ng-controller="searchCtrl">
        <h1>Dictionary</h1>
        <div id="dicSearchDiv">
            <label for="searchWordInput"><input type="text" name="searchWordInput" ng-model="searchWordInput"></label><br>
            <input type="button" name="searchButton" ng-click="getSearchResults()" value="search">
        </div>
        {{data}}
        </div>
        <script>
            //Angular
            //for angular app
            var app = angular.module('bookSearch', []);

            app.controller('searchCtrl', function($scope,$http) {
                $scope.getSearchResults = function(){
                    var url = "https://od-api.oxforddictionaries.com/api/v1/serach/english?q="+$scope.searchWordInput.toLowerCase()
                    console.log(url)
                    $http.get(url).then(function(data){
                        console.log(data)                        
                        $scope.data = data
                    });
                }
            });
        </script>
    </body>
</html>
