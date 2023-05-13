<style>
    .banner-title {
        font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif;
        font-size: 1.5rem;
        padding-top: 50px;
    }

    .banner-main-parent {
        width: 99%;
        height: 94vh;
    }

    .banner-search {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        margin-top: 10px;
    }

    .search-input {
        width: 60%;
        border-right: none;
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }


    .clear {
        clear: both;
    }

    .banner-search-btn {
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-right: 1px solid #ccc;
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }

    .banner-addnew-btn {
        margin-left: 30px;
        width: 10%;
    }

    .all-Announcement-Banner {
        align-items: flex-start;
        justify-content: flex-start;
        display: flex;
        flex-direction: column;
        margin-top: 30px;
    }

    .single-banner-container {
        width: 70%;
        display: flex;
        margin: 5px 0;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 10px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        background-color: #dbffe6;
    }

    .single-banner-title {
        font-size: 1.2rem;
    }

    .single-banner-top, .single-banner-bottom {
        width: 100%
    }

    .single-banner-top {
        display: flex;
        align-items: center;
    }

    .single-banner-bottom {
        display: flex;
        flex-direction: column;
    }

    .single-banner-btns {
        margin-left: auto;
    }

    .single-banner-timestamp {
        font-size: 1rem;
        font-style: italic;
    }

</style>


<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<div class="banner-main-parent">
    <div class="banner-top">
        <div class="banner-title">Announcement Banner Management</div>
        <div class="banner-search-container">
            <div class="banner-search">
                <input class="form-control search-input me-2" id="search-input" type="search" placeholder="Search" aria-label="Search">
                <button class="banner-search-btn btn btn-outline-success"><i class="fa fa-search"
                                                                             aria-hidden="true"></i> Search
                </button>

                <button class="banner-addnew-btn btn btn-success" onclick="Banner.addSlotNewSlot" ><i class="fa fa-plus"
                                                                                                     aria-hidden="true"></i>
                    Add New
                </button>
            </div>

        </div>
    </div>
    <div id="all-banners" class="all-Announcement-Banner">

    </div>
</div>




<script>
    var Banner = function () {

    }

    Banner.loadData = function () {
        let url = Dashboard.restURL + `general/getBannerData?ispublished=1`;
        $.get(url, {}, function (resp) {
            let data = JSON.parse(resp);
            let main = '';
            for (const banner of data) {
                main += Banner.getSingleBannerhtml(banner)
            }
            $('#all-banners').html(main);
        });

    };




    Banner.renderTBannerItemsList = function (dataArr) {
        let html = '';
        for (let i = 0; i < dataArr.length; i++) {
            let singleBannerData = dataArr[i]
            html += Banner.getSingleBannerhtml(singleBannerData, i);
        }
        $('#timeslot-bottom').empty().html(html);
    }

    Banner.addHeading = '';
    Banner.addText = '';
    Banner.addSlotNewSlot = function () {
        if (Banner.addHeading == '') {
            alert("Please Add Heading");
            return;
        }
        if (Banner.addText == '') {
            alert("Please Add Text");
            return;
        }
        let newSlot = {
            "id": Banner.all-Banner.length + 1,
            "title": Banner.addHeading,
            "description": Banner.addText
        }
        Banner.all-Banner.push(newSlot);
        Banner.addHeading = '';
        Banner.addText = '';
        $('#txtStartTime').val('');
        $('#txtEndTime').val('');
        $('#slottype-select').val('Lecture');
        Banner.renderTBannerItemsList(Banner.mainDateArr);
    }



    Banner.openBannerEditDialog = function (elem) {
        let allData = JSON.parse(atob($(elem).attr('data-allData')));
        let idx = $(elem).attr('data-arr-idx');
        let html = '';
        html += '<div class="single-banner-edit-container">';
        html += '    <div class="heading-container">';
        html += '        <span>Heading</span>';
        html += '        <input type="text">';
        html += '    </div>';
        html += '    <div class="summernote-container">';
        html += '        <div class="ui input left icon">';
        html += '            <input type="text" id="summernote-text-box" placeholder="Add Text">';
        html += '        </div>';
        html += '    </div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Edit Banner",
            message: html,
            onshown: function (dialogref) {
                $('#summernote-text-box').summernote({
                    placeholder: 'Hello stand alone ui',
                    tabsize: 5,
                    height: 120,
                    toolbar: [
                        ['style', ['style']],
                        ['font', ['bold', 'underline', 'clear']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['table', ['table']],
                        ['insert', ['link', 'picture', 'video']],
                        ['view', ['fullscreen', 'codeview', 'help']]
                    ]
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
                    if (Banner.currentlySelectedStartTime == '') {
                        alert("Please Select Start Time");
                        return;
                    }
                    if (Banner.currentlySelectedEndTime == '') {
                        alert("Please Select End Time");
                        return;
                    }
                    let newSlot = {
                        "id": allData.id,
                        "startTime": Banner.currentlySelectedStartTime,
                        "endTime": Banner.currentlySelectedEndTime,
                        "type": $('#slottype-select-edit').val()
                    }
                    Banner.mainDateArr[idx] = newSlot;
                    Banner.renderTimeSlotsList(Banner.mainDateArr);
                    dialogRef.close();
                }
            }]
        });
    }
    Banner.getSingleBannerhtml = function (banner,idx) {
        let html = "";
        html += '<div class="single-banner-container">';
        html += '<div class="single-banner-top">';
        html += '<span class="single-banner-title">' + banner.title + '</span>';
        html += '<span class="single-banner-btns">';
        html += '<button class="btn btn-info" data-allData="' + btoa(JSON.stringify(banner)) + '" data-arr-idx="' + idx + '" onclick="Banner.openBannerEditDialog(this)"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
        html += '<button class="btn btn-danger" onclick="Banner.deleteBanner('+banner.id+')"><i class="fa fa-trash" aria-hidden="true"></i></button>';
        html += '</span>';
        html += '</div>';
        html += '<div class="single-banner-bottom">';
        html += '<span class="single-banner-desc">' + banner.description + '</span>';
        html += '<span class="single-banner-timestamp">' + banner.createdon + '</span>';
        html += '</div>';
        html += '</div>';
        return html;
    }

    Banner.deleteBanner = function (id) {
        let url = Dashboard.restURL + `general/deleteBanner`;
        $.post(url, {'id':id}, function (resp) {
            Banner.loadData();
        });
    }
    $(document).ready(function () {
        Banner.loadData();
    });

</script>