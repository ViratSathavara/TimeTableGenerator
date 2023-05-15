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

    .edit-banner-dialog .modal-dialog {
        width: 47%;
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


<div class="banner-main-parent">
    <div class="banner-top">
        <div class="banner-title">Announcement Banner Management</div>
        <div class="banner-search-container">
            <div class="banner-search">
                <input class="form-control search-input me-2" id="search-input" type="search" placeholder="Search"
                       aria-label="Search">
                <button class="banner-search-btn btn btn-outline-success" onclick="Banner.search()"><i class="fa fa-search"
                                                                             aria-hidden="true"></i> Search
                </button>

                <button class="banner-addnew-btn btn btn-success" onclick="Banner.openBannerAddNewDialog()"><i
                        class="fa fa-plus"
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
    Banner.mainDataArr = [];
    Banner.loadData = function () {
        let url = Dashboard.restURL + `general/getBannerData?ispublished=1`;
        $.get(url, {}, function (resp) {
            let data = JSON.parse(resp);
            Banner.mainDataArr = data;
            Banner.renderData(data);
        });

    };
    Banner.renderData = function (dataArr) {
        let main = '';
        for (let i = 0; i < dataArr.length; i++) {
            let singleBannerData = dataArr[i]
            main += Banner.getSingleBannerhtml(singleBannerData, i)
        }
        $('#all-banners').html(main);
    }


    Banner.addHeading = '';
    Banner.addText = '';
    Banner.search = function () {
        let term = $('#search-input').val()
        if (term == '' || term == null || term == undefined) {
            Banner.renderData(Banner.mainDataArr);
            return;
        }
        let resultArr = Banner.mainDataArr.filter((elem, idx) => {
            return elem.title.includes(term) || elem.description.includes(term)
        });
        Banner.renderData(resultArr);
    }
    Banner.openBannerAddNewDialog = function () {

        let html = '';
        html += '<div class="single-banner-edit-container">';
        html += '    <div class="heading-container" style="margin-bottom: 1ch">';
        html += '        <span>Title</span>';
        html += '        <input type="text" class="form-control" id="txtNewBannerTitle">';
        html += '    </div>';
        html += '    <div class="summernote-container">';
        html += '        <div class="ui input left icon">';
        html += '            <input type="text" id="summernote-text-box-new" placeholder="Add Text">';
        html += '        </div>';
        html += '    </div>';
        html += '</div>';
        BootstrapDialog.show({
            title: "Add New Banner",
            message: html,
            closeByBackdrop: false,
            closeByKeyboard: false,
            cssClass: "edit-banner-dialog",
            onshown: function (dialogref) {
                $('#summernote-text-box-new').summernote({
                    placeholder: 'Description',
                    tabsize: 5,
                    height: 220,
                    width: 771,
                    maxHeight: 420,
                    toolbar: [
                        ['font', ['bold', 'underline', 'clear']],
                        ['color', ['color']],
                        ['insert', ['link']],
                        ['para', ['ul', 'ol', 'paragraph']]
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
                    dialogRef.close();
                }
            }]
        });
    }


    Banner.openBannerEditDialog = function (elem) {
        let allData = JSON.parse(atob($(elem).attr('data-allData')));
        let idx = $(elem).attr('data-arr-idx');
        let html = '';
        html += '<div class="single-banner-edit-container">';
        html += '    <div class="heading-container" style="margin-bottom: 1ch">';
        html += '        <span>Title</span>';
        html += '        <input type="text" class="form-control" id="txtEditBannerTitle" value="' + allData.title + '">';
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
            closeByBackdrop: false,
            closeByKeyboard: false,
            cssClass: "edit-banner-dialog",
            onshown: function (dialogref) {
                $('#summernote-text-box').summernote({
                    placeholder: 'Description',
                    tabsize: 5,
                    height: 220,
                    maxHeight: 420,
                    toolbar: [
                        ['font', ['bold', 'underline', 'clear']],
                        ['color', ['color']],
                        ['insert', ['link']],
                        ['para', ['ul', 'ol', 'paragraph']]
                    ]
                });
                $('#summernote-text-box').summernote('code', allData.description);
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
                    let newBannerObj = allData
                    newBannerObj["title"] = $('#txtEditBannerTitle').val();
                    newBannerObj["description"] = $('#summernote-text-box').summernote('code');
                    Banner.mainDataArr[idx] = newBannerObj;
                    Banner.renderData(Banner.mainDataArr)
                    dialogRef.close();
                }
            }]
        });
    }
    Banner.getSingleBannerhtml = function (banner, idx) {
        let html = "";
        html += '<div class="single-banner-container">';
        html += '<div class="single-banner-top">';
        html += '<span class="single-banner-title">' + banner.title + '</span>';
        html += '<span class="single-banner-btns">';
        html += '<button class="btn btn-info" style="margin: 0 2px" data-allData="' + btoa(JSON.stringify(banner)) + '" data-arr-idx="' + idx + '" onclick="Banner.openBannerEditDialog(this)"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
        html += '<button class="btn btn-danger" style="margin: 0 2px" onclick="Banner.deleteBanner(' + banner.id + ')"><i class="fa fa-trash" aria-hidden="true"></i></button>';
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
        $.post(url, {'id': id}, function (resp) {
            Banner.loadData();
        });
    }
    $(document).ready(function () {
        Banner.loadData();
    });

</script>