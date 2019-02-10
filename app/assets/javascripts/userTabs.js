$(document).ready(function() {
    tabSwitcher();
});

function tabSwitcher(){
    $(".nav-tabs a").on("click", function(e){
        e.preventDefault();
        let $this = $(this);
        
        // remove active class from tabs and viewer
        $(".nav-tabs li.active").removeClass("active");
        $(".tab-pane.active").removeClass("active");

        // add active class to li and container
        let id = $this.attr("href");
        $this.parent().addClass("active");
        $(".tab-pane"+id).addClass("active");
    });
}