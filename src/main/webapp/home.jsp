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

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <jsp:include page="commonJsCss.jsp"></jsp:include>
</head>
<body>

<div class="navigation">
    <div class="left-menu">
        <div class="logo">
            <img class="logo-img" src="./UI/images/12.png" alt="logo">
        </div>
        <div class="heading">
            <p class="title">Time Table Generator</p>
            <p class="college">Smt. S. R. Patel Engineering College, Unjha</p>
        </div>
    </div>
    <div class="right-menu">
        <button type="submit">Login/Sign-Up</button>
    </div>
</div>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators" id="bannerSliderButtons">

    </div>
    <div class="carousel-inner" id="bannerSlider">
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div id="dynamicTable">

</div>


<script>
    var contextPath = "<%=contextPath%>/"
    let url = `\${contextPath}rest/general/getBannerData?ispublished=1`;
    $.get(url, {}, function (resp) {
        getBannersHtml(JSON.parse(resp));
    });

    var getBannersHtml = function (dataArray) {
        let mainHtml = '';
        let buttonHtml = '';
        for (let i = 0; i < dataArray.length; i++) {
            let active = i==0 ? "active" : ""
            buttonHtml += `<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="\${i}" class="\${active}" aria-current="true" aria-label="Slide \${i}"></button>`
            mainHtml += getSingleBannersHtml(dataArray[i],i==0)
        }
        $('#bannerSliderButtons').html(buttonHtml);
        $('#bannerSlider').html(mainHtml);
    }
    var getSingleBannersHtml = function (dataObj,isFirst) {
        console.log(dataObj);
        let active = isFirst ? "active" : "";
        let html = ``;
        html += `<div class="carousel-item \${active} myBanner_\${dataObj.id}">`;
        html += `    <h1>\${dataObj.title}</h1>`;
        html += `    <p>\${dataObj.description}</p>`;
        html += `</div>`;
        return html;
    }
</script>
<script src="<%=contextPath%>/UI/js/utils.js"></script>
<script>
    let demoTimeTable = {
        "slots": [
            {"id": 0, "label": "10:00 - 11:00"},
            {"id": 1, "label": "10:00 - 11:00"},
            {"id": 2, "label": "10:00 Break", "isBreak": true},
            {"id": 3, "label": "10:00 - 11:00"},
            {"id": 4, "label": "10:00 - 11:00"},
            {"id": 5, "label": "10:00 Break", "isBreak": true},
            {"id": 6, "label": "10:00 - 11:00"},
            {"id": 7, "label": "10:00 - 11:00"}
        ],
        "lacts": {
            "0": [
                {"dayId": 0, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 1, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 2, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 3, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 4, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 5, "sub": "Java_batch1", "faculty": "AB"}
            ],
            "1": [
                {"dayId": 0, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 1, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 2, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 4, "sub": "Java_batch_111", "faculty": "AB"},
                {"dayId": 4, "sub": "Java_batch_222", "faculty": "AB"}
            ],
            "4": [
                {"dayId": 0, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 1, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 2, "sub": "Java_batch1", "faculty": "AB"},
                {"dayId": 5, "sub": "Java_batch1", "faculty": "AB"}
            ]
        }
    }

    function createTable(singleTimeTable) {
        let breakLbl = 'Break';
        let emptyLabel = '--';
        let html = ``;
        html += `<table class="marker">`;
        html += `    <tr class="marker">`;
        html += `        <th class="marker">Time/Days</th>`;
        html += `        <th class="marker">Monday</th>`;
        html += `        <th class="marker">Tuesday</th>`;
        html += `        <th class="marker">Wednesday</th>`;
        html += `        <th class="marker">Thursday</th>`;
        html += `        <th class="marker">Friday</th>`;
        html += `        <th class="marker">Saturday</th>`;
        html += `    </tr>`;
        let slots = singleTimeTable.slots;
        let lacts = singleTimeTable.lacts;
        for (let i = 0; i < slots.length; i++) {
            let slot = slots[i];
            html += `<tr class="marker">`;
            html += `<td class="marker">\${slot.label}</td>`
            for (let j = 0; j < 6; j++) {
                if (slot.isBreak) {
                    html += `<td class="marker">\${breakLbl}</td>`
                } else {
                    let slotLactsArr = utils.safeValue(lacts[slot.id], false);
                    if (!slotLactsArr) {
                        html += `<td class="marker">\${emptyLabel}</td>`
                    } else {
                        html += `<td class="marker">`;
                        for (let k = 0; k < slotLactsArr.length; k++) {
                            lact = slotLactsArr[k];
                            let dayId = utils.safeValueInt(lact.dayId, -1);
                            if (dayId > -1 && dayId === j) {
                                html += getSingleLactHtml(lact) + "<br>";
                            }
                        }
                        html += `</td>`;
                    }
                }
            }
            html += `</tr>`
        }
        html += `</table>`
        return html;
    }

    var getSingleLactHtml = (lact) => {
        let html = ` `;
        html += `<span class="marker" data-lbl="\${lact.sub}_\${lact.faculty}">`
        html += `    <span>\${lact.sub}</span>`;
        html += `    <span>\${lact.faculty}</span>`;
        html += `</span>`
        return html;
    }
    $("#dynamicTable").empty().html(createTable(demoTimeTable));




</script>
</body>
</html>