<style>
    .main-subject-container {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

    .subject-top {
        display: flex;
        width: 100%;
        align-items: flex-end;
        justify-content: flex-start;
    }

    .subject-bottom {
        flex-direction: column;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        width: 100%;
    }

    .subject-container, .Subjects-addnew-btn {
        margin-right: 20px;
    }

    .single-subject-container {
        border: 1px solid #718f92;
        display: flex;
        margin: 5px 0;
        align-items: center;
        width: 50%;
        background-color: #bde9ed;
        padding: 9px;
        border-radius: 7px;
    }

    .timeslot-text {
        margin-right: auto;
        white-space: nowrap;
    }

    .Subject-edit-btn {
        margin-right: 1ch;
    }

</style>

<div class="main-subject-container">
    <div class="main-subject-container">
        <div>Subjects</div>
        <div class="subject-top">
            <div class="subject-container">
                <span>Select Semester:</span>
                <input type="text" class="form-control" id="txtSubject" placeholder="Select Subject">
            </div>
            <button class="Subjects-addnew-btn btn btn-success" onclick="Subjects.addSubjectNewSubject()">
                <i class="fa fa-plus" aria-hidden="true"></i> Add New
            </button>
        </div>

    </div>
    <div class="my-hres" style="width: 100%; height: 2px;background-color: #0a53be; margin-top: 10px"></div>
    <div class="subject-bottom" id="subject-bottom">

    </div>
</div>

<script>
    var Subjects = function () {

    }

    Subjects.mainSubjectArr = [
        {"id": 1, "subject": "ADA"},
        {"id": 2, "subject": "ADA"},
        {"id": 3, "subject": "ADA"},
        {"id": 4, "subject": "ADA"},
        {"id": 5, "subject": "ADA"},
        {"id": 6, "subject": "ADA"},
        {"id": 7, "subject": "ADA"}
    ]

    Subjects.renderSubjectsList = function (subjectArr) {
        let html = '';
        for (let i = 0; i < subjectArr.length; i++) {
            let singleSubjectData = subjectArr[i]
            html += Subjects.getSingleSubjectHtml(singleSubjectData, i);
        }

        $('#subject-bottom').empty().html(html);
    }

    Subjects.addSubjectNewSubject = function () {
        if ($('#txtSubject').val() == '') {
            alert("Please Select Subject");
            return;
        }
        let newSubject= {
            "id": Subjects.mainSubjectArr.length + 1,
            "subject": $('#txtSubject').val()
        }
        Subjects.mainSubjectArr.push(newSubject);
        $('#txtSubject').val('');
        Subjects.renderSubjectsList(Subjects.mainSubjectArr);
    }
    Subjects.deleteSubject = function (elem) {
        let id = $(elem).attr('data-subject-id');
        if (id > 0) {
            let newArr = Subjects.mainSubjectArr.filter((elem, idx) => {
                return elem.id != id
            });
            Subjects.mainSubjectArr = newArr;
            Subjects.renderSubjectsList(Subjects.mainSubjectArr);
        }
    }

    Subjects.openSubjectEditDialog = function (elem) {
        let allData = JSON.parse(atob($(elem).attr('data-allData')));
        let idx = $(elem).attr('data-arr-idx');
        let html = '';
        html += '<div class="single-class-edit-container">';
        html += '   <div class="semester-container">';
        html += '       <span>Semester:</span>';
        html += '       <input type="text" class="form-control" id="txtEditSubject"  placeholder="Select Subject">';
        html += '   </div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Edit Subject #" + allData.id,
            message: html,
            closable: true,
            closeByBackdrop: false,
            closeByKeyboard: false,
            onshown: function (dialogref) {
                $('#txtEditSubject').val(allData.subject);
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
                    if ($('#txtEditSubject').val() == '') {
                        alert("Please Select Subject");
                        return;
                    }
                    let newSubject= {
                        "id": allData.id,
                        "semester": $('#txtEditSubject').val()
                    }
                    Subjects.mainSubjectArr[idx] = newSubject;
                    Subjects.renderSubjectsList(Subjects.mainSubjectArr);
                    dialogRef.close();
                }
            }]
        });
    }

    Subjects.getSingleSubjectHtml = function (sub, idx) {
        let html = '';
        html += '<div class="single-subject-container classType-' + sub.type + '">';
        html += '   <span class="timeslot-text">' + sub.subject + '</span>';
        html += '   <button class="Subject-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(sub)) + '" data-arr-idx="' + idx + '" onclick="Subjects.openSubjectEditDialog(this)"><i class="fa fa-edit"></i></button>';
        html += '   <button class="class-delete-btn btn btn-danger" data-subject-id="' + sub.id + '" onclick="Subjects.deleteSubject(this)"> <i class="fa fa-trash"></i>';
        html += '   </button>';
        html += '</div>';
        return html;
    }

    $(document).ready(function () {
        Subjects.renderSubjectsList(Subjects.mainSubjectArr);
    })

</script>