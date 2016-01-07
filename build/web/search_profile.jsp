<%-- 
    Document   : search_profile
    Created on : Dec 6, 2015, 7:40:29 PM
    Author     : megha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="bootstrapCDN.html" %>
        <link rel="stylesheet" href="homecss.css"/>
        <link rel="stylesheet" href="profilecss.css"/>
        <link rel="stylesheet" href="search_profile_css.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <script src="find_friends_ajax.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="col-md-5 col-md-offset-1" id="friends">

            </div>
        <div style="margin-top: 90px;"></div>
        </div>
        <%@include file="internal_navbar_search_profile.jsp" %>
    </body>
</html>
