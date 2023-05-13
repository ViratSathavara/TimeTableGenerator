var CreateTimeTable = function () {

}
CreateTimeTable.selectedClass = '';
CreateTimeTable.activeSlots = [];
CreateTimeTable.originalSlotsArray = [];
CreateTimeTable.lacts = {};

CreateTimeTable.loadSlots = function () {
    CreateTimeTable.originalSlotsArray = TimeTableMaster.slotsArray.map((elem, idx) => {
        return {
            "id": elem.id,
            "label": elem.startTime + ' - ' + elem.endTime + ' - ' + elem.type,
            "isBreak": elem.type == "Break"
        }
    });
    let allOptions = CreateTimeTable.originalSlotsArray.map((elem, idx) => {
        return '<option value="' + elem.id + '">' + elem.label + '</option>';
    });
    $('#activeSlotsSelect').empty().html(allOptions.join(' '));
    $('#activeSlotsSelect').multiselect({
        numberDisplayed: 1
    })
}

$(document).ready(function () {

})