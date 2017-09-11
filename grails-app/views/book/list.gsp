
<%@ page import="bookshelf.Book" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>                
<section ng-app="myApp" ng-controller="myCtrl" id="list-book" class="first">
    <div id="divToFix">
            <button id="showSearchButton" class="btn btn-default" data-toggle="collapse" data-target="#searchFormDiv">Click for Search Form <b class="caret"></b></button>

            <div id="searchFormDiv" class="collapse">
                <g:form id="searchForm" action="list">
                    <input class="searchFormInputs" type="text" placeholder="Title" name="title"/><br>
                    <input class="searchFormInputs" type="text" placeholder="Author" name="author"/><br>
                    <input class="searchFormInputs" type="text" placeholder="Publisher" name="publisher"/><br>
                    <input class="searchFormInputs" type="text" placeholder="Date of Publication" name="yearOfPub"/><br>
                    <input class="searchFormInputs" type="text" placeholder="Genre" name="genre"/><br>
                    <input class="searchFormInputs" type="text" placeholder="ISBN" name="isbn"/><br>
                    <input class="searchFormInputs" type="text" placeholder="Rating" name="rating"/><br>
                    <label><input type="checkbox" name="publicDomain" value="true"/> In Public Domain</label><br>
                    <g:actionSubmit style="margin-top: 5%; margin-bottom: 5%;" class="btn btn-default" action="list" value="Search"/><br>
                </g:form>
            </div>
        </div>
    <div id="returnedResults">
        <g:uploadForm  action="list">
            <label for="max">Returned Results: <input size="2" name="max" id="max" type="text" value="${max}"></label>
        </g:uploadForm>
    </div>
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
                            <th>Image</th>
                                <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
				<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                                <g:sortableColumn property="publisher" title="${message(code: 'book.publisher.label', default: 'Publisher')}" />
				<g:sortableColumn property="yearOfPub" title="${message(code: 'book.yearOfPub.label', default: 'Year Of Pub')}" />
                                <g:sortableColumn property="description" title="${message(code: 'book.description.label', default: 'Description')}" />
                                <th>Extended Info</th>
                                <th style="text-align: center" onclick="invertTick()">Delete<br><input type="checkbox"></th>
                        </tr>
		</thead>
		<tbody>
                <g:form>
		<g:each in="${bookInstanceList}" status="i" var="bookInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td><g:link action="show" id="${bookInstance.id}"><img src="${fieldValue(bean: bookInstance, field: "imageLink")}"></g:link></td>
                                <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></td>
				<td>${fieldValue(bean: bookInstance, field: "author")}</td>
                                <td>${fieldValue(bean: bookInstance, field: "publisher")}</td>
                                <td>${fieldValue(bean: bookInstance, field: "yearOfPub")}</td>
                                <td>${bookInstance.getShorterDescription()}<a id="descHover" href="#" data-toggle="tooltip" title="${fieldValue(bean: bookInstance, field: "description")}">Hover for full description</a></td>
                                <td><button type="button" class="btn" data-toggle="modal" data-target="#myModal${fieldValue(bean: bookInstance, field: "id")}">Extended Info</button></td>
                                <td style="text-align: center"><input type="checkbox" name="deleteFlag${i}" value="${bookInstance.id}"></td>
                        </tr>
  

                        <!-- Modal -->
                        <div id="myModal${fieldValue(bean: bookInstance, field: "id")}" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Extended Info</h4>
                                    </div>
                                    <div class="modal-body">
                                        <g:if test="${fieldValue(bean: bookInstance, field: "genre")}">
                                            <p>Genre: ${fieldValue(bean: bookInstance, field: "genre")}</p>
                                        </g:if>
                                        <g:if test="${fieldValue(bean: bookInstance, field: "isbn")}">
                                            <p>ISBN: ${fieldValue(bean: bookInstance, field: "isbn")}</p>
                                        </g:if>
                                        <g:if test="${fieldValue(bean: bookInstance, field: "pageCount")}">
                                            <p>Page Count: ${fieldValue(bean: bookInstance, field: "pageCount")}</p>
                                        </g:if>
                                        <g:if test="${fieldValue(bean: bookInstance, field: "rating")}">
                                            <p>Rating: ${fieldValue(bean: bookInstance, field: "rating")}</p>
                                        </g:if>
                                        <g:if test="${fieldValue(bean: bookInstance, field: "numOfRates")}">
                                            <p>Number of Votes: ${fieldValue(bean: bookInstance, field: "numOfRates")}</p>
                                        </g:if>
                                        <g:if test="${fieldValue(bean: bookInstance, field: "publicDomain")}">
                                            <p>In the Public Domain: ${fieldValue(bean: bookInstance, field: "publicDomain")}</p>
                                        </g:if>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
		</g:each>
                <br>

                <input hidden type="text" value="{{maxChecks}}" name="maxChecks">
                <input onclick="confirmDeletion()" class="btn btn-default" value="Delete Checked Books" type="button" />
                <g:actionSubmit hidden id="deleteButton"  action="deleteCheckedBooks" value="Delete Checked Books"/>
                </g:form>
		</tbody>
	</table>
        
	<div>
                
		<bs:paginate total="${bookInstanceCount}" />
                
	</div>
</section>
<script>
//Angular
        //for angular app
        var app = angular.module('myApp', []);
        
        app.controller('myCtrl', function($sce,$scope,$filter,$http) {
            $scope.maxChecks = document.getElementById('max').value;
        });

    //Javascript
        //to confirm item deletion
        function confirmDeletion() {
            var txt;
            if (confirm("Are you sure you wish to deleted the selected items? If you proceed the changes will be permanant") == true) {
                document.getElementById("deleteButton").click();
            }  
        }

        //to switch between ticked and unticked
        var allTicked = false;
        function tickAll() {
            var allInputs = document.getElementsByTagName("input");
            for (var i = 0, max = allInputs.length; i < max; i++){
                if (allInputs[i].type === 'checkbox')
                    allInputs[i].checked = true;
            }
            allTicked = true;
        }
        function unTickAll() {
            var allInputs = document.getElementsByTagName("input");
            for (var i = 0, max = allInputs.length; i < max; i++){
                if (allInputs[i].type === 'checkbox')
                    allInputs[i].checked = false;
            }
            allTicked = false;
        }
        function invertTick() {
            if(allTicked){
                unTickAll();
            }else{
                tickAll();
            }
        }
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });
</script>
</body>

</html>
