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
<%--    <jsp:include page="commonJsCss.jsp"></jsp:include>--%>
    </head>
<body>
<script src="<%=contextPath%>/UI/libs/Jquery/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<div class="navigation">
    <div class="left-menu">
        <div class="logo">
            <a href=""> <img class="logo-img" src="./UI/images/logo.png" alt="logo"></a>
        </div>
        <div class="heading">
            <p class="title">Time Table Generator</p>
            <p class="college">Smt. S. R. Patel Engineering College, Unjha</p>
        </div>
    </div>
    <div class="right-menu">
        <a href="<%=contextPath%>/LoginPage" style="border: 2px solid black; padding: 10px; border-radius: 10px; background-color: #0a53be;color: white;text-decoration: none">Login</a>
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

<div class="home-filters" style="width: 90%; display: flex;align-items: center;justify-content: center;margin: 5px;padding: 5px">
<select class="form-control" style="width: 25ch;margin:0 5px;text-align: center;background-color: #0a53be;color: white" >
    <option value="-1">--Select Branch--</option>
    <option value="Computer">Computer</option>
    <option value="Civil">Civil</option>
    <option value="Mechnical">Mechnical</option>
</select><select class="form-control" style="width: 25ch;background-color: #0a53be;margin:0 5px;text-align: center;color: white">
    <option value="-1">--Select Semester--</option>
    <option value="Computer">Semester 1</option>
    <option value="Computer">Semester 2</option>
    <option value="Computer">Semester 3</option>
    <option value="Computer">Semester 4</option>
    <option value="Computer">Semester 5</option>
    <option value="Civil">Semester 6</option>
    <option value="Mechnical">Semester 7</option>
    <option value="Mechnical">Semester 8</option>
