<%-- 
    Document   : index
    Created on : Dec 4, 2015, 10:47:49 PM
    Author     : megha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="bootstrapCDN.html" %>
        <link rel="stylesheet" href="indexStyle.css">
        <script src="indexJs.js"></script>
        <title>customBook</title>
    </head>
    <body>
        
        <!-- LOGIN-NAVBAR -->
        <nav class="navbar navbar-default padding">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#login">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand">customBook</a>
                </div>
                <div class="collapse navbar-collapse" id="login">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <form action="Login" method="post" class="form-inline">
                                <div class="form-group">

                                    <input type="text" class="form-control input-sm" name="emailLogin" placeholder="Email" autofocus="autofocus"/>
                                </div>
                                <div class="form-group">

                                    <input type="password" class="form-control input-sm" name="passwordLogin" placeholder="password"/>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Login" class="btn btn-default btn-sm"/>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-md-offset-1">
                    <div class="row">
                        <div class="col-md-11">
                            <h4 style="line-height: 30px;"><strong>CustomBook helps you connect and share with the people in your life.</strong></h4>
                        </div>
                        <div class="row">
                            <img src="images/facebook.png">
                        </div>
                    </div>
                </div>
                
                <div class="col-md-5  col-md-offset-1">
                    <h1>Create an account</h1>
                    <h4>It's free and always will be</h4><br>
                    
                    <!-- REGISTER FORM -->
                    <form name="registerForm" method="post" action="Register" onsubmit="return validateRegisterForm()" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-6">
                                <input type="text" name="firstName" class="form-control radius padding-input" placeholder="First Name" required=""/>
                            </div>
                            <div class="col-md-5">
                                <input type="text" name="lastName" class="form-control radius padding-input" placeholder="Last Name" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-11">
                                <input type="text" class="form-control radius padding-input" name="email" placeholder="Email" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-11">
                                <input type="text" class="form-control radius padding-input" name="reEmail" placeholder="Re-enter Email" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-11">
                                <input type="password" class="form-control radius padding-input" name="password" placeholder="Password" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4 class="col-md-11">Birthday</h4>
                            <div class="col-md-6">
                                <input type="text" class="form-control radius padding-input" placeholder="DD-MM-YYYY" name="birthday" required=""/>
                            </div>
                            <div class="col-md-6">
                                <a href="">Why do i need to provide my birthday?</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-11">
                                <input type="radio" value="female" name="gender"> Female
                                <input type="radio" value="male" name="gender"> Male
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-11">
                                <input type="submit" value="Create an Account" class="btn btn-success btn-lg"/>
                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </body>
</html>
