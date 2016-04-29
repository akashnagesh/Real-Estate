<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View property</title>
<script src="<c:url value="resources/JS/viewpropertydetailsseller.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAi3U46eEAOF6HB9KRF-4v-hg-eJLNJyG4">
</script>

</head>
<body>
	

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-4">
				<p class="lead">Location on map</p>
				<div id="googleMap" style="width:385px;height:400px;">
				<input id="zip" type="hidden" name="ziphidden" value="${requestScope.selectedProperty.zipcode}"/>
				</div>
				
			</div>

			<div class="col-md-8">

				<div class="thumbnail">
					<img class="img-responsive" src="<c:url value="${requestScope.selectedProperty.photoname}"/>" 
						alt="">
					<div class="caption-full">
						<h4 class="pull-right">$${requestScope.selectedProperty.price}</h4>
						<h4>
							${requestScope.selectedProperty.propertyType}
						</h4>
						<p>
							${requestScope.selectedProperty.noOfBedrooms} Beds| ${requestScope.selectedProperty.noOfBath} Baths| 
							${requestScope.selectedProperty.area}sft
						</p>
						
						<p>${requestScope.selectedProperty.address}</p>
						<p>
							Want to make these reviews work? Check out <strong><a
								href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this
									building a review system tutorial</a> </strong>over at maxoffsky.com!
						</p>
					</div>
					
				</div>

				<div class="well">


					<hr>
					<c:forEach varStatus="loopcounter" var="review"
						items="${requestScope.selectedProperty.listOfReviews}">
						<div class="row">
							<div class="col-md-12">
							<strong>
								<c:out value='${review.user.person.firstName}'></c:out> &nbsp
								<c:out value='${review.user.person.lastName}'></c:out>:</strong>
								<p><c:out value='${review.review}'></c:out></p>
							</div>
						</div>

						<hr>

					</c:forEach>

				</div>

			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container">

		

	</div>
	<!-- /.container -->
</body>
</html>