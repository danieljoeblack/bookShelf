<%@ page import="bookshelf.Book" %>
    <div ng-app="bookSearch" ng-controller="searchCtrl">
        <label for="isbn">Search By</label>
         <select ng-model="property">
            <option selected value="title">Title</option>
            <option value="ibsn">IBSN</option>
         </select>
        
            <input ng-model="isbn" type="text" id="isbn" name="isbn">
            <input ng-click="searchBook()" type="button" value="Search"><br>
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
                        
                        
    </div>
    <script>
        //Angular
        //for angular app
        var app = angular.module('bookSearch', []);
        
        app.controller('searchCtrl', function($scope,$http) {
            $scope.isbn = 
            returnedData = ""
            $scope.imageLink
            $scope.property = "title"
            $scope.searchBook = function(){
                var url = "https://www.googleapis.com/books/v1/volumes?q="+$scope.property+":"+$scope.isbn
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
                });
            }
        });
        </script>

