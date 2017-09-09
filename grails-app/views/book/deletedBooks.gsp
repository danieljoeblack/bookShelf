<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="kickstart"> 
        <title>Books Deleted</title>
    </head>
    <body>
        <h1>Books Deleted</h1>
        <h3>${deletedBooks?.size()?:"0"} Books were Deleted:</h3>
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
                    <g:each in="${deletedBooks}" status="i" var="bookInstance">
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
    </body>
</html>
