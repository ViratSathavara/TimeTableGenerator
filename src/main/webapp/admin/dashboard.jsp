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


    <jsp:include page="../commonJsCss.jsp"></jsp:include>


</head>
<body>
<style>
    .dashboard-nav {
        display: flex;
        width: 100%;
        align-items: center;
        height: 15vh;
    }

    .logout-btn {
        margin-left: auto;
        margin-right: 2ch;
    }

    .dashboard-Main-Content {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        height: 85vh;
        overflow: auto;
    }

    .main-menu-bar {
        width: 60%;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        height: 10vh;
        margin-left: 3ch;
    }

    .main-menu-btns {
        margin: 0 5px;
    }

    .main-manu-btn-active {
        background-color: #a8d6ff;
    }
</style>
<div class="dashboard-nav">
    <div class="main-menu-bar">
        <button id="loadBannerMgmt" onclick="Dashboard.loadBannerPage(this)" class="main-menu-btns main-manu-btn-active btn"><i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp;
            Announcement
            Banner
        </button>
        <button id="timetableMgmt" onclick="Dashboard.loadTimeTablePage(this)" class="main-menu-btns btn">Time Table</button>
        <button id="otherMgmt" onclick="Dashboard.loadManagementPage(this)" class="main-menu-btns btn"><i class="fa fa-sliders" aria-hidden="true"></i>&nbsp;
            Management
        </button>
    </div>
    <a href="<%=contextPath%>/rest/LoginController/Logout" class="btn btn-danger logout-btn">Logout</a>
</div>

<div class="dashboard-Main-Content" id="dashboard-Main-Content">

</div>


<script>
    var Dashboard = function () {
    };
    Dashboard.contextPath = "<%=contextPath%>/";
    Dashboard.restURL = Dashboard.contextPath + "rest/";
</script>
<script src="<%=contextPath%>/admin/dashboard.js" defer></script>

</body>
</html>
