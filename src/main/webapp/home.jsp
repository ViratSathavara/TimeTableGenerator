<%--
  Created by IntelliJ IDEA.
  User: jays
  Date: 22/04/23
  Time: 12:17 am
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="<%=contextPath%>/UI/css/utils.css">
    <jsp:include page="commonJsCss.jsp"></jsp:include>
</head>
<body>

<div id="top">
    <div id="myList"></div>
</div>

<div id="middle">
    <div class="functable" id="Table">
    </div>
</div>
<div class="form-group">
    <select class="form-control" name="" id="branch">  </select>
</div>

<div id="bottom">
<div class="TimeTable-Container"></div>
</div>
<script>
    var contextPath = "<%=contextPath%>/"
</script>
<script src="<%=contextPath%>/UI/js/utils.js"></script>
</body>
</html>