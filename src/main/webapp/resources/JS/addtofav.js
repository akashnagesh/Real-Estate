/**
 * 
 */

$(document).ready(function() {

	var id = $("#id").val();
	
	
	
	$("#needInfo").click(function() {
		
		var comment = $('textarea#comment').val();

		$.ajax({
			method : 'post',
			url : 'favproperties.htm',
			data : {
				propertyId : id,
				comment : comment,
			},
			success : function(data) {

				$(".alert-success").removeClass("hide");
				
				var chat = "<li><div class='chat-body clearfix'><div class='header'><strong class='primary-font'>You:</strong></div><p>"+comment+"</p></div></li>" 
				$(".chat").append(chat);
			}
		});

	});

	

	$("#fav").click(function(e) {

		$.ajax({
			method : 'get',
			url : 'addtofav.htm',
			data : {
				propertyId : id,
			},
			dataType : 'json',
			success : function(data) {

				$("#fav").addClass("disabled");
				$(".alert").removeClass("hide");

			}
		});

	});
	
	$("#close").click(function(){
		reset();
	});
	
	$("#cross").click(function(){
		reset();
	});
	
	
	var reset = function()
	{
		$(".alert-success").addClass("hide");
		$('textarea#comment').val("");
	};

});