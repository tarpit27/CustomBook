<%-- 
    Document   : showFriends
    Created on : Dec 6, 2015, 10:30:39 PM
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
    <div class="col-md-3">
        <div class="alert alert-warning">
            No friends yet!
        </div>
    </div>
</c:if>
<c:if test="${not empty result.rows}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="fa fa-user"></span> Friends
        </div>
        <div class="panel-body">
            <c:forEach var="i" items="${result.rows}">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a onclick="callServlet(this)" class="${i.id} cursor">${i.firstName} ${i.lastName}</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>