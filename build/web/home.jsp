
<%-- 
    Document   : home
    Created on : Dec 3, 2015, 7:00:57 PM
    Author     : megha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="bootstrapCDN.html" %>
        <link rel="stylesheet" href="homecss.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <script src="find_friends_ajax.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });

            function callServlet(element) {
                var url = "SearchProfile?name=" + element.getAttribute("class").substring(0,1);
                document.location.href = "/CustomFacebook/" + url;
            }
            
            $(document).ready(function(){
                $('.moveIn').fadeIn(500);
                $('.moveInMargin').animate({
                    marginTop: '+=30px'
                }, 500);
            });
        </script>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="col-md-5 col-md-offset-1" id="friends">

            </div>
        </div>
        <div class="container-fluid margin-top">
            <div class="row">
                <div class="col-md-2 col-md-offset-1 left-pane">
                    <a href="profile.jsp"><img src="Uploads/PicProfile/${sessionScope.userId}.jpg" class="pic-profile-sm"/> ${sessionScope.users_full_name}</a><br>
                    <a href="#"><span class="fa fa-edit"></span> Edit Profile</a><br>
                    <span style="color: gray; font-weight: 700;">Favorites</span><br>
                    <a href="#" data-toggle="modal" data-target="#showMessages"><span class="fa fa-envelope"></span> Messages</a><br>
                </div>
                <div class="col-md-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="fa fa-edit"></span> Update Status
                        </div>
                        <form action="Posts" method="post">
                            <div class="panel-body">
                                <div class="form-group">
                                    <textarea name="status" placeholder="Whats on your mind?" class="form-control"></textarea>
                                </div>
                                <div class="pull-right">
                                    <input type="submit" class="btn btn-primary btn-sm"/>
                                </div>
                                <div class="pull-left">
                                    <a href="" data-toggle="tooltip" title="Add photos to your post"><span class="fa fa-camera fa-lg"></span></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-2 pull-right friends-side">
                    <%@include file="friendList.jsp" %>
                </div>
            </div>
                <div class="row">
                    <div class="col-md-5 col-md-offset-3 moveIn" style="display: none;">
                        <%@include file="posts_home.jsp" %>
                    </div>
                </div>
        </div>
                    
    </body>
</html>
