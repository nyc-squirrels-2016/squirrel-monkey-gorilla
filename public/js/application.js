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
  	request.fail(function(response) {
  		$("#error_box").text(response.responseText)
  	});
  });
  $("body").on("submit", "#new_answer_form", function(e) {
  		// console.log("yo")
  		e.preventDefault();
  		//console.log("ajax is working")
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
  $(".container").hide()
  $("body").on("submit", "#graph", function(e) {
    e.preventDefault();
    var request = $.ajax ({
      type: "POST",
      url: e.target.action,
      dataType: 'json'
    });
    request.done(function(response){
      $("#main_stats").append(response);
      $(".container").toggle();
      $(function () {
        $('.container').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Question'
            },
            xAxis: {
                categories: response.x
            },
            yAxis: {
                title: {
                    text: 'Responded'
                }
            },
            series: [{
                data: response.y
            }]
        });// closes highcharts inner
      });  //closes highcharts outer
    });
  });


});



