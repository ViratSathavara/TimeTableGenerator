let singleTimeTable = {
    "slots": [
        {"id": 0, "label": "10:00 - 11:00"},
        {"id": 1, "label": "10:00 - 11:00"},
        {"id": 2, "label": "10:00 - 11:00", "isBreak": true},
        {"id": 3, "label": "10:00 - 11:00"},
        {"id": 4, "label": "10:00 - 11:00"},
        {"id": 5, "label": "10:00 - 11:00", "isBreak": true},
        {"id": 6, "label": "10:00 - 11:00"},
        {"id": 7, "label": "10:00 - 11:00"}
    ],
    "lacts": {
        "0": [
            {"dayId": 0, "sub": "Java_batch1", "faculty": "AB", "dataid": "1234213"},
            {"dayId": 1, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 2, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 3, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 4, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 5, "sub": "Java_batch1", "faculty": "AB"}
        ],
        "2": [
            {"dayId": 0, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 1, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 2, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 3, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 4, "sub": "Java_batch1", "faculty": "AB"},
            {"dayId": 5, "sub": "Java_batch1", "faculty": "AB"}
        ]
    }
}


function createTable(singleTimeTable) {
    let breakLbl = '';
    let emptyLabel = '--';
    let html = ``;
    html += `<table>`;
    html += `    <tr>`;
    html += `        <th>Time/Days</th>`;
    html += `        <th>Monday</th>`;
    html += `        <th>Tuesday</th>`;
    html += `        <th>Wednesday</th>`;
    html += `        <th>Thursday</th>`;
    html += `        <th>Friday</th>`;
    html += `        <th>Saturday</th>`;
    html += `    </tr>`;
    let slots = singleTimeTable.slots;
    let lacts = singleTimeTable.lacts;
    for (let i = 0; i < slots.length; i++) {
        let slot = slots[i];
        html += `<tr>`;
        html += `<td>${slot.label}</td>`
        for (let j = 0; j < 6; j++) {
            if (slot.isBreak) {
                html += `<td>${breakLbl}</td>`
            } else {
                let slotLactsArr = utils.safeValue(lacts[i], false);
                if (!slotLactsArr) {
                    html += `<td>${emptyLabel}</td>`
                } else {
                    html += `<td>`;
                    for (let k = 0; k < slotLactsArr.length; i++) {
                        lact = slotLactsArr[k];
                        let dayId = utils.safeValueInt(lact.dayId, -1);
                        if (dayId > -1 && dayId === j) {
                            html += getSingleLactHtml(lact);
                        }
                    }
                    html += `</td>`;
                }
            }
        }
        html += `</tr>`
    }
    html += `</table>`
    return html;
}

var getSingleLactHtml = (lact) => {
    let html = ``;
    html += `<span data-lbl="${lact.sub}_${lact.faculty}">`
    html += `    <span>${lact.sub}</span>`;
    html += `    <span>${lact.faculty}</span>`;
    html += `</span>`
    return html;
}