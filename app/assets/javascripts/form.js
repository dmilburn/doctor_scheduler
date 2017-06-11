$(document).ready(function(){
	$(".hamburger").click(function(){
		$(".cross").show();
		$(this).hide();
	})

	$('.cross').click(function(){
		$(".hamburger").show();
		$(this).hide();
	})
})