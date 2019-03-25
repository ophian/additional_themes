/* toggle content/left sidebar markup nodes for responsiveness */
(function ($) {
    if ($(window).width() < 860) {
        $("#serendipityRightSideBar").before($("#serendipityLeftSideBar"));
        $("#serendipityLeftSideBar").before($("#content"));
        /*console.log('1');*/
    }/* else keep order as delivered */
    $(window).resize(function() {
        if ($(window).width() < 860) {
            $("#serendipityRightSideBar").before($("#serendipityLeftSideBar"));
            $("#serendipityLeftSideBar").before($("#content"));
            /*console.log('2');*/
        }
        else {
            $("#content").before($("#serendipityRightSideBar"));
            $("#serendipityRightSideBar").before($("#serendipityLeftSideBar"));
            /*console.log('2-else');*/
        }
    });
})(jQuery);
