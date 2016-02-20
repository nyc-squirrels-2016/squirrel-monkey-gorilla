$(document).ready(function() {
  $("#yield_wrapper").on ("submit", "#new_question", function(e) {
  	e.preventDefault();
  	console.log("Yo")
  	var request = $.ajax({
  		type: "POST",
  		url: e.target.action,
  		data: $(this).serialize()
  	});
  	request.done(function(response) {
  		$("#new_question").trigger("reset")
  	});
  });

});
  







  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
