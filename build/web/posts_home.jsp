
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="sourcePosts" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"/>

<sql:query dataSource="${sourcePosts}" var="resultPosts">
    select * from posts where userId IN (select user_one_id from friends where user_two_id=? and status = 1 UNION select user_two_id from friends where user_one_id = ? and status = 1 UNION select id from users where id = ?);
    <sql:param value="${sessionScope.userId}"/>
    <sql:param value="${sessionScope.userId}"/>
    <sql:param value="${sessionScope.userId}"/>
</sql:query>

    
    <c:forEach var="result" items="${resultPosts.rows}" varStatus="status">
        <div class="panel panel-info moveInMargin">
            <div class="panel-heading">
                <sql:query var="resultPostUser" dataSource="${sourcePosts}">
                    select id, firstName, lastName from users where id = ?;
                    <sql:param value="${result.userId}"/>
                </sql:query>
                    <c:choose>
                        <c:when test="${resultPostUser.rows[0].id == sessionScope.userId}">
                            <img src="Uploads/PicProfile/${sessionScope.userId}.jpg" class="pic-profile-search"/> You
                        </c:when>
                        <c:otherwise>
                            <strong>
                                <a onclick="callServlet(this)" class="${resultPostUser.rows[0].id} cursor">
                                    <img src="Uploads/PicProfile/${resultPostUser.rows[0].id}.jpg" class="pic-profile-search"/>
                                    ${resultPostUser.rows[0].firstName} ${resultPostUser.rows[0].lastName}
                                </a>
                            </strong>
                        </c:otherwise>
                    </c:choose>
            </div>
            <div class="panel-body">
                ${result.content}
            </div>
        </div>
    </c:forEach>