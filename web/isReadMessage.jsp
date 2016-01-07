<%-- 
    Document   : isReadMessage
    Created on : Dec 8, 2015, 11:53:32 PM
    Author     : megha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="isReadMessage" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<sql:query var="res" dataSource="${isReadMessage}">
    select * from isRead where id = ? and message = 0;
    <sql:param value="${param.name}"/>
</sql:query>
    
<c:if test="${not empty res.rows}">
    <span class="label label-danger">New</span>
</c:if>