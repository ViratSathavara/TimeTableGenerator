<style>
  .main-teacher-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
    justify-content: center;
  }

  .teacher-top {
    display: flex;
    width: 100%;
    align-items: flex-end;
    justify-content: flex-start;
  }

  .teacher-bottom {
    flex-direction: column;
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
    width: 100%;
  }

  .teacher-container, .Teachers-addnew-btn {
    margin-right: 20px;
  }

  .single-teacher-container {
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

  .Teacher-edit-btn {
    margin-right: 1ch;
  }

</style>

<div class="main-teacher-container">
  <div class="main-teacher-container">
    <div>Teachers</div>
    <div class="teacher-top">
      <div class="teacher-container">
        <span>Select teacher:</span>
        <input type="text" class="form-control" id="txtTeacher" placeholder="Select Teacher">
      </div>
      <button class="Teachers-addnew-btn btn btn-success" onclick="Teachers.addTeacherNewTeacher()">
        <i class="fa fa-plus" aria-hidden="true"></i> Add New
      </button>
    </div>

  </div>
  <div class="my-hres" style="width: 100%; height: 2px;background-color: #0a53be; margin-top: 10px"></div>
  <div class="teacher-bottom" id="teacher-bottom">

  </div>
</div>

<script>
  var Teachers = function () {

  }

  Teachers.mainTeacherArr = [
    {"id": 1, "teacher": "J.R.P. SIR"},
    {"id": 2, "teacher": "J.R.P. SIR"},
    {"id": 3, "teacher": "J.R.P. SIR"},
    {"id": 4, "teacher": "J.R.P. SIR"},
    {"id": 5, "teacher": "J.R.P. SIR"},
    {"id": 6, "teacher": "J.R.P. SIR"},
    {"id": 7, "teacher": "J.R.P. SIR"}
  ]

  Teachers.renderTeachersList = function (teacherArr) {
    let html = '';
    for (let i = 0; i < teacherArr.length; i++) {
      let singleTeacherData = teacherArr[i]
      html += Teachers.getSingleTeacherHtml(singleTeacherData, i);
    }

    $('#teacher-bottom').empty().html(html);
  }

  Teachers.addTeacherNewTeacher = function () {
    if ($('#txtTeacher').val() == '') {
      alert("Please Select Teacher");
      return;
    }
    let newTeacher = {
      "id": Teachers.mainTeacherArr.length + 1,
      "teacher": $('#txtTeacher').val()
    }
    Teachers.mainTeacherArr.push(newTeacher);
    $('#txtTeacher').val('');
    Teachers.renderTeachersList(Teachers.mainTeacherArr);
  }
  Teachers.deleteTeacher = function (elem) {
    let id = $(elem).attr('data-teacher-id');
    if (id > 0) {
      let newArr = Teachers.mainTeacherArr.filter((elem, idx) => {
        return elem.id != id
      });
      Teachers.mainTeacherArr = newArr;
      Teachers.renderTeachersList(Teachers.mainTeacherArr);
    }
  }

  Teachers.openTeacherEditDialog = function (elem) {
    let allData = JSON.parse(atob($(elem).attr('data-allData')));
    let idx = $(elem).attr('data-arr-idx');
    let html = '';
    html += '<div class="single-class-edit-container">';
    html += '   <div class="teacher-container">';
    html += '       <span>teacher:</span>';
    html += '       <input type="text" class="form-control" id="txtEditTeacher"  placeholder="Select Teacher">';
    html += '   </div>';
    html += '</div>';
    BootstrapDialog.show({
      title: "Edit Teacher #" + allData.id,
      message: html,
      closable: true,
      closeByBackdrop: false,
      closeByKeyboard: false,
      onshown: function (dialogref) {
        $('#txtEditTeacher').val(allData.teacher);
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
          if ($('#txtEditTeacher').val() == '') {
            alert("Please Select Teacher");
            return;
          }
          let newTeacher= {
            "id": allData.id,
            "teacher": $('#txtEditTeacher').val()
          }
          Teachers.mainTeacherArr[idx] = newTeacher;
          Teachers.renderTeachersList(Teachers.mainTeacherArr);
          dialogRef.close();
        }
      }]
    });
  }

  Teachers.getSingleTeacherHtml = function (tchr, idx) {
    let html = '';
    html += '<div class="single-teacher-container classType-' + tchr.type + '">';
    html += '   <span class="timeslot-text">' + tchr.teacher + '</span>';
    html += '   <button class="Teacher-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(tchr)) + '" data-arr-idx="' + idx + '" onclick="Teachers.openTeacherEditDialog(this)"><i class="fa fa-edit"></i></button>';
    html += '   <button class="teacher-delete-btn btn btn-danger" data-teacher-id="' + tchr.id + '" onclick="Teachers.deleteTeacher(this)"> <i class="fa fa-trash"></i>';
    html += '   </button>';
    html += '</div>';
    return html;
  }

  $(document).ready(function () {
    Teachers.renderTeachersList(Teachers.mainTeacherArr);
  })

</script>