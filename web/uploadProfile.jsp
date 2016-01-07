<%-- 
    Document   : uploadProfile
    Created on : Dec 8, 2015, 7:15:22 PM
    Author     : megha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UploadProfile" method="post" enctype="multipart/form-data">
            <input type="file" name="file" />
            <br><br>
            <input type="submit" value="Upload File" />
        </form>
    </body>
</html>
