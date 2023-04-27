<%--
  Created by IntelliJ IDEA.
  User: Virat Sathavara
  Date: 27-04-2023
  Time: 11:51 pm
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<a href="<%=contextPath%>/rest/LoginController/Logout">Logout</a>
</body>
</html>
