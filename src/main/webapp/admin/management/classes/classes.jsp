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

    .semester-container, .classes-addnew-btn {
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

    .Class-edit-btn {
        margin-right: 1ch;
    }

</style>

<div class="main-class-container">
    <div class="main-class-container">
        <div>Classes</div>
        <div class="class-top">
            <div class="semester-container">
                <span>Select Semester:</span>
                <input type="text" class="form-control" id="txtSemester" placeholder="Select Semester">
            </div>
            <div class="class-container">
                <span>Select Class:</span>
                <input type="text" class="form-control" id="txtClass" placeholder="Select Class">
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
        {"id": 1, "semester": "1", "class": "AV001"},
        {"id": 2, "semester": "2", "class": "AV005"},
        {"id": 3, "semester": "3", "class": "AV007"},
        {"id": 4, "semester": "4", "class": "AV003"},
        {"id": 5, "semester": "5", "class": "AV005"},
        {"id": 6, "semester": "2", "class": "AV009"},
        {"id": 7, "semester": "7", "class": "AV003"}
    ]

    Classes.renderClassesList = function (classArr) {
        let html = '';
        for (let i = 0; i < classArr.length; i++) {
            let singleClassData = classArr[i]
            html += Classes.getSingleClassHtml(singleClassData, i);
        }
        
        $('#class-bottom').empty().html(html);
    }

    Classes.addClassNewClass = function () {
        if ($('#txtSemester').val() == '') {
            alert("Please Select Semester");
            return;
        }
        if ($('#txtClass').val() == '') {
            alert("Please Select Class");
            return;
        }
        let newClass = {
            "id": Classes.mainClassArr.length + 1,
            "semester": $('#txtSemester').val(),
            "class": $('#txtClass').val()
        }
        Classes.mainClassArr.push(newClass);
        $('#txtSemester').val('');
        $('#txtClass').val('');
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
        let html = '';
        html += '<div class="single-class-edit-container">';
        html += '   <div class="semester-container">';
        html += '       <span>Semester:</span>';
        html += '       <input type="text" class="form-control" id="txtEditSemester"  placeholder="Select Semester">';
        html += '   </div>';
        html += '   <div class="class-container">';
        html += '       <span>Class:</span>';
        html += '       <input type="text" class="form-control" id="txtEditClass" placeholder="Select Class">';
        html += '   </div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Edit Slot #" + allData.id,
            message: html,
            closable: true,
            closeByBackdrop: false,
            closeByKeyboard: false,
            onshown: function (dialogref) {
                $('#txtEditSemester').val(allData.semester);
                $('#txtEditClass').val(allData.class);
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
                    if ($('#txtEditSemester').val() == '') {
                        alert("Please Select Semester");
                        return;
                    }
                    if ($('#txtEditClass').val() == '') {
                        alert("Please Select Class");
                        return;
                    }
                    let newClass = {
                        "id": allData.id,
                        "semester": $('#txtEditSemester').val(),
                        "class": $('#txtEditClass').val()
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
        html += '   <span class="timeslot-text">' + cls.semester + ' - ' + cls.class + '</span>';
        html += '   <button class="Class-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(cls)) + '" data-arr-idx="' + idx + '" onclick="Classes.openClassEditDialog(this)"><i class="fa fa-edit"></i></button>';
        html += '   <button class="class-delete-btn btn btn-danger" data-class-id="' + cls.id + '" onclick="Classes.deleteClass(this)"> <i class="fa fa-trash"></i>';
        html += '   </button>';
        html += '</div>';
        return html;
    }

    $(document).ready(function () {
        Classes.renderClassesList(Classes.mainClassArr);
    })

</script>