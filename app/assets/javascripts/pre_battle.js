$(document).ready(function() {
	radioButtonClickListener();
})

var radioButtonClickListener = function() {
	$(".battle-new-pet-name").children().on("click", function() {
		$(".btn-lg").removeClass("disabled")
	})
}
