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
        <title>Book Upload</title>
    </head>
    <body>
        <g:uploadForm action="upload" enctype='multipart/form-data' class="bootstrap-frm">
            <h1>Book Upload<span>This form allows you to upload a file of books. If you are unsure of what this means please refer to our help section.</span></h1>
            <label for='bookFile'>Book File</label>
            <input required type="file" id="bookFile" name="bookFile" class="btn btn-default" /><br>
            <g:actionSubmit id="uploadButton" action="upload" class="btn btn-default" value="Upload" /><br>           
        </g:uploadForm>
    </body>
</html>
