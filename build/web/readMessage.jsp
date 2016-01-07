<%-- 
    Document   : readMessage
    Created on : Dec 9, 2015, 12:28:15 AM
    Author     : megha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="readMessage" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<sql:update var="res" dataSource="${readMessage}">
    update isRead set message = 1 where id = ?;
    <sql:param value="${param.name}"/>
</sql:update>>
