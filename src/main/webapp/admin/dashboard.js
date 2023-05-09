Dashboard.loadPage = function (path, isPost, data, _callBack) {
    if (isPost) {

    } else {
        $.get(path, data, function (resp) {
            $("#dashboard-Main-Content").empty().html(resp);
        })
    }
}

Dashboard.loadBannerPage = (elem) => {
    $('#loadBannerMgmt').addClass('main-manu-btn-active');
    $('#timetableMgmt').removeClass('main-manu-btn-active');
    $('#otherMgmt').removeClass('main-manu-btn-active');
    Dashboard.loadPage(Dashboard.contextPath+'admin/AnnouncementBanner/bannerHome.jsp',false);
}

Dashboard.loadTimeTablePage = (elem) => {
    $('#loadBannerMgmt').removeClass('main-manu-btn-active');
    $('#timetableMgmt').addClass('main-manu-btn-active');
    $('#otherMgmt').removeClass('main-manu-btn-active');
    Dashboard.loadPage(Dashboard.contextPath+'admin/TimeTable/Ttablehome.jsp',false);

}
Dashboard.loadManagementPage = (elem) => {
    $('#loadBannerMgmt').removeClass('main-manu-btn-active');
    $('#timetableMgmt').removeClass('main-manu-btn-active');
    $('#otherMgmt').addClass('main-manu-btn-active');
    Dashboard.loadPage(Dashboard.contextPath+'admin/management/managementhome.jsp',false);
}


$(document).ready(function () {
    Dashboard.loadBannerPage(null);
});