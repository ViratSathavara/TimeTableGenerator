<style>
    .main-class-container {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

    .class-top {
        display: flex;
        width: 100%;
        align-items: flex-end;
        justify-content: flex-start;
    }

    .class-bottom {
        flex-direction: column;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        width: 100%;
    }

    .semester-container,.classes-addnew-btn {
        margin-right: 20px;
    }

    .single-class-container {
        border: 1px solid #718f92;
        display: flex;
        margin: 5px 0;
        align-items: center;
        width: 50%;
        background-color: #bde9ed;
        padding: 9px;
        border-radius: 7px;
    }

    .slotType-Lab {
        background-color: #bdcbed;
    }

    .slotType-Break {
        background-color: #eaedbd;
    }

    .timeslot-text {
        margin-right: auto;
        white-space: nowrap;
    }

    .Class-edit-btn{
        margin-right: 1ch;
    }

</style>

<div class="main-class-container">
    <div class="main-class-container">
        <div>Classes</div>
        <div class="class-top">
            <div class="semester-container">
                <span>Select Semester:</span>
                <input type="text" id="txtSelectSemester" placeholder="Select Semester">
            </div>
            <div class="class-container">
                <span>Select Class:</span>
                <input type="text" id="txtSelectClass" placeholder="Select Class">
            </div>
            <button class="classes-addnew-btn btn btn-success" onclick="Classes.addClassNewClass()">
                <i class="fa fa-plus" aria-hidden="true"></i> Add New
            </button>
        </div>

    </div>
    <div class="my-hres" style="width: 100%; height: 2px;background-color: #0a53be; margin-top: 10px"></div>
    <div class="class-bottom" id="class-bottom">

    </div>
</div>

<script>
    var Classes = function () {

    }

    Classes.mainClassArr = [
        {"id": 1, "semester":"1","class":"AV001"},
        {"id": 2, "semester":"2","class":"AV005"},
        {"id": 3, "semester":"3","class":"AV007"},
        {"id": 4, "semester":"4","class":"AV003"},
        {"id": 5, "semester":"5","class":"AV005"},
        {"id": 6, "semester":"2","class":"AV009"},
        {"id": 7, "semester":"7","class":"AV003"}
    ]

    Classes.renderClassesList = function (classArr) {
        let html = '';
        for (let i = 0; i < classArr; i++) {
            let singleClassData = classArr[i]
            html += Classes.getSingleClassHtml(singleClassData, i);
        }
        $('#class-bottom').empty().html(html);
    }
    Classes.currentlySelectedSemester = '';
    Classes.currentlySelectedClass = '';
    Classes.addClassNewClass = function () {
        if (Classes.currentlySelectedSemester == '') {
            alert("Please Select Semester");
            return;
        }
        if (Classes.currentlySelectedClass == '') {
            alert("Please Select Class");
            return;
        }
        let newClass = {
            "id": Classes.mainClassArr.length + 1,
            "semester": Classes.currentlySelectedSemester,
            "class": Classes.currentlySelectedClass
        }
        Classes.mainClassArr.push(newClass);
        Classes.currentlySelectedSemester = '';
        Classes.currentlySelectedClass = '';
        $('#txtSelectSemester').val('');
        $('#txtSelectClass').val('');
        Classes.renderClassesList(Classes.mainClassArr);
    }
    Classes.deleteClass = function (elem) {
        let id = $(elem).attr('data-class-id');
        if (id > 0) {
            let newArr = Classes.mainClassArr.filter((elem, idx) => {
                return elem.id != id
            });
            Classes.mainClassArr = newArr;
            Classes.renderClassesList(Classes.mainClassArr);
        }
    }

    Classes.openClassEditDialog = function (elem) {
        let allData = JSON.parse(atob($(elem).attr('data-allData')));
        let idx = $(elem).attr('data-arr-idx');
        Classes.currentlySelectedSemester = allData.semester;
        Classes.currentlySelectedClass = allData.class;
        let html = '';
       html += '<div className="single-class-edit-container">';
       html += '     <div className="semester-container">';
       html += '        <span>Semester:</span>';
       html += '        <div class="ui calendar" id="SelectSemester">'
        html +='             <div class="ui input left icon">';
       html += '                <input type="text"  placeholder="Select Semester">';
       html += '             </div>';
       html += '        </div>';
       html += '     </div>';
       html += '<div className="class-container">';
       html += '   <span>Class:</span>';
        html +='     <div class="ui calendar" id="SelectClass">'
        html +='       <div class="ui input left icon">';
       html += '           <input type="text" placeholder="Select Class">';
       html += '       </div>';
        html +='    </div>';
        html +='</div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Edit Slot #" + allData.id,
            message: html,
            closable: true,
            closeByBackdrop: false,
            closeByKeyboard: false,
            onshown: function (dialogref) {
                $('#SelectSemester').calendar({
                    type: 'time',
                    ampm: false,
                    onChange: function (date, time) {
                        Classes.currentlySelectedSemester = time
                    }
                });
                $('#SelectClass').calendar({
                    type: 'time',
                    ampm: false,
                    onChange: function (date, time) {
                        Classes.currentlySelectedClass = time
                    }
                });
            },
            buttons: [{
                label: 'Close',
                action: function (dialogRef) {
                    dialogRef.close();
                }
            }, {
                label: 'Save',
                icon: 'glyphicon glyphicon-check',
                cssClass: 'btn btn-success',
                action: function (dialogRef) {
                    if (Classes.currentlySelectedStartTime == '') {
                        alert("Please Select Semester");
                        return;
                    }
                    if (Classes.currentlySelectedClass == '') {
                        alert("Please Select Class");
                        return;
                    }
                    let newSlot = {
                        "id": allData.id,
                        "semester": Classes.currentlySelectedSemester,
                        "class": Classes.currentlySelectedClass
                    }
                    Classes.mainClassArr[idx] = newClass;
                    Classes.renderClassesList(Classes.mainClassArr);
                    dialogRef.close();
                }
            }]
        });
    }

    Classes.getSingleClassHtml = function (cls, idx) {
        let html = '';
        html += '<div class="single-class-container classType-' + cls.type + '">';
        html += '   <span class="timeslot-text">' + cls.startTime + ' To  ' + cls.endTime + ' ' + cls.type + '</span>';
        html += '   <button class="Class-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(cls)) + '" data-arr-idx="' + idx + '" onclick="Classes.openClassEditDialog(this)"></button>';
        html += '   <button class="class-delete-btn btn btn-danger" data-class-id="' + cls.id + '" onclick="Class.deleteClass(this)">';
        html += '   </button>';
        html += '</div>';
        return html;
    }

    $(document).ready(function () {
        $('#SelectSemester').calendar({
            type: 'time',
            ampm: false,
            onChange: function (date, time) {
                TimeSlot.currentlySelectedSemester = time
            }
        });
        $('#SelectClass').calendar({
            type: 'time',
            ampm: false,
            onChange: function (date, time) {
                TimeSlot.currentlySelectedClass = time
            }
        });

        Classes.renderClassesList(Classes.mainDateArr);
    })

</script>