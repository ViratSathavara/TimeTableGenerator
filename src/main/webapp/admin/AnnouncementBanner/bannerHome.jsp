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
<div class="banner-main-parent">
    <div class="banner-top">
        <div class="banner-title">Announcement Banner Management</div>
        <div class="banner-search-container">
            <div class="banner-search">
                <input class="form-control search-input me-2" id="search-input" type="search" placeholder="Search" aria-label="Search">
                <button class="banner-search-btn btn btn-outline-success"><i class="fa fa-search"
                                                                             aria-hidden="true"></i> Search
                </button>

                <button class="banner-addnew-btn btn btn-success" onclick="alert('Hello world!')"><i class="fa fa-plus"
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
    Banner.getSingleBannerhtml = function (banner) {
        let html = "";
        html += '<div class="single-banner-container">';
        html += '<div class="single-banner-top">';
        html += '<span class="single-banner-title">' + banner.title + '</span>';
        html += '<span class="single-banner-btns">';
        html += '<button class="btn btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
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