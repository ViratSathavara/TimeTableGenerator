<%
    String contextPath = request.getContextPath();
%>
<style>
    .create-time-table-container {
        height: 90vh;
        overflow: auto;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: flex-start;
        width: 100%;
    }

    .create-time-table-top {
        display: flex;
        width: 100%;
        align-items: flex-start;
        justify-content: flex-start;
    }

    .create-time-table-bottom {
        display: flex;
        width: 100%;
        align-items: flex-start;
        justify-content: flex-start;
    }

    .selectSlots-container {
        display: flex;
        align-items: center;
        width: 50%;
    }

    #activeSlotsSelect {
        width: 50%;
    }

    .add-btn-container {
        display: flex;
        align-items: flex-end;
        justify-content: center;
        width: 100%;
    }
    .marker {
        border:1px solid #ff1493 !important;
        margin:2px;
        padding:2px;
        text-align: center;
    }
</style>
<div class="create-time-table-container">
    <div class="create-time-table-top">
        <div class="selectSlots-container">
            <select id="activeSlotsSelect" class="form-control" multiple="multiple"></select>
            <button class="btn btn-sm btn-success" style="margin-left: 1ch"
                    onclick="CreateTimeTable.slotsSelected()"><i class="fa fa-check"></i> Done
            </button>
        </div>
    </div>
    <div class="add-btn-container" style="display:none">
        <span class="day-select-container" style="margin:0 1ch;">
            Select Slot : 
            <select id="slotSelector" class="form-control">
                
            </select>
        </span>
        <span class="day-select-container" style="margin:0 1ch;">
            Select Day : 
            <select id="daySelector" class="form-control">
                <option value="0">Monday</option>
                <option value="1">Tuesday</option>
                <option value="2">Wednesday</option>
                <option value="3">Thursday</option>
                <option value="4">Friday</option>
                <option value="5">Saturday</option>
            </select>
        </span>
        <span class="subject-select-container" style="margin:0 1ch;">
            Select Subject : 
            <select id="subSelector" class="form-control">
                <option value="Java_batch0">Java_batch0</option>
                <option value="Java_batch1">Java_batch1</option>
                <option value="Java_batch2">Java_batch2</option>
                <option value="Java_batch3">Java_batch3</option>
                <option value="Java_batch4">Java_batch4-LAB</option>
                <option value="Java_batch5">Java_batch5</option>
            </select>
        </span>
        <span class="faculty-select-container" style="margin:0 1ch;">
            Select Teacher :
            <select id="facultySelector" class="form-control">
                <option value="A.B.">A.B.</option>
                <option value="A.B.">A.B.</option>
                <option value="A.B.">A.B.</option>
                <option value="A.B.">A.B.</option>
                <option value="A.B.">A.B.</option>
                <option value="A.B.">A.B.</option>
            </select>
        </span>
        <button class="btn btn-success" onclick="CreateTimeTable.addLectOnClick()" style="margin:0 1ch;"><i class="fa fa-plus">Add Lecture</i></button>
    </div>
    <div class="create-time-table-bottom">

    </div>
</div>
<script src="<%=contextPath%>/UI/js/utils.js"></script>
<script src="<%=contextPath%>/admin/TimeTable/createTimeTableDialogJS.js"></script>