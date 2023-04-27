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
    .login-container {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 100vh;
        background-color: var(--dark-gray);
    }

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

    .login-inputs {
        margin: 1ch;
        background-color: white;
    }
</style>
<body>
<div class="login-container">
    <form action="<%=contextPath%>/rest/LoginController/Login" method="POST" class="login-form" id="loginForm">
        <input class="login-inputs form-control" type="text" name="username" placeholder="Username">
        <input class="login-inputs form-control" type="password" name="password" placeholder="Password"
               autocomplete="current-password">
        <button class="btn btn-success" type="submit">Login</button>
    </form>
</div>
</body>
</html>
