let data = ['Ram', 'Shyam', 'Sita', 'Gita' ];


let list = document.getElementById("myList");

data.forEach((item)=>{
    let li = document.createElement("li");
    li.innerText = item;
    list.appendChild(li);
})


function  funCall(){
    var myArray = [
        {'name':'virat',id:1,'age':21,'EnrollmentNo':200780107029},
        {'name':'kevin',id:2,'age':20,'EnrollmentNo':200780107035},
        {'name':'smit',id:3,'age':21,'EnrollmentNo':200780107042},
        {'name':'dhruv',id:4,'age':19,'EnrollmentNo':200780107034},
        {'name':'dev',id:5,'age':17,'EnrollmentNo':200780107011},
        {'name':'piyush',id:6,'age':22,'EnrollmentNo':200780107038}
    ]
    var html = "<table border ='1|1'>"
    setTimeout(()=> {
        for (var i = 0;i<myArray.length;i++) {
            html += '<tr>';
            html += '<td>' +myArray[i].id+'</td>';
            html += '<td>'+myArray[i].name+'</td>';
            html += '<td>' +myArray[i].age+'</td>';
            html += '<td>' +myArray[i].EnrollmentNo+'</td>';
            html += '</tr>';
        }

    document.getElementById("Table").innerHTML = html
},500);

}
funCall()


var branch = [
    'computer engineering','civil engineering','mechanical engineering','electrical engineering','Chemical engineering','Interdisciplinary'
]
var option = "";
for (var i=0;i<branch.length;i++)
{
option += '<option value="'+branch[i] +'">' + branch[i] +  "</option>>"
}
document.getElementById('branch').innerHTML = option