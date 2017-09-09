
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
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
                                <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
				<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                                <g:sortableColumn property="publisher" title="${message(code: 'book.publisher.label', default: 'Publisher')}" />
				<g:sortableColumn property="yearOfPub" title="${message(code: 'book.yearOfPub.label', default: 'Year Of Pub')}" />
                                <g:sortableColumn property="description" title="${message(code: 'book.description.label', default: 'Description')}" />
                                <g:sortableColumn property="dateCreated" title="${message(code: 'book.dateCreated.label', default: 'Date Created')}" />
                                <th style="text-align: center" onclick="invertTick()">Delete<br><input type="checkbox"></th>
                        </tr>
		</thead>
		<tbody>
                <g:form>
		<g:each in="${bookInstanceList}" status="i" var="bookInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></td>
				<td>${fieldValue(bean: bookInstance, field: "author")}</td>
                                <td>${fieldValue(bean: bookInstance, field: "publisher")}</td>
                                <td>${fieldValue(bean: bookInstance, field: "yearOfPub")}</td>
                                <td>${fieldValue(bean: bookInstance, field: "description")}</td>
				<td><g:formatDate date="${bookInstance.dateCreated}" /></td>
                                <td style="text-align: center"><input type="checkbox" name="deleteFlag${i}" value="${bookInstance.id}"></td>
			</tr>
		</g:each>
                <br>
                <g:uploadForm id="returnedResults" action="list">
                    <label for="max">Returned Results: <input name="max" id="max" type="text" value="${max}"></label>
                </g:uploadForm>
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
</script>
</body>

</html>
