/* toggle content/left sidebar markup nodes for responsiveness
 - or leave blank to disable structure and to not fall back . */
(function ($) {
    if ($(window).width() < 750) {
        $("#serendipityLeftSideBar").before($("#content"));
    }
    else {
        $("#content").before($("#serendipityLeftSideBar"));
    }
    $(window).resize(function() {
        if ($(window).width() < 750) {
            $("#serendipityLeftSideBar").before($("#content"));
            $("#serendipityRightSideBar").before($("#serendipityLeftSideBar"));
        }
        else {
            $("#content").before($("#serendipityLeftSideBar"));
        }
    });
})(jQuery);
