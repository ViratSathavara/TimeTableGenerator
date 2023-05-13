<%
    String contextPath = request.getContextPath();
%>
<style>
    .table-title {
        font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif;
        font-size: 1.5rem;
    }

    .table-main-parent {
        width: 99%;
        height: 94vh;
    }

    .create-new-dialogref .modal-dialog {
        width: 90%;
    }
</style>
<div class="table-main-parent">
    <div class="table-top">
        <div class="table-title">Time Table Management</div>
        <div class="table-search-container">
            <div class="table-search"></div>
            <div class="add-btn"></div>
        </div>
    </div>
    <div class="table-bottom">
        <select class="form-control" id="classSelect">
            <option value="Class-0-Sem-0">Class-0-Sem-0</option>
            <option value="Class-1-Sem-1">Class-1-Sem-1</option>
            <option value="Class-2-Sem-2">Class-2-Sem-2</option>
            <option value="Class-3-Sem-3">Class-3-Sem-3</option>
            <option value="Class-4-Sem-4">Class-4-Sem-4</option>
            <option value="Class-5-Sem-5">Class-5-Sem-5</option>
        </select>
        <button class="btn-create-new btn btn-success" onclick="TimeTableMaster.showCreateNewTimeTableDialog()">
            <i class="fa fa-plus"></i> Create New Time Table
        </button>
    </div>
</div>
<script>
    var TimeTableMaster = function () {

    }
    TimeTableMaster.slotsArray = [
        {"id": 1, "startTime": "9:00", "endTime": "10:00", "type": "Lecture"},
        {"id": 2, "startTime": "10:00", "endTime": "11:00", "type": "Lecture"},
        {"id": 3, "startTime": "11:00", "endTime": "12:00", "type": "Lecture"},
        {"id": 4, "startTime": "12:00", "endTime": "13:00", "type": "Break"},
        {"id": 5, "startTime": "13:00", "endTime": "14:00", "type": "Lecture"},
        {"id": 6, "startTime": "14:00", "endTime": "15:00", "type": "Lab"},
        {"id": 7, "startTime": "15:00", "endTime": "16:00", "type": "Lab"}
    ]

    TimeTableMaster.showCreateNewTimeTableDialog = function () {
        $.get("<%=contextPath%>/admin/TimeTable/createTimeTableDialog.jsp", {}, function (resp) {
            resp = resp.replaceAll('\r\n', ' ');
            BootstrapDialog.show({
                title: "Create new time table for "+$('#classSelect').val(),
                cssClass: "create-new-dialogref",
                message: resp,
                closable: true,
                closeByBackdrop: false,
                closeByKeyboard: false,
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
                        dialogRef.close();
                    }
                }]
            });
        })

    }
</script>