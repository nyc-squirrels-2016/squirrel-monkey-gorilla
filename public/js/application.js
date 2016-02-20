$(document).ready(function() {
  $("#yield_wrapper").on("submit", "#new_question", function(e) {
  	e.preventDefault();
  	var request = $.ajax({
  		type: "POST",
  		url: e.target.action,
  		data: $(this).serialize()
  	});
  	// @NYC_MENTORS Why did #reset not work?
  	request.done(function(response) {
  		$("#new_question").trigger("reset")
  	});
  });
  $("body").on("submit", "#new_answer_form", function(e) {
  		// console.log("yo")
  		e.preventDefault();
  		console.log("ajax is working")
  		var request = $.ajax({
  			type: "POST",
  			url: e.target.action,
  			data: $(this).serialize()
  		});
  		request.done(function(response){
  			// $("new_answer").trigger("reset")
  			$("#answer_container").html(response);
  		});
  });


});
  







  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