</select>
    <button class="btn btn-info"style="margin: 0 5px;color: white;background-color: #0a53be"><i class="fa fa-search"></i> Search</button>
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
            {"id": 0, "label": "9:00 - 10:00"},
            {"id": 1, "label": "10:00 - 11:00"},
            {"id": 2, "label": "11:00 - 11:40", "isBreak": true},
            {"id": 3, "label": "11:40 - 12:40"},
            {"id": 4, "label": "12:40 - 01:40"},
            {"id": 5, "label": "01:40 - 01-50", "isBreak": true},
            {"id": 6, "label": "01:50 - 02:50"},
            {"id": 7, "label": "02:50 - 03:50"}
        ],
        "lacts": {
            "0": [
                {"dayId": 0, "sub": "WP", "faculty": "SP"},
                {"dayId": 1, "sub": "MPI", "faculty": "JRP"},
                {"dayId": 2, "sub": "IOT", "faculty": "AA"},
                {"dayId": 3, "sub": "TOC", "faculty": "APT"},
                {"dayId": 4, "sub": "WP", "faculty": "SP"},
                {"dayId": 5, "sub": "MPI", "faculty": "JRP"}
            ],
            "1": [
                {"dayId": 0, "sub": "FREE SLOT", "faculty": " "},
                {"dayId": 1, "sub": "WP", "faculty": "SP"},
                {"dayId": 2, "sub": "MPI", "faculty": "JRP"},
                {"dayId": 3, "sub": "SS", "faculty": "APT"},
                {"dayId": 4, "sub": "IOT", "faculty": "AA"},
                {"dayId": 5, "sub": "MPI", "faculty": "JRP"}
            ],
            "3": [
                {"dayId": 0, "sub": "WP[C62]", "faculty": "SP[LAB-2]"},
                {"dayId": 0, "sub": "SS[C61]", "faculty": "RP[LAB-5]"},
                {"dayId": 1, "sub": "TOC", "faculty": "APT"},
                {"dayId": 2, "sub": "SEMINAR", "faculty": "SP"},
                {"dayId": 3, "sub": "TOC", "faculty": "APT"},
                {"dayId": 4, "sub": "IPDC", "faculty": "VM[HC112]"},
                {"dayId": 5, "sub": "MPI[C61]", "faculty": "JRP[LAB-2]"},
                {"dayId": 5, "sub": "WP[C62]", "faculty": "SP[LAB-1]"}
            ],
            "4": [

                {"dayId": 0, "sub": "WP[C62]", "faculty": "SP[LAB-2]"},
                {"dayId": 0, "sub": "SS[C61]", "faculty": "RP[LAB-5]"},
                {"dayId": 1, "sub": "SS", "faculty": "APT"},
                {"dayId": 2, "sub": "SEMINAR", "faculty": "SP"},
                {"dayId": 3, "sub": "SEMINAR", "faculty": "SP"},
                {"dayId": 4, "sub": "IPDC", "faculty": "VM[HC112]"},
                {"dayId": 5, "sub": "MPI[C61]", "faculty": "JRP[LAB-2]"},
                {"dayId": 5, "sub": "WP[C62]", "faculty": "SP[LAB-1]"}
            ],
            "6": [
                {"dayId": 0, "sub": "SS[C62]", "faculty": "RP[LAB-2]"},
                {"dayId": 0, "sub": "IOT[C61]", "faculty": "AA[LAB-5]"},
                {"dayId": 1, "sub": "TOC", "faculty": "APT"},
                {"dayId": 2, "sub": "SS[C61]", "faculty": "RP[LAB-2]"},
                {"dayId": 2, "sub": "IOT[C62]", "faculty": "AA[LAB-5]"},
                {"dayId": 3, "sub": "DE-||", "faculty": "AA"},
                {"dayId": 4, "sub": "WP[C61]", "faculty": "SP[LAB-5]"},
                {"dayId": 4, "sub": "MPI[C62]", "faculty": "JRP[LAB-2]"},
                {"dayId": 5, "sub": "WP", "faculty": "SP"}
            ],
            "7": [
                {"dayId": 0, "sub": "SS[C62]", "faculty": "RP[LAB-2]"},
                {"dayId": 0, "sub": "IOT[C61]", "faculty": "AA[LAB-5]"},
                {"dayId": 1, "sub": "SS", "faculty": "APT"},
                {"dayId": 2, "sub": "SS[C61]", "faculty": "RP[LAB-2]"},
                {"dayId": 2, "sub": "IOT[C62]", "faculty": "AA[LAB-5]"},
                {"dayId": 3, "sub": "DE-||", "faculty": "AA"},
                {"dayId": 4, "sub": "WP[C61]", "faculty": "SP[LAB-5]"},
                {"dayId": 4, "sub": "MPI[C62]", "faculty": "JRP[LAB-2]"},
                {"dayId": 5, "sub": "WP", "faculty": "SP"}
            ]
        }
    }



    function createTable(singleTimeTable) {
        let breakLbl = 'Break';
        let emptyLabel = '--';
        let html = ``;
        html += `<table id="main-table" class="marker" style="color: #1b1e21;border-radius: 5px">`;
        html += `    <tr class="tr-table" style="border: 2px solid black;text-align: center">`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff0000">Time/Days</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Monday</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Tuesday</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Wednesday</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Thursday</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Friday</th>`;
        html += `        <th class="marker"style="font-size: 25px;border: 2px solid black;text-align: center;padding: 5px;background-color: #ff3838">Saturday</th>`;
        html += `    </tr>`;
        let slots = singleTimeTable.slots;
        let lacts = singleTimeTable.lacts;
        for (let i = 0; i < slots.length; i++) {
            let slot = slots[i];
            html += `<tr class="marker" style="font-size: 20px;border: 2px solid black;background-color: #33c712;text-align: center">`;
            html += `<td class="marker" style="background-color: #ff3838;font-size: 25px;font-weight: bolder;padding: 5px;text-align: center;">\${slot.label}</td>`
            for (let j = 0; j < 6; j++) {
                if (slot.isBreak) {
                    html += `<td class="marker" style="  border: 2px solid black;font-weight: bolder;background-color: #15c8ce;font-size: 20px">\${breakLbl}</td>`
                } else {
                    let slotLactsArr = utils.safeValue(lacts[slot.id], false);
                    if (!slotLactsArr) {
                        html += `<td class="marker">\${emptyLabel}</td>`
                    } else {
                        html += `<td class="marker" style="border: 2px solid black">`;
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