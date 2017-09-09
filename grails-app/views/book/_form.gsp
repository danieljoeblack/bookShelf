<%@ page import="bookshelf.Book" %>

                        <div class="${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="book.title.label" default="Title" /></label>
				<div>
					<g:textField class="form-control" name="title" value="${bookInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
				<label for="author" class="control-label"><g:message code="book.author.label" default="Author" /></label>
				<div>
					<g:textField class="form-control" name="author" value="${bookInstance?.author}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'author', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'publisher', 'error')} ">
				<label for="publisher" class="control-label"><g:message code="book.publisher.label" default="Publisher" /></label>
				<div>
					<g:textField class="form-control" name="publisher" value="${bookInstance?.publisher}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'publisher', 'error')}</span>
				</div>
			</div>
                        
                        <div class="${hasErrors(bean: bookInstance, field: 'yearOfPub', 'error')} ">
				<label for="yearOfPub" class="control-label"><g:message code="book.yearOfPub.label" default="Year Of Pub" /></label>
				<div>
					<g:textField class="form-control" name="yearOfPub" value="${bookInstance?.yearOfPub}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'yearOfPub', 'error')}</span>
				</div>
			</div>
                        
			<div class="${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="book.description.label" default="Description" /></label>
				<div>
					<g:textArea class="form-control" rows="5" cols="40" name="description" value="${bookInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: bookInstance, field: 'description', 'error')}</span>
				</div>
			</div>

