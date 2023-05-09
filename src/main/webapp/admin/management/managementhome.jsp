<style>

    .mgmt-title {
        font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif;
        font-size: 1.5rem;
    }

    .mgmt-main-parent {
        width: 99%;
        height: 94vh;
    }

    main-menu-bar {
        width: 60%;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        height: 10vh;
        margin-left: 3ch;
    }

    .main-menu-btns {
        margin: 0 5px;
    }

    .main-manu-btn-active {
        background-color: #a8d6ff;
    }

</style>
<div class="mgmt-main-parent">
    <div class="mgmt-top">
        <div class="mgmt-title">Management</div>
        <div class="mgmt-search-container">
            <button id="loadTimeSlotPage" onclick="Management.loadTimeSlotPage(this)"
                    class="main-menu-btns main-manu-btn-active btn">TimeSlot
            </button>
            <button id="loadClassPage" onclick="Management.loadClassPage(this)"
                    class="main-menu-btns btn">Class
            </button>
            <button id="loadSubjectPage" onclick="Management.loadSubjectPage(this)"
                    class="main-menu-btns btn">Subject
            </button>
            <button id="loadTeacherPage" onclick="Management.loadTeacherPage(this)"
                    class="main-menu-btns btn">Teacher
            </button>

            <div class="mgmt-search"></div>
            <div class="add-btn"></div>
        </div>
    </div>
    <div id="Management-Main-Content">

    </div>
</div>
<script>
    var Management = function () {

    }

    Management.loadPage = function (path, isPost, data, _callBack) {
        if (isPost) {

        } else {
            $.get(path, data, function (resp) {
                $("#Management-Main-Content").empty().html(resp);
            })
        }
    }

    Management.loadTimeSlotPage = (elem) => {
        $('#loadTimeSlotPage').addClass('main-manu-btn-active');
        $('#loadClassPage').removeClass('main-manu-btn-active');
        $('#loadSubjectPage').removeClass('main-manu-btn-active');
        $('#loadTeacherPage').removeClass('main-manu-btn-active');
        Management.loadPage(Dashboard.contextPath+'admin/management/timeslot/timeslots.jsp',false);
    }

    Management.loadClassPage = (elem) => {
        $('#loadTimeSlotPage').removeClass('main-manu-btn-active');
        $('#loadClassPage').addClass('main-manu-btn-active');
        $('#loadSubjectPage').removeClass('main-manu-btn-active');
        $('#loadTeacherPage').removeClass('main-manu-btn-active');
        Management.loadPage(Dashboard.contextPath+'admin/management/classes/classes.jsp',false);
    }

    Management.loadSubjectPage = (elem) => {
        $('#loadTimeSlotPage').removeClass('main-manu-btn-active');
        $('#loadClassPage').removeClass('main-manu-btn-active');
        $('#loadSubjectPage').addClass('main-manu-btn-active');
        $('#loadTeacherPage').removeClass('main-manu-btn-active');
        Management.loadPage(Dashboard.contextPath+'admin/management/subject/subjects.jsp',false);
    }

    Management.loadTeacherPage = (elem) => {
        $('#loadTimeSlotPage').removeClass('main-manu-btn-active');
        $('#loadClassPage').removeClass('main-manu-btn-active');
        $('#loadSubjectPage').removeClass('main-manu-btn-active');
        $('#loadTeacherPage').addClass('main-manu-btn-active');
        Management.loadPage(Dashboard.contextPath+'admin/management/teachers/teachers.jsp',false);
    }
</script>

