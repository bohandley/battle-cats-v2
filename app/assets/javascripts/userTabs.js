$(document).ready(function() {
    tabSwitcher();
});

function tabSwitcher(){
    $(".nav-pills a").on("click", function(e){
        e.preventDefault();

        $(".nav-pills li.active").removeClass("active");
        
        var $this   = $(this),
            id      = $this.attr("href");

        $this.parent().addClass("active");
    });
}