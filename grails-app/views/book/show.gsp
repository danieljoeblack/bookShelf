
<%@ page import="bookshelf.Book" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-book" class="first">

	<table class="table">
		<tbody>
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.image.label" default="Image" /></td>
				
				<td valign="top" class="value"><img src="${fieldValue(bean: bookInstance, field: "imageLink")}"</td>
				
			</tr>
                        		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.title.label" default="Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "title")}</td>
				
			</tr>
                        
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.author.label" default="Author" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "author")}</td>
				
			</tr>
                        
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.publisher.label" default="Publisher" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "publisher")}</td>
				
			</tr>
                        
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.yearOfPub.label" default="Year Of Pub" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "yearOfPub")}</td>
				
			</tr>
                        
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="book.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${bookInstance?.dateCreated}" /></td>
				
			</tr>
		
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.genre.label" default="Genre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "genre")}</td>
				
			</tr>
                        
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.isbn.label" default="ISBN" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "isbn")}</td>
				
			</tr>
                        
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.pageCount.label" default="pageCount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "pageCount")}</td>
				
			</tr>
                        
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.rating.label" default="Rating" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "rating")}</td>
				
			</tr>
                        
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.numOfRates.label" default="Number of Votes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "numOfRates")}</td>
				
			</tr>
                        
                        <tr class="prop">
				<td valign="top" class="name"><g:message code="book.publicDomain.label" default="Is in Public Domain" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bookInstance, field: "publicDomain")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
