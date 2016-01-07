<%-- 
    Document   : friendList
    Created on : Dec 6, 2015, 9:04:49 PM
    Author     : megha
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="source" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<sql:query var="result" dataSource="${source}">
    select id, firstName, lastName from users where id IN(select user_one_id from friends where user_two_id = ? and status = 1 UNION select user_two_id from friends where user_one_id = ? and status = 1);
    <sql:param value="${sessionScope.userId}"></sql:param>
    <sql:param value="${sessionScope.userId}"></sql:param>
</sql:query>

<c:if test="${empty result.rows}">
    No friends yet!
</c:if>
<c:if test="${not empty result.rows}">
    <c:forEach var="i" items="${result.rows}">
        <div class="list-group">
        <a onclick="callServlet(this)" class="${i.id} list-group-item cursor">
            <img src="Uploads/PicProfile/${i.id}.jpg" class="pic-profile-search"/>
            ${i.firstName} ${i.lastName}
        </a>
        </div>
    </c:forEach>
</c:if>
