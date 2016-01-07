<% System.out.println("posts.jsp"); %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="posts" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<sql:query dataSource="${posts}" var="result">
    select * from posts where userId = ?;
    <sql:param value="${sessionScope.userId}"></sql:param>
</sql:query>
    
<c:forEach var="row" items="${result.rows}">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-warning">
                <div class="panel-heading">${sessionScope.users_name}</div>
                <div class="panel-body">
                    ${row.content}
                </div>
            </div>
        </div>
    </div>
</c:forEach>
