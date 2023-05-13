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
CreateTimeTable.slotsSelected = function () {
    let selectedSlotsId = $('#activeSlotsSelect').val();
    if (selectedSlotsId.length <= 0) {
        alert("Please select at lease few slots.")
        return;
    }
    $('.selectSlots-container').hide();
    $('.add-btn-container').show();
    for (let i = 0; i < selectedSlotsId.length; i++) {
        let slotid = selectedSlotsId[i];
        for (let j = 0; j < CreateTimeTable.originalSlotsArray.length; j++) {
            if (CreateTimeTable.originalSlotsArray[j].id == slotid) {
                CreateTimeTable.activeSlots.push(CreateTimeTable.originalSlotsArray[j])
                break;
            }
        }
    }
    let slotsOptions = CreateTimeTable.activeSlots.map((elem, idx) => {
        return '<option value="' + elem.id + '">' + elem.label + '</option>';
    });
    $('#slotSelector').empty().html(slotsOptions.join(' '));
    let dtx = {
        "slots": CreateTimeTable.activeSlots, "lacts": CreateTimeTable.lacts
    }
    CreateTimeTable.renderTimeTable(dtx);
}
CreateTimeTable.addLectOnClick = function () {
    let slotId = $('#slotSelector').val();
    let dayId = $('#daySelector').val();
    let sub = $('#subSelector').val();
    let faculty = $('#facultySelector').val();
    let singleSlotLectS = CreateTimeTable.lacts[slotId];
    if (singleSlotLectS == null || singleSlotLectS == undefined) {
        singleSlotLectS = [];
    }
    singleSlotLectS.push({
        "dayId": dayId,
        "sub": sub,
        "faculty": faculty
    });
    CreateTimeTable.lacts[slotId] = singleSlotLectS;
    let dtx = {
        "slots": CreateTimeTable.activeSlots, "lacts": CreateTimeTable.lacts
    }
    CreateTimeTable.renderTimeTable(dtx);
}
CreateTimeTable.renderTimeTable = function (singleTimeTable) {
    let breakLbl = 'Break';
    let emptyLabel = '--';
    let html = ``;
    html += `<table id="main-table" class="marker">`;
    html += `    <tr class="marker">`;
    html += `        <th class="marker">Time/Days</th>`;
    html += `        <th class="marker">Monday</th>`;
    html += `        <th class="marker">Tuesday</th>`;
    html += `        <th class="marker">Wednesday</th>`;
    html += `        <th class="marker">Thursday</th>`;
    html += `        <th class="marker">Friday</th>`;
    html += `        <th class="marker">Saturday</th>`;
    html += `    </tr>`;
    let slots = singleTimeTable.slots;
    let lacts = singleTimeTable.lacts;
    for (let i = 0; i < slots.length; i++) {
        let slot = slots[i];
        html += `<tr class="marker">`;
        html += `<td class="marker">${slot.label}</td>`
        for (let j = 0; j < 6; j++) {
            if (slot.isBreak) {
                html += `<td class="marker">${breakLbl}</td>`
            } else {
                let slotLactsArr = utils.safeValue(lacts[slot.id], false);
                if (!slotLactsArr) {
                    html += `<td class="marker">${emptyLabel}</td>`
                } else {
                    html += `<td class="marker">`;
                    for (let k = 0; k < slotLactsArr.length; k++) {
                        lact = slotLactsArr[k];
                        let dayId = utils.safeValueInt(lact.dayId, -1);
                        if (dayId > -1 && dayId === j) {
                            html += getSingleLactHtml(lact) + "<br>";
                        }
                    }
                    html += `</td>`;
                }
            }
        }
        html += `</tr>`
    }
    html += `</table>`
    $('.create-time-table-bottom').empty().html(html);
}
var getSingleLactHtml = (lact) => {
    let html = ` `;
    html += `<span class="marker" data-lbl="${lact.sub}_${lact.faculty}">`
    html += `    <span>${lact.sub}</span> ----- `;
    html += `    <span>${lact.faculty}</span>`;
    html += `</span>`
    return html;
}

$(document).ready(function () {
    CreateTimeTable.loadSlots()
})