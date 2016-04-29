/**
 * 
 */

$(document).ready(function() {

	$("#dob").datepicker();

	var city = geoplugin_city();
	var country = geoplugin_regionName();
	$("#city").val(city);
	$("#state").val(country);

	$("#email").keyup(function() {

		var data1 = $("#email").val();
		var comp = "exists";
		$.ajax({
			method : 'post',
			url : 'checkemail.htm',
			dataType: 'json',
			data : {
				email : data1,
			},
			success : function(data) {

				if(data.status == "exists")
					{
					$("#emailerror").removeClass("hide");
					}
				else{
					$("#emailerror").addClass("hide");
				}
					
				
			}
		});

	});

});