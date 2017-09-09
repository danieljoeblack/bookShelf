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
        <title>Find a Book</title>
    </head>
    <body>
        <h1>Search a Book</h1>
        <section ng-app="bookSearch" ng-controller="searchCtrl">
            <label for="isbn"><input ng-model="isbn" type="text" id="isbn" name="isbn"></label>
            <input ng-click="searchBook()" type="button" value="Search">
            {{returnedData}}
        </section>
        <script>
        //Angular
        //for angular app
        var app = angular.module('bookSearch', []);
        
        app.controller('searchCtrl', function($scope,$http) {
            $scope.isbn = "enter an isbn"
            returnedData = ""
            $scope.searchBook = function(){
                var url = "https://www.googleapis.com/books/v1/volumes?q=isbn:"+$scope.isbn
                console.log(url)
                $http.get(url).then(function(data){
                    console.log(data)
                    $scope.returnedData = data.data.items[0].volumeInfo.authors
                });
            }
        });
        </script>
            
    </body>
</html>
