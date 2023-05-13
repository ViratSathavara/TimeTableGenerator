<style>
    .main-class-container {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

    .timeslot-top {
        display: flex;
        width: 100%;
        align-items: flex-end;
        justify-content: flex-start;
    }

    .timeslot-bottom {
        flex-direction: column;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        width: 100%;
    }

    .start-date-container, .end-date-container, .slottype-select-container, .timeslots-addnew-btn {
        margin-right: 20px;
    }

    .single-timeslot-container {
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

    .timeslot-edit-btn {
        margin-right: 1ch;
    }

</style>

<div class="main-class-container">
    <div>Time Slots</div>
    <div class="timeslot-top">
        <div class="start-date-container">
            <span>Start-Time:</span>
            <div class="ui calendar" id="startTime">
                <div class="ui input left icon">
                    <i class="time icon"></i>
                    <input type="text" id="txtStartTime" placeholder="Start-Time">
                </div>
            </div>
        </div>
        <div class="end-date-container">
            <span>End-Time:</span>
            <div class="ui calendar" id="endTime">
                <div class="ui input left icon">
                    <i class="time icon"></i>
                    <input type="text" id="txtEndTime" placeholder="End-Time">
                </div>
            </div>
        </div>
        <div class="slottype-select-container">
            <span>Slot-Type:</span>
            <select class="form-control" id="slottype-select">
                <option value="Lecture">Lecture</option>
                <option value="Break">Break</option>
                <option value="Lab">Lab</option>
            </select>
        </div>
        <button class="timeslots-addnew-btn btn btn-success" onclick="TimeSlot.addSlotNewSlot()">
            <i class="fa fa-plus" aria-hidden="true"></i> Add New
        </button>
    </div>
    <div class="my-hres" style="width: 100%; height: 2px;background-color: #0a53be; margin-top: 10px"></div>
    <div class="timeslot-bottom" id="timeslot-bottom">

    </div>
</div>

<script>
    var TimeSlot = function () {

    }
    TimeSlot.mainDateArr = [
        {"id": 1, "startTime": "9:00", "endTime": "10:00", "type": "Lecture"},
        {"id": 2, "startTime": "10:00", "endTime": "11:00", "type": "Lecture"},
        {"id": 3, "startTime": "11:00", "endTime": "12:00", "type": "Lecture"},
        {"id": 4, "startTime": "12:00", "endTime": "13:00", "type": "Break"},
        {"id": 5, "startTime": "13:00", "endTime": "14:00", "type": "Lecture"},
        {"id": 6, "startTime": "14:00", "endTime": "15:00", "type": "Lab"},
        {"id": 7, "startTime": "15:00", "endTime": "16:00", "type": "Lab"}
    ]

    TimeSlot.renderTimeSlotsList = function (dataArr) {
        let html = '';
        for (let i = 0; i < dataArr.length; i++) {
            let singleSlotData = dataArr[i]
            html += TimeSlot.getSingleSlotHtml(singleSlotData, i);
        }
        $('#timeslot-bottom').empty().html(html);
    }
    TimeSlot.currentlySelectedStartTime = '';
    TimeSlot.currentlySelectedEndTime = '';
    TimeSlot.addSlotNewSlot = function () {
        if (TimeSlot.currentlySelectedStartTime == '') {
            alert("Please Select Start Time");
            return;
        }
        if (TimeSlot.currentlySelectedEndTime == '') {
            alert("Please Select End Time");
            return;
        }
        let newSlot = {
            "id": TimeSlot.mainDateArr.length + 1,
            "startTime": TimeSlot.currentlySelectedStartTime,
            "endTime": TimeSlot.currentlySelectedEndTime,
            "type": $('#slottype-select').val()
        }
        TimeSlot.mainDateArr.push(newSlot);
        TimeSlot.currentlySelectedStartTime = '';
        TimeSlot.currentlySelectedEndTime = '';
        $('#txtStartTime').val('');
        $('#txtEndTime').val('');
        $('#slottype-select').val('Lecture');
        TimeSlot.renderTimeSlotsList(TimeSlot.mainDateArr);
    }
    TimeSlot.deleteSlot = function (elem) {
        let id = $(elem).attr('data-slot-id');
        if (id > 0) {
            let newArr = TimeSlot.mainDateArr.filter((elem, idx) => {
                return elem.id != id
            });
            TimeSlot.mainDateArr = newArr;
            TimeSlot.renderTimeSlotsList(TimeSlot.mainDateArr);
        }
    }

    TimeSlot.openSlotEditDialog = function (elem) {
        let allData = JSON.parse(atob($(elem).attr('data-allData')));
        let idx = $(elem).attr('data-arr-idx');
        TimeSlot.currentlySelectedStartTime = allData.startTime;
        TimeSlot.currentlySelectedEndTime = allData.endTime;
        let html = '';
        html += '<div class="single-slot-edit-container">';
        html += '   <div class="start-date-container">';
        html += '       <span>Start-Time:</span>';
        html += '       <div class="ui calendar" id="editStartTime">';
        html += '           <div class="ui input left icon">';
        html += '               <i class="time icon"></i>';
        html += '               <input type="text" placeholder="Start-Time" value="' + allData.startTime + '">';
        html += '           </div>';
        html += '       </div>';
        html += '   </div>';
        html += '   <div class="end-date-container">';
        html += '       <span>End-Time:</span>';
        html += '       <div class="ui calendar" id="editEndTime">';
        html += '           <div class="ui input left icon">';
        html += '               <i class="time icon"></i>';
        html += '               <input type="text" placeholder="End-Time" value="' + allData.endTime + '">';
        html += '           </div>';
        html += '       </div>';
        html += '   </div>';
        html += '   <div class="slottype-select-container">';
        html += '       <span>Slot-Type:</span>';
        html += '       <select class="form-control" id="slottype-select-edit">';
        html += '           <option value="Lecture" ' + (allData.type == 'Lecture' ? 'selected' : '') + '>Lecture</option>';
        html += '           <option value="Break" ' + (allData.type == 'Break' ? 'selected' : '') + '>Break</option>';
        html += '           <option value="Lab" ' + (allData.type == 'Lab' ? 'selected' : '') + '>Lab</option>';
        html += '       </select>';
        html += '   </div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Edit Slot #" + allData.id,
            message: html,
            closable: true,
            closeByBackdrop: false,
            closeByKeyboard: false,
            onshown: function (dialogref) {
                $('#editStartTime').calendar({
                    type: 'time',
                    ampm: false,
                    onChange: function (date, time) {
                        TimeSlot.currentlySelectedStartTime = time
                    }
                });
                $('#editEndTime').calendar({
                    type: 'time',
                    ampm: false,
                    onChange: function (date, time) {
                        TimeSlot.currentlySelectedEndTime = time
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
                    if (TimeSlot.currentlySelectedStartTime == '') {
                        alert("Please Select Start Time");
                        return;
                    }
                    if (TimeSlot.currentlySelectedEndTime == '') {
                        alert("Please Select End Time");
                        return;
                    }
                    let newSlot = {
                        "id": allData.id,
                        "startTime": TimeSlot.currentlySelectedStartTime,
                        "endTime": TimeSlot.currentlySelectedEndTime,
                        "type": $('#slottype-select-edit').val()
                    }
                    TimeSlot.mainDateArr[idx] = newSlot;
                    TimeSlot.renderTimeSlotsList(TimeSlot.mainDateArr);
                    dialogRef.close();
                }
            }]
        });
    }

    TimeSlot.getSingleSlotHtml = function (data, idx) {
        let html = '';
        html += '<div class="single-timeslot-container slotType-' + data.type + '">';
        html += '   <span class="timeslot-text">' + data.startTime + ' To  ' + data.endTime + ' ' + data.type + '</span>';
        html += '   <button class="timeslot-edit-btn btn btn-info" data-allData="' + btoa(JSON.stringify(data)) + '" data-arr-idx="' + idx + '" onclick="TimeSlot.openSlotEditDialog(this)">';
        html += '       <i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
        html += '   </button>';
        html += '   <button class="timeslot-delete-btn btn btn-danger" data-slot-id="' + data.id + '" onclick="TimeSlot.deleteSlot(this)">';
        html += '       <i class="fa fa-trash" aria-hidden="true"></i>';
        html += '   </button>';
        html += '</div>';
        return html;
    }

    $(document).ready(function () {
        $('#startTime').calendar({
            type: 'time',
            ampm: false,
            onChange: function (date, time) {
                TimeSlot.currentlySelectedStartTime = time
            }
        });
        $('#endTime').calendar({
            type: 'time',
            ampm: false,
            onChange: function (date, time) {
                TimeSlot.currentlySelectedEndTime = time
            }
        });
        TimeSlot.renderTimeSlotsList(TimeSlot.mainDateArr);
    })
</script>