
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <meta name="layout" content="kickstart" />
        <title>Book Search</title>
    </head>
    <body>        
        <section ng-app="bookSearch" ng-controller="searchCtrl">
            <h1>Search For Books</h1>
            <div>
                <input id="download" ng-model="download" type="checkbox" name="vehicle" value="">Only Books with Downloads Available<br>
                <input autocomplete="off" ng-model="title" type="text" class="search" id="title" placeholder="Book Title" name="search">
                <input autocomplete="off" ng-model="author" type="text" class="search" id="author" placeholder="Author" name="search">
                <input style="margin-bottom: 0px;margin-top: -10px;" class="btn btn-group-sm" id="searchInput" ng-click="searchBook()" type="button" value="Search"><br>
            </div>
            <div style="display:none;" id="results">
                <div>
                     <table class="table table-bordered margin-top-medium">
                        <thead>
                                <tr>
                                        <th>Image</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th>Pub Date</th>
                                        <th>Description</th>                                        
                                        <th ng-show="{{download}}">Download</th>
                                        <th>Add to Bookshelf</th>
                               </tr>
                        </thead>
                        <tbody>
                                <tr ng-repeat="item in items">
                                        <td><img src="{{item.volumeInfo.imageLinks.smallThumbnail}}"></td>
                                        <td>{{item.volumeInfo.title}}</td>
                                        <td>{{item.volumeInfo.authors[0]}}</td>
                                        <td>{{item.volumeInfo.publishedDate}}</td>
                                        <td>{{item.volumeInfo.description}}</td>
                                        <td ng-show="{{download}}">
                                            <a href="{{item.accessInfo.pdf.downloadLink}}">Download EPUB</a>
                                            <a href="{{item.accessInfo.epub.downloadLink}}">Download PDF</a>
                                        </td>
                                        <td><g:form>
                                            <div style="display:none;" hidden>
                                            <input name="title" type="text" value="{{item.volumeInfo.title}}">
                                            <input name="author" type="text" value="{{item.volumeInfo.authors[0]}}">
                                            <input name="publisher" type="text" value="{{item.volumeInfo.publisher}}">
                                            <input name="yearOfPub" type="text" value="{{item.volumeInfo.publishedDate}}">
                                            <input name="description" type="text" value="{{item.volumeInfo.description}}">
                                            <input name="imageLink" type="text" value="{{item.volumeInfo.imageLinks.thumbnail}}">
                                            <input name="genre" type="text" value="{{item.volumeInfo.categories[0]}}">
                                            <input name="ibsn" type="text" value="{{item.volumeInfo.industryIdentifiers[0].identifier}}">
                                            <input name="pageCount" type="text" value="{{item.volumeInfo.pageCount}}">
                                            <input name="rating" type="text" value="{{item.volumeInfo.averageRating}}">
                                            <input name="numOfRates" type="text" value="{{item.volumeInfo.ratingsCount}}">
                                            <input name="smallImageLink" type="text" value="{{item.volumeInfo.imageLinks.smallThumbnail}}">
                                            <input name="publicDomain" type="text" value="{{item.accessInfo.publicDomain}}">
                                            </div>
                                            <g:actionSubmit value="Add to Bookshelf" action="addToBookShelf" />
                                        </g:form></td>
                                </tr>
                        </tbody>
                </table>
                </div>
            </div>                
        </section>
        <script>
            

$(document).ready(function(){
    $('#title').keypress(function(e){
      if(e.keyCode==13)
      $('#searchInput').click();
    });
});



$(document).ready(function(){
    $('#author').keypress(function(e){
      if(e.keyCode==13)
      $('#searchInput').click();
    });
});


            var app = angular.module('bookSearch', []);
        
            app.controller('searchCtrl', function($scope,$http) {
                $scope.searchBook = function(){
                    
                    if($scope.download == true){
                        $scope.downloadString = "&filter=free-ebooks"
                    }else{
                        $scope.downloadString = ""
                    }
                    if($scope.author){
                        $scope.authorString = "\+inauthor:"+$scope.author.replace(/ /g,"\+")
                    }else{
                        $scope.authorString =""
                    }
                    
                    var url = "https://www.googleapis.com/books/v1/volumes?q="+$scope.title+$scope.authorString+$scope.downloadString+"&key=AIzaSyCcSAlb-pTw6PAdDhMh_6OitB3I7ZDxxGY"
                    console.log(url)
                    $http.get(url).then(function(data){
                        console.log(data)
                        $scope.items = data.data.items
                        document.getElementById('results').style.display = 'block'
                    });                   
                }
            });
        </script>
    </body>
</html>

