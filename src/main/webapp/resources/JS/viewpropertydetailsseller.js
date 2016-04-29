/**
 * 
 */

$(document).ready(function(){
	

	var zip = $("#zip").val();

	$.ajax({method: 'get', url: 'http://maps.googleapis.com/maps/api/geocode/json?address='+zip,
        data: {}, dataType: 'json',
        success: function (data) {
        	
        	var lat = data.results[0].geometry.location.lat;
        	var lng = data.results[0].geometry.location.lng;
        	
        	var myCenter=new google.maps.LatLng(lat,lng);

        	function initialize()
        	{
        	var mapProp = {
        	  center:myCenter,
        	  zoom:15,
        	  mapTypeId:google.maps.MapTypeId.ROADMAP
        	  };

        	var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

        	var marker=new google.maps.Marker({
        	  position:myCenter,
        	  });

        	marker.setMap(map);
        	}

        	google.maps.event.addDomListener(window, 'load', initialize);

        	
        }
        
	
	});
	

	
});