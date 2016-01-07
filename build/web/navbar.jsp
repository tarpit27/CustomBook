<script>
    window.setInterval(function () {
        isRead(${sessionScope.userId});
    }, 2000);

    function isRead(id) {
        var xh = new XMLHttpRequest();
        xh.onreadystatechange = function () {
            if (xh.readyState == 4 && xh.status == 200) {
                document.getElementById("label").innerHTML = xh.responseText;
            }
        }
        xh.open("get", "isReadMessage.jsp?name=" + id, true);
        xh.send();
    }
    function read(id) {
        var xh = new XMLHttpRequest();

        xh.open("get", "readMessage.jsp?name=" + id, true);
        xh.send();
    }

</script>

<div class="well">
    <div class="container">
        <div class="col-md-5 col-md-offset-1">
            <form>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-facebook"></i></span>
                    <input type="text" class="form-control input-sm" placeholder="Find friends" name="findFriends" onkeyup="showFriends(this.value)" onblur=""/>
                    <span class="input-group-btn"><button class="btn btn-default"><i class="fa fa-search"></i></button></span>
                </div>
            </form>
        </div>
        <div class="col-md-3 col-md-offset-1">
            <div class="pages">
                <ul class="nav nav-pills">
                    <li>
                        <a href="profile.jsp">
                            <img src="Uploads/PicProfile/${sessionScope.userId}.jpg" class="pic-profile-sm"/>
                            ${sessionScope.users_name}                            
                        </a>
                    </li>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="#">Find Friends</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-2" style="padding: 0px;">
            <div class="icons">
                <ul class="nav nav-pills">
                    <li><a href="#"><i class="fa fa-users fa-lg"></i></a></li>
                    <li><a href="#" onclick="read(${sessionScope.userId})" data-toggle="modal" data-target="#showMessages"><i class="fa fa-envelope fa-lg"></i><sup id="label"></sup></a></li>
                    <li><a href="#"><i class="fa fa-globe fa-lg"></i></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-caret-down fa-lg"></i>
                        </a>
                        <div class="dropdown-menu list-group list-group-style">
                            <a href="" class="list-group-item list-group-item-style">Option 1</a>
                            <a href="" class="list-group-item list-group-item-style">Option 2</a>
                            <a href="Logout" class="list-group-item list-group-item-style">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="showMessages" class="modal fade" role="dialog">
        <div class="modal-dialog" style="overflow-y: scroll; max-height:85%;  margin-top: 50px; margin-bottom:50px;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Messages</h4>
                </div>
                <div class="modal-body">
                    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <sql:setDataSource var="source" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/custombook" user="root" password="arpit"></sql:setDataSource>
                    <sql:query var="query" dataSource="${source}">
                        select * from messages where receiver_id = ${sessionScope.userId};
                    </sql:query>
                    <c:forEach var="result" items="${query.rows}">
                        <sql:query var="queryForName" dataSource="${source}">
                            select * from users where id = ${result.sender_id};
                        </sql:query>
                        <c:forEach var="sender_name" items="${queryForName.rows}">
                            <c:set var="senderName" value="${sender_name.firstName} ${sender_name.lastName}"></c:set>
                        </c:forEach>
                        <div class="row"> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <strong>${senderName}:</strong>${result.message}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div>