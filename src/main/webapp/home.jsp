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
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 7"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" aria-label="Slide 8"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8" aria-label="Slide 9"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="9" aria-label="Slide 10"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <h1>heading 1</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 2</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 3</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 4</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 5</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 6</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 7</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 8</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 9</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
        <div class="carousel-item">
            <h1>heading 10</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab amet dicta dolores ducimus earum est excepturi hic, incidunt ipsum iure labore molestias officia possimus praesentium quas quibusdam temporibus tenetur vel veritatis voluptatum. Adipisci, atque, culpa debitis deleniti dolorum et eum facere illum minima numquam pariatur quod ratione repellat reprehenderit voluptas.</p>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div id="dynamicTable">

</div>


<img src="a.jpg" id="mainImage_1" class="main-image" style="width: 100vw; height: 50vh;" >
<img src="b.jpg" id="mainImage_2" class="main-image" style="width: 100vw; height: 50vh;" >
<img src="c.jpg" id="mainImage_3" class="main-image" style="width: 100vw; height: 50vh;" >
<img src="d.jpg" id="mainImage_4" class="main-image" style="width: 100vw; height: 50vh;" >
<button onclick="changeImage()" style="margin-top: 20px; padding: 10px; width: 100px;">next</button>
<script>
    var contextPath = "<%=contextPath%>/"
    $('.main-image').hide();
    $('#mainImage_1').fadeIn();
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



    var myImage = document.getElementById('mainImage');
    var imageAray = ["a.jpg","b.jpg","c.jpg","d.jpg"];
    var imageIndex = 1;

    function changeImage(){
        $('.main-image').fadeOut();
        $(`#mainImage_\${imageIndex}`).fadeIn();
        imageIndex++;
        if (imageIndex > 4) {
            imageIndex = 1;
        }
    }

</script>
</body>
</html>