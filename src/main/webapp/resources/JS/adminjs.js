/**
 * 
 */

$(document).ready(function() {

	$(".activate").click(function(data) {

		$(this).addClass("hide");
		var sibling = $(this).next();
		sibling.removeClass("hide");

		var email = $(this).parent().prev().prev().prev().html();

		$.ajax({
			method : 'get',
			url : 'changestatus.htm',
			data : {
				emailId : email,
				"status" : "active"
			},
			dataType : 'json'
		});
	});
	
	$(".deactivate").click(function(data) {

		$(this).addClass("hide");
		var sibling = $(this).prev();
		sibling.removeClass("hide");

		var email = $(this).parent().prev().prev().prev().html();

		$.ajax({
			method : 'get',
			url : 'changestatus.htm',
			data : {
				emailId : email , "status" : "deactive"
			},
			dataType : 'json'
		});
	}

	);
	
	

});