
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- set datasource -->
<sql:setDataSource var="test" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<c:set var="id" value="${param.name}"/>
<!-- make query -->
<sql:query dataSource="${test}" var="result">
    select id, firstName, lastName from users where firstName like ?;
    <sql:param value="${id}%"/>
</sql:query>
<div class="well well-white" id="friendsList">
    <c:forEach var="res" items="${result.rows}" begin="0" end="4">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="list-group">
                    <a onclick="callServlet(this)" class="${res.id} list-group-item cursor">
                        <img src="Uploads/PicProfile/${res.id}.jpg" class="pic-profile-search">
                        ${res.firstName} ${res.lastName}
                    </a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
