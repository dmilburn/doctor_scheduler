$(document).ready(function(){
	$(".hamburger").click(function(){
		console.log("hello")
		$("#navbar").slideToggle("slow", function(){
			$(".cross").show();
			$(".hamburger").hide();
		})
	})

	$('.cross').click(function(){
		$("#navbar").slideToggle("slow", function(){
			$(".hamburger").show();
			$(".cross").hide();
		})

	})
})