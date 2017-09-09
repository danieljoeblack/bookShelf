<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="kickstart" />
        <title>Books Found</title>
    </head>
    <body>
        <h1>These were ${booksFoundCount} books found in the file you gave us. They looked like this:</h1>
        <section id="list-book" class="first">

            <table class="table table-bordered margin-top-medium">
                    <thead>
                            <tr>
                                    <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
                                    <g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                                    <g:sortableColumn property="publisher" title="${message(code: 'book.publisher.label', default: 'Publisher')}" />
                                    <g:sortableColumn property="yearOfPub" title="${message(code: 'book.yearOfPub.label', default: 'Year Of Pub')}" />
                                    <g:sortableColumn property="description" title="${message(code: 'book.description.label', default: 'Description')}" />
                                    
                            </tr>
                    </thead>
                    <tbody>
                    <g:each in="${booksFound}" status="i" var="bookInstance">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td>${fieldValue(bean: bookInstance, field: "title")}</td>
                                    <td>${fieldValue(bean: bookInstance, field: "author")}</td>
                                    <td>${fieldValue(bean: bookInstance, field: "publisher")}</td>
                                    <td>${fieldValue(bean: bookInstance, field: "yearOfPub")}</td>
                                    <td>${fieldValue(bean: bookInstance, field: "description")}</td>
                                    
                            </tr>
                    </g:each>
                    </tbody>
            </table>
            <div>
            </div>
            <g:uploadForm>
                <g:actionSubmit class="btn btn-default" value="Save These Books" action="saveBooks" />
            </g:uploadForm>
        </section>
    </body>
</html>
