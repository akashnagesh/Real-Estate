/**
 * 
 */

$(document).ready(function(){
	
	
	
	$(".replyButton").click(function(){
		
		$(this).parents(".replyBox").addClass("hide");
		var msgId = $(this).siblings(".id").val();
		var actualMsg = $(this).siblings(".msgdiv").children("textarea.actualMsg").val();
		var reply = "<h5><strong> You: </strong></h5><p>"+actualMsg+"</p>";

		$(this).parent().parent(".cell").append(reply);
		$.ajax({
			method : 'post',
			url : 'reply.htm',
			data : {
				msgId : msgId,
				actualMsg : actualMsg,
			},
			success : function(data) {

				$(this).parents(".replyBox").addClass("hide");
				
				
			}
		});
		
	});
	
});