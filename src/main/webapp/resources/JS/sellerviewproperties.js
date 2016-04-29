/**
 * 
 */

$(document).ready(function(){
	
	var count = 0;
	$("#more").click(function(){
		
		count = count+6;
		$.ajax({method: 'get', url: 'viewSellerPropertiesajx.htm',
            data: {count: count}, dataType: 'json',
            success: function (data) {



                $.each(data.jsonData, function (i, item) {
                	
                	var contentFromServer= "<div class='col-sm-6 col-md-4'>" +
                	"<div class='thumbnail'>" +
                	"<img src="+item.photoname+" style='min-height:50px;height:200px;' alt=''>" +
                	"<div class='caption'>" +
                	"<h4><em>"+(++count)+"."+item.propertyType+"</em></h4>" +
                	"<p>Property for: "+"<strong><i>"+item.propertyFor+"</i></strong>"+"<strong></strong></p>" +
                	"<p><i>"+item.noOfBedrooms+"	Beds</i></p>" +
                			"<p><i>"+item.noOfBath+" Total Baths</i></p>" +
                	"<p><i>"+item.area+"</i></p>" +
                	"<p><i>"+item.price+"</i></p>" +
                	"<p><i>"+item.address+"</i></p>" +
                	"<p>" +
                	"<a href='viewpropertydetails.htm?id="+item.id+"' class='btn btn-primary' role='button'>ViewProperty</a>" +
                	" <a href='#' class='btn btn-default delete' role='button'>Delete</a>" +
                	"</p>" +
                	"</div>" +
                	"</div>" +
                	"</div>";
                	
                	
                	
                	

      /*              var content = "<tr><td height='30'>" + item.salesOrderId + "</td>\n\
                <td height='30'>" + item.revisionNumber + "</td>\n\
                <td height='30'>"+item.dueDate+"</td>\n\
                <td height='30'>"+item.shipDate+"</td>\n\
                <td height='30'>"+item.orderDate+"</td>\n\
                <td height='30'><button style='width:100%' type='button' class='add'>Save</button></td>\n\
                <td height='30'><button style='width:100%' type='button' class='delete'>Delete</button></td></tr>";*/
                    $(".maindiv").append(contentFromServer);

                });

             

            }});
	});
	
	$("body").on('click','.delete',function(){
		alert("clicked");
		
		var value = $(this).parent().prev().children("em").html();
		var maindiv = $(this).parents(".col-md-4").addClass("hide");
		
		$.ajax({method: 'get', url: 'viewSellerPropertiesajx.htm',
            data: {count: count}, dataType: 'json',
            success: function (data) {
            	
            	
            }
            
		
		});
		
		
	});
		

	
});