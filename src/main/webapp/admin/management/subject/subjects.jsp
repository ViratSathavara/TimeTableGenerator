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

  .subject-container,.classes-addnew-btn {
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

  .timeslot-text {
    margin-right: auto;
    white-space: nowrap;
  }

  .Class-edit-btn{
    margin-right: 1ch;
  }

</style>

<div class="main-subject-container">
    <div>Subjects</div>
    <div class="subject-top">
      <div class="subject-container">
        <span>Select Subject:</span>
        <input type="text" id="txtSelectsubject" placeholder="Select Subject">
      </div>
      <button class="classes-addnew-btn btn btn-success" onclick="Subjects.addSubjectNewSubject()">
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
    {"id": 1, "subject":"ADA"},
    {"id": 2, "subject":"ADA"},
    {"id": 3, "subject":"ADA"},
    {"id": 4, "subject":"ADA"},
    {"id": 5, "subject":"ADA"},
    {"id": 6, "subject":"ADA"},
    {"id": 7, "subject":"ADA"}
  ]

  Subjects.renderSubjectsList = function (subjectArr) {
    let html = '';
    for (let i = 0; i < subjectArr; i++) {
      let singleSubjectData = subjectArr[i]
      html += Subjects.getSingleClassHtml(singleSubjectData, i);
    }
    $('#subject-bottom').empty().html(html);
  }
  Subjects.getSingleClassHtml = function (){}
  Subjects.currentlySelectedSubject = '';
  Subjects.addSubjectNewSubject = function () {
    if (Subjects.currentlySelectedSubject == '') {
      alert("Please Select Subject");
      return;
    }
    let newSubject = {
      "id": Subjects.mainSubjectArr.length + 1,
      "subject": Subjects.currentlySelectedSubject
    }
    Subjects.mainSubjectArr.push(newSubject);
    Subjects.currentlySelectedSubject = '';
    $('#txtSelectsubject').val('');
    Subjects.renderSubjectsList(Subjects.mainSubjectArr);
  }
  Subjects.deleteSubject = function (elem) {
    let id = $(elem).attr('data-subject-id');
    if (id > 0) {
      let newArr = Subjects.mainSubjectArr.filter((elem, idx) => {
        return elem.id != id
      });
      Subjects.mainClassArr = newArr;
      Subjects.renderSubjectsList(Subjects.mainSubjectArr);
    }
  }

  Subjects.openSubjectEditDialog = function (elem) {
    let allData = JSON.parse(atob($(elem).attr('data-allData')));
    let idx = $(elem).attr('data-sub-idx');
    Subjects.currentlySelectedSubject = allData.subject;
    let html = '';
    html += '<div className="single-subject-edit-container">';
    html += '     <div className="subject-container">';
    html += '        <span>Semester:</span>';
    html += '        <div class="ui calendar" id="SelectSubject">'
    html +='             <div class="ui input left icon">';
    html += '                <input type="text"  placeholder="Select Subject">';
    html += '             </div>';
    html += '        </div>';
    html += '     </div>';
    html += '</div>';
    BootstrapDialog.show({
      title: "Edit Subject " + allData.id,
      message: html,
      closable: true,
      closeByBackdrop: false,
      closeByKeyboard: false,
      onshown: function (dialogref) {
        $('#SelectSubject').calendar({
          type: 'time',
          ampm: false,
          onChange: function (date, time) {
            Subjects.currentlySelectedSemester = time
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
          if (Subjects.currentlySelectedSubject == '') {
            alert("Please Select Semester");
            return;
          }

          let newSlot = {
            "id": allData.id,
            "subject": Subjects.currentlySelectedSubject
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
    html += '<div class="single-class-container classType-' + sub.type + '">';
    html += '   <span class="timeslot-text">' + cls.startTime+ ' ' + sub.type + '</span>';
    html += '   <button class="Subject-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(sub)) + '"data-sub-idx="' + idx + '" onclick="Subjects.openSubjectEditDialog(this)"></button>';
    html += '   <button class="Subject-delete-btn btn btn-danger" data-subject-id="' + sub.id + '" onclick="sub.deleteSubject(this)">';
    html += '   </button>';
    html += '</div>';
    return html;
  }

  $(document).ready(function () {
    $('#SelectSubject').calendar({
      type: 'time',
      ampm: false,
      onChange: function (date, time) {
        TimeSlot.currentlySelectedSubject = time
      }
    });

    Subjects.renderSubjectsList(Subjects.mainSubjectArr);
  })

</script>