<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="source" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>

<sql:query var="result" dataSource="${source}">
    select * from users where id = ?;
    <sql:param value="${users_name_search_profile}"></sql:param>
</sql:query>

<sql:query var="resultForButton" dataSource="${source}">
    select * from friends where (user_one_id = ? AND user_two_id = ? AND status = 1) OR (user_one_id = ? AND user_two_id = ? AND status = 1);
    <sql:param value="${sessionScope.userId}"/>
    <sql:param value="${users_name_search_profile}"/>
    <sql:param value="${users_name_search_profile}"/>
    <sql:param value="${sessionScope.userId}"/>
</sql:query>

<c:forEach var="row" items="${result.rows}"><c:set var="name" value="${row.firstName} ${row.lastName}"></c:set></c:forEach>

        <div class="container">
            <div class="row" id="overlap">
                <div class="col-md-5 col-md-offset-1">
                    <img src="Uploads/PicProfile/${users_name_search_profile}.jpg" class="img-thumbnail pic-profile">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-3 add-username">
            ${name}
        </div>
        <div class="col-md-3 col-md-offset-7 add-username">
            <c:choose>
                <c:when test="${empty resultForButton.rows}">
                    <button class="btn btn-default">Add Friend</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-success disabled" style="cursor: pointer;">Friends</button>
                </c:otherwise>
            </c:choose>            
                
            <button class="btn btn-default" data-toggle="modal" data-target="#messageModal">Message</button>
            <!-- Modal -->
            <div id="messageModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Send Message</h4>
                        </div>
                        <form action="MessageSend" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <textarea name="message" class="form-control" rows="5" placeholder="Write your message.."></textarea>
                                    <input type="hidden" name="receiver" value="${users_name_search_profile}"/>
                                    <input type="hidden" name="sender" value="${sessionScope.userId}"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="form-control btn btn-success btn-sm" value="Send"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="internal_navbar">
                <ul class="nav nav-pills">
                    <li><a href="#">Timeline</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Friends</a></li>
                    <li><a href="#">Photos</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div style="margin-top: 90px;"></div>
</div>