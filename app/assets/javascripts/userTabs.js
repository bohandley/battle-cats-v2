$(document).ready(function() {
    tabSwitcher();
});

function tabSwitcher(){
    $(".nav-pills a").on("click", function(e){
        e.preventDefault();
        var $this = $(this);

        // remove active class from tabs and viewer
        $(".nav-pills li.active").removeClass("active");
        $(".tab-pane.active").removeClass("active");

        // add active class to li and container
        var id = $this.attr("href");
        $this.parent().addClass("active");
        $(".tab-pane"+id).addClass("active");
    });
}