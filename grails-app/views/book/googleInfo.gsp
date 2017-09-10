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
            <div id="book">
                <p>Title: <br>&nbsp;{{title}}</p>
                <p>Author: <br>&nbsp;{{author}}</p>
                <p>Date of Publication: <br>&nsbp;{{dateOfPub}}</p>
                <p>Description: <br>&nbsp;{{desc}}</p>
                <p>Page Count: <br>&nbsp;{{pageCount}}</p>
                <p>Genre: <br>&nbsp;{{genre}}</p>
                <p>Rating: <br>&nbsp;{{rating}}</p>
                <p>Number of Votes:<br>&nbsp;{{voters}}</p>
                <p>Image: </p><br>
                &nbsp;<img alt="Book Image" src="{{imageLink}}">
                <p>Public Domain: <br>&nbsp;{{publicDomain}}</p>
            </div>
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
                    $scope.title = data.data.items[0].volumeInfo.title
                    $scope.author = data.data.items[0].volumeInfo.authors[0]
                    $scope.dateOfPub = data.data.items[0].volumeInfo.publishedDate
                    $scope.desc = data.data.items[0].volumeInfo.description
                    $scope.pageCount = data.data.items[0].volumeInfo.pageCount
                    $scope.genre = data.data.items[0].volumeInfo.categories[0]
                    $scope.rating = data.data.items[0].volumeInfo.averageRating
                    $scope.voters= data.data.items[0].volumeInfo.ratingsCount
                    $scope.imageLink = data.data.items[0].volumeInfo.imageLinks.thumbnail
                    $scope.publicDomain = data.data.items[0].accessInfo.publicDomain
                });
            }
        });
        </script>
            
    </body>
</html>
