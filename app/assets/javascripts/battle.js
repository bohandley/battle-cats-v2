$(document).ready(function(){
  console.log("hello")
  $("#redirect-to-profile").hide();
  fightButtonListener();
  movePetPicture();
});

var movePetPicture = function() {
  $(".pet-show-card").on("click","#smash-button", function(){
    $("#right-pet").animate({top: "30px"}, 40);
    $("#right-pet").animate({top: "-30px"}, 40);
    $("#right-pet").animate({top: "0px"}, 40);
    $("#left-pet").animate({bottom: "30px"}, 40);
    $("#left-pet").animate({bottom: "-30px"}, 40);
    $("#left-pet").animate({bottom: "0px"}, 40);
  })
}
var score;
var clicks = 0;
var fightButtonListener = function() {
$("#fight-button").one("click", function(){
   var $divNum = $(this).closest("div").attr("class")
   var sendPromise = function(score) {
     $.ajax({
       method: "put",
       url: "/battles/" + $divNum,
       data: {score: clicks}
     });
   };

   var hideSmashButton = function() {
     $("#smash-button").hide();
     $("#redirect-to-profile").show();
     sendPromise(clicks);


   };

   setTimeout(hideSmashButton, 4000);
   replaceFightButton(); 
   clickAccumulator();  
   });
}

var clickAccumulator = function() {
$("#smash-button").on("click", function(){
    clicks += 1;
    return clicks;
});
};

var replaceFightButton = function() {
$("#fight-button").replaceWith("<button id='smash-button' class='btn'>Click Me!</button>");
};
