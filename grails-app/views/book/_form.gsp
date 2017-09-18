<%@ page import="bookshelf.Book" %>
    <div ng-app="bookSearch" ng-controller="searchCtrl">
        <label style="margin-top: 10px;" for="search">Search By</label>
         <select ng-model="property">
            <option selected value="title">Title</option>
            <option value="ibsn">IBSN</option>
         </select>
        <div class="searchForm">
            <input autocomplete="off" ng-model="search" type="text" id="search" name="search">
            <input style="margin-bottom: 0px;margin-top: -10px;" class="btn btn-group-sm" id="searchInput" ng-click="searchBook()" type="button" value="Search"><br>
        </div>
        <hr>
            <div class="container">
              <div class="dropdown">
                <button style="display:none" class="btn btn-primary droppeddown-toggle" id="menu1" type="button" data-toggle="dropdown">Dropdown Example
                <span class="caret"></span></button>
                <ul id="dropDownMenu" class="dropdown-menu" role="menu" aria-labelledby="menu1">
                  <li ng-repeat="item in items">
                      <table class="bookRecord">
                            <tr  ng-click="getRecord(item)">
                                <td style="width:75px">
                                    <img alt="No Image Avalible" height="125" width="75"  src="{{item.volumeInfo.imageLinks.smallThumbnail}}">
                                <td>
                                <td>
                                    <span ng-bind="item.volumeInfo.title"></span>
                                <td>
                            </tr>
                      </table>
                  </li>  
                </ul>
              </div>
            </div>
                        <g:if test="${	params.action != "edit"}">
                            <img id="bookPic" src="{{imageLink}}">
                        </g:if>
                        <div class="${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="book.title.label" default="Title" /></label>
				<div>
					<g:textField id="title" ng-model="title" class="form-control" name="title" value="${bookInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
				<label for="author" class="control-label"><g:message code="book.author.label" default="Author" /></label>
				<div>
					<g:textField id="author" ng-model="author" class="form-control" name="author" value="${bookInstance?.author}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'author', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'publisher', 'error')} ">
				<label for="publisher" class="control-label"><g:message code="book.publisher.label" default="Publisher" /></label>
				<div>
					<g:textField id="publisher" ng-model="publisher" class="form-control" name="publisher" value="${bookInstance?.publisher}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'publisher', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'yearOfPub', 'error')} ">
				<label for="yearOfPub" class="control-label"><g:message code="book.yearOfPub.label" default="Year Of Pub" /></label>
				<div>
					<g:textField id="yearOfPub" ng-model="yearOfPub" class="form-control" name="yearOfPub" value="${bookInstance?.yearOfPub}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'yearOfPub', 'error')}</span>
				</div>
			</div>
                        
			<div class="${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="book.description.label" default="Description" /></label>
				<div>
					<g:textArea is="description" ng-model="description" class="form-control" rows="5" cols="40" name="description" value="${bookInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'description', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'genre', 'error')} ">
				<label for="genre" class="control-label"><g:message code="book.genre.label" default="Genre" /></label>
				<div>
					<g:textField id="genre" ng-model="genre" class="form-control" rows="5" cols="40" name="genre" value="${bookInstance?.genre}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'genre', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'isbn', 'error')} ">
				<label for="isbn" class="control-label"><g:message code="book.isbn.label" default="ISBN" /></label>
				<div>
					<g:textField id="isbn" ng-model="isbn" class="form-control" rows="5" cols="40" name="isbn" value="${bookInstance?.isbn}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'isbn', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'pageCount', 'error')} ">
				<label for="pageCount" class="control-label"><g:message code="book.pageCount.label" default="Page Count" /></label>
				<div>
					<g:textField id="pageCount" ng-model="pageCount" class="form-control" rows="5" cols="40" name="pageCount" value="${bookInstance?.pageCount}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'pageCount', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'rating', 'error')} ">
				<label for="rating" class="control-label"><g:message code="book.rating.label" default="Rating" /></label>
				<div>
					<g:textField id="rating" ng-model="rating" class="form-control" rows="5" cols="40" name="rating" value="${bookInstance?.rating}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'rating', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'numOfRates', 'error')} ">
				<label for="numOfRates" class="control-label"><g:message code="book.numOfRates.label" default="Number of Voters" /></label>
				<div>
					<g:textField id="numOfRates" ng-model="numOfRates" class="form-control" rows="5" cols="40" name="numOfRates" value="${bookInstance?.numOfRates}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'numOfRates', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'publicDomain', 'error')} ">
				<label for="publicDomain" class="control-label"><g:message code="book.publicDomain.label" default="Public Domain" /></label>
				<div>
					<g:textField id="publicDomain" ng-model="publicDomain" class="form-control" rows="5" cols="40" name="publicDomain" value="${bookInstance?.publicDomain}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'publicDomain', 'error')}</span>
				</div>
			</div>
                        
                        <div hidden class="${hasErrors(bean: bookInstance, field: 'imageLink', 'error')} ">
				<label for="imageLink" class="control-label"><g:message code="book.description.label" default="Image Link" /></label>
				<div>
					<g:textField ng-model="imageLink" class="form-control" name="imageLink" value="${bookInstance?.imageLink}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'imageLink', 'error')}</span>
				</div>
			</div>
                        
                        <div hidden class="${hasErrors(bean: bookInstance, field: 'downloadLinkPdf', 'error')} ">
				<label for="downloadLinkPdf" class="control-label"><g:message code="book.description.label" default="downloadLinkPdf" /></label>
				<div>
					<g:textField ng-model="downloadLinkPdf" class="form-control" name="downloadLinkPdf" value="${bookInstance?.downloadLinkPdf}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'downloadLinkPdf', 'error')}</span>
				</div>
			</div>
                        
                        <div hidden class="${hasErrors(bean: bookInstance, field: 'downloadLinkEpub', 'error')} ">
				<label for="downloadLinkEpub" class="control-label"><g:message code="book.description.label" default="downloadLinkEpub" /></label>
				<div>
					<g:textField ng-model="downloadLinkEpub" class="form-control" name="downloadLinkEpub" value="${bookInstance?.downloadLinkEpub}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'downloadLinkEpub', 'error')}</span>
				</div>
			</div>
                        
                        
    </div>
    <script>
        //Angular
        //for angular app
        var app = angular.module('bookSearch', []);
        
        app.controller('searchCtrl', function($scope,$http) {
            var beenClicked = false
            numberOfChars = 0
            returnedData = ""
            $scope.imageLink
            $scope.property = "title"
            $scope.$watch('search',function(newVal,oldVal){
                numberOfChars = numberOfChars + 1;
                if(newVal != 'undefined' && newVal && numberOfChars%4==0){
                    currentRequest = Date()
                    var url = "https://www.googleapis.com/books/v1/volumes?q="+$scope.property+":"+$scope.search+"&key=AIzaSyCcSAlb-pTw6PAdDhMh_6OitB3I7ZDxxGY"
                        lastWasReturned = false
                        $http.get(url).then(function(data){
                            $scope.items = data.data.items;
                            console.log(data.data.items)
                        });
                    console.log(beenClicked)
                    if(beenClicked == false){
                        document.getElementById("menu1").click();
                        beenClicked = true;
                    };
                };
                
            });
            $scope.getRecord = function(item){
                console.log(item)
                if(item.volumeInfo.title){
                        $scope.title = item.volumeInfo.title
                        $('#title').css('background-color', '#ffffff')
                    }else{
                        $scope.title = ""
                        $('#title').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.authors[0]){
                        $scope.author = item.volumeInfo.authors[0]
                        $('#author').css('background-color', '#ffffff')
                    }else{
                        $scope.author=""
                        $('#author').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.publishedDate){
                        $scope.yearOfPub = item.volumeInfo.publishedDate
                        $('#yearOfPub').css('background-color', '#ffffff')
                    }else{
                        $scope.yearOfPub = ""
                        $('#yearOfPub').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.publisher){
                        $scope.publisher = item.volumeInfo.publisher
                        $('#publisher').css('background-color', '#ffffff')
                    }else{
                        $scope.publisher = ""
                        $('#publisher').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.description){
                        $('#description').css('background-color', '#ffffff')
                        $scope.description = item.volumeInfo.description
                    }else{
                        $scope.description = ""
                        $('#description').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.pageCount){
                        $('#pageCount').css('background-color', '#ffffff')
                        $scope.pageCount = item.volumeInfo.pageCount
                    }else{
                        $scope.pageCount = ""
                        $('#pageCount').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.categories){
                        $('#genre').css('background-color', '#ffffff')
                        $scope.genre = item.volumeInfo.categories[0]
                    }else{
                        $scope.genre = ""
                        $('#genre').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.averageRating){
                        $('#rating').css('background-color', '#ffffff')
                        $scope.rating = item.volumeInfo.averageRating
                    }else{
                        $scope.rating = ""
                        $('#rating').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.ratingsCount){
                        $('#numOfRates').css('background-color', '#ffffff')
                        $scope.numOfRates= item.volumeInfo.ratingsCount
                    }else{
                        $scope.numOfRates = ""
                        $('#numOfRates').css('background-color', '#dfe575')
                    }
                    if(item.volumeInfo.imageLinks.thumbnail){
                        $scope.imageLink = item.volumeInfo.imageLinks.thumbnail
                    }else{
                        $('#bookPic').css('display', 'none')
                    }
                    if(item.accessInfo.publicDomain){
                        $('#publicDomain').css('background-color', '#ffffff')
                        $scope.publicDomain = item.accessInfo.publicDomain
                    }else{
                        $scope.publicDomain = ""
                        $('#publicDomain').css('background-color', '#dfe575')
                    }
                    if(true){
                        $('#isbn').css('background-color', '#ffffff')
                         $scope.isbn = item.volumeInfo.industryIdentifiers[0].identifier
                    }else{
                        $scope.isbn = ""
                        $('#isbn').css('background-color', '#dfe575')
                    }
                    if(true){
                        $('#downloadLinkPdf').css('background-color', '#ffffff')
                         $scope.downloadLinkPdf = item.volumeInfo.industryIdentifiers[0].identifier
                    }else{
                        $scope.isbn = ""
                        $('#downloadLinkPdf').css('background-color', '#dfe575')
                    }
            }
            $scope.searchBook = function(){
                var url = "https://www.googleapis.com/books/v1/volumes?q="+$scope.property+":"+$scope.search
                console.log(url)
                $http.get(url).then(function(data){
                    console.log(data)
                    if(data.data.items[0].volumeInfo.title){
                        $scope.title = data.data.items[0].volumeInfo.title
                        $('#title').css('background-color', '#ffffff')
                    }else{
                        $scope.title = ""
                        $('#title').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.authors[0]){
                        $scope.author = data.data.items[0].volumeInfo.authors[0]
                        $('#author').css('background-color', '#ffffff')
                    }else{
                        $scope.author=""
                        $('#author').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.publishedDate){
                        $scope.yearOfPub = data.data.items[0].volumeInfo.publishedDate
                        $('#yearOfPub').css('background-color', '#ffffff')
                    }else{
                        $scope.yearOfPub = ""
                        $('#yearOfPub').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.publisher){
                        $scope.publisher = data.data.items[0].volumeInfo.publisher
                        $('#publisher').css('background-color', '#ffffff')
                    }else{
                        $scope.publisher = ""
                        $('#publisher').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.description){
                        $('#description').css('background-color', '#ffffff')
                        $scope.description = data.data.items[0].volumeInfo.description
                    }else{
                        $scope.description = ""
                        $('#description').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.pageCount){
                        $('#pageCount').css('background-color', '#ffffff')
                        $scope.pageCount = data.data.items[0].volumeInfo.pageCount
                    }else{
                        $scope.pageCount = ""
                        $('#pageCount').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.categories[0]){
                        $('#genre').css('background-color', '#ffffff')
                        $scope.genre = data.data.items[0].volumeInfo.categories[0]
                    }else{
                        $scope.genre = ""
                        $('#genre').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.averageRating){
                        $('#rating').css('background-color', '#ffffff')
                        $scope.rating = data.data.items[0].volumeInfo.averageRating
                    }else{
                        $scope.rating = ""
                        $('#rating').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.ratingsCount){
                        $('#numOfRates').css('background-color', '#ffffff')
                        $scope.numOfRates= data.data.items[0].volumeInfo.ratingsCount
                    }else{
                        $scope.numOfRates = ""
                        $('#numOfRates').css('background-color', '#dfe575')
                    }
                    if(data.data.items[0].volumeInfo.imageLinks.thumbnail){
                        $scope.imageLink = data.data.items[0].volumeInfo.imageLinks.thumbnail
                    }else{
                        $('#bookPic').css('display', 'none')
                    }
                    if(data.data.items[0].accessInfo.publicDomain){
                        $('#publicDomain').css('background-color', '#ffffff')
                        $scope.publicDomain = data.data.items[0].accessInfo.publicDomain
                    }else{
                        $scope.publicDomain = ""
                        $('#publicDomain').css('background-color', '#dfe575')
                    }
                    if(true){
                        $('#isbn').css('background-color', '#ffffff')
                         $scope.isbn = data.data.items[0].volumeInfo.industryIdentifiers[0].identifier
                    }else{
                        $scope.isbn = ""
                        $('#isbn').css('background-color', '#dfe575')
                    }
                });
            }
        });
        </script>

