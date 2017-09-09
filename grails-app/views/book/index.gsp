
<%@ page import="bookshelf.Book" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-book" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'book.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'book.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="publisher" title="${message(code: 'book.publisher.label', default: 'Publisher')}" />
			
				<g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
			
				<g:sortableColumn property="yearOfPub" title="${message(code: 'book.yearOfPub.label', default: 'Year Of Pub')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bookInstanceList}" status="i" var="bookInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "author")}</g:link></td>
			
				<td><g:formatDate date="${bookInstance.dateCreated}" /></td>
			
				<td>${fieldValue(bean: bookInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: bookInstance, field: "publisher")}</td>
			
				<td>${fieldValue(bean: bookInstance, field: "title")}</td>
			
				<td>${fieldValue(bean: bookInstance, field: "yearOfPub")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${bookInstanceCount}" />
	</div>
</section>

</body>

</html>
