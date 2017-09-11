<%@ page import="bookshelf.Book" %>
<!DOCTYPE html>
<html>

<head>
	
      
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
        <meta name="layout" content="kickstart" />
</head>
 
<body>

	<section id="create-book" class="first">

		<g:hasErrors bean="${bookInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${bookInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>
        
        <script>
        $(document).ready(function () {
            $(".droppeddown-toggle").dropdown();
        });
        </script>
</body>

</html>
