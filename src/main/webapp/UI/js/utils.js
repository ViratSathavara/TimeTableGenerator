let data = ['Ram', 'Shyam', 'Sita', 'Gita' ];


let list = document.getElementById("myList");

data.forEach((item)=>{
    let li = document.createElement("li");
    li.innerText = item;
    list.appendChild(li);
})

function funCall(myArray){
    var html = "<table border ='1|1'>"
        for (var i = 0;i<myArray.length;i++) {
            html += '<tr>';
            html += '<td>' +myArray[i].id+'</td>';
            html += '<td>'+myArray[i].name+'</td>';
            html += '<td>' +myArray[i].age+'</td>';
            html += '<td>' +myArray[i].EnrollmentNo+'</td>';
            html += '</tr>';
        }
    document.getElementById("Table").innerHTML = html
}



var branch = [
    'computer engineering','civil engineering','mechanical engineering','electrical engineering','Chemical engineering','Interdisciplinary'
]
var option = "";
for (var i=0;i<branch.length;i++)
{
option += '<option value="'+branch[i] +'">' + branch[i] +  "</option>>"
}
document.getElementById('branch').innerHTML = option;


$(document).ready(function () {
    let url = contextPath +"rest/general/getData";
    $.get(url,{},function (resp) {
        funCall(JSON.parse(resp));
    })
})