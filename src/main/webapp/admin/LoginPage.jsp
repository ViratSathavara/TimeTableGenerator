<%@ page import="org.srpec.virat.timetablegenerator.auth.AuthHelper" %><%--
  Created by IntelliJ IDEA.
  User: Virat Sathavara
  Date: 27-04-2023
  Time: 11:59 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    if (AuthHelper.isUserLoggedIn(request)) {
        response.sendRedirect(contextPath + "/admin/Dashboard");
        return;
    }
%>
<html>
<head>
    <title>Login Page</title>
    <script src="<%=contextPath%>/UI/libs/Jquery/jquery-3.6.4.min.js"></script>
    <script src="<%=contextPath%>/UI/libs/bootstrap5/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/UI/libs/bootstrap5/bootstarp.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<style>


    .login-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-width: 80%;
        max-width: 320px;
        height: 50vh;
        background-color: var(--light-gray);
        border: 1px solid var(--light-orange);
    }



    @import url(https://fonts.googleapis.com/css?family=Roboto:300);
    header .header {
        background-color: #fff;
        height: 45px;
    }

    header a img {
        width: 134px;
        margin-top: 4px;
    }

    .login-page {
        width: 360px;
        padding: 8% 0 0;
        margin: auto;
    }

    .login-page .form .login {
        margin-top: -31px;
        margin-bottom: 26px;
    }

    .form {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 360px;
        margin: 0 auto 100px;
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .form input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .form button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background-color: #328f8a;
        background-image: linear-gradient(45deg, #328f8a, #08ac4b);
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
    }

    .form {
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
    }

    .form .login .login-header {
        color: #4CAF50;
        text-decoration: none;
        font-size: 30px;
    }

    body {
        background-color: #328f8a;
        background-image: linear-gradient(45deg, #328f8a, #08ac4b);
        font-family: "Roboto", sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
</style>
<body>

<div class="login-page">
    <form action="<%=contextPath%>/rest/LoginController/Login" method="POST" class="login-form" id="loginForm">
        <div class="form">
            <div class="login">
                <div class="login-header">
                    <span>ADMIN LOGIN</span>
                </div>
            </div>
            <form class="login-form">
                <input type="text" name="username" placeholder="Username">
                <input type="password" name="password" placeholder="Password" autocomplete="current-password">
                <button type="submit">Login</button>
                 </form>
        </div>
    </form>
</div>
</body>
</html>
