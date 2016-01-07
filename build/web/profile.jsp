<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 10:43:51 PM
    Author     : megha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="bootstrapCDN.html" %>
        <link rel="stylesheet" href="homecss.css"/>
        <link rel="stylesheet" href="profilecss.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <script src="find_friends_ajax.js"></script>
        <script src="Js/profileJs.js"></script>
        <title>JSP Page</title>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            function callServlet(element) {
                var url = "SearchProfile?name=" + element.getAttribute("class").substring(0, 1);
                document.location.href = "/CustomFacebook/" + url;
            }
        </script>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="col-md-5 col-md-offset-1" id="friends">

            </div>
            <div style="margin-top: 90px;"></div>
        </div>

        <%@include file="internal_navbar.jsp" %>
        <div id="timeline">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5 col-md-offset-5">
                        <form action="Posts" method="post">
                            <div class="form-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Status
                                    </div>
                                    <div class="panel-body">
                                        <textarea name="status" rows="3" class="form-control" placeholder="Whats on your mind?"></textarea>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <span data-toggle="tooltip" title="Add photos to your post">
                                                        <span data-toggle="modal" data-target="#picture-modal" class="fa fa-camera fa-lg margin-span"></span>
                                                    </span>
                                                </div>
                                                <div class="col-md-3 pull-right">
                                                    <input type="submit" value="Post" class="form-control btn btn-primary"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- Modal -->
                    <div id="picture-modal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Upload Picture</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="UploadPost" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input type="file" name="file" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary" value="Upload" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-md-offset-5">
                    <%@include file="posts.jsp" %>
                </div>
            </div>
        </div>
    </div>
    <div id="showFriends">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <%@include file="showFriends.jsp" %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
