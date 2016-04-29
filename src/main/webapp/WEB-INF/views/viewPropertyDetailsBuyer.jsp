<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View property</title>
<script src="<c:url value="resources/JS/viewpropertydetailsseller.js"/>"></script>
<script src="<c:url value="resources/JS/addtofav.js"/>"></script>
<link rel="stylesheet" href="<c:url value="resources/CSS/chat.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAi3U46eEAOF6HB9KRF-4v-hg-eJLNJyG4">
	
</script>

</head>
<body>
	<br>
	<br>

	<div class="alert alert-info hide" role="alert">Property added to
		favorites!!</div>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-4">
				<p class="lead">Location on map</p>
				<div id="googleMap" style="width: 385px; height: 400px;">
					<input id="zip" type="hidden" name="ziphidden"
						value="${requestScope.selectedProperty.zipcode}" />
				</div>
				<br>
				<div id="messages"
					style="width: 385px; height: 400px; overflow: auto;">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<span class="glyphicon glyphicon-comment"></span>
							&nbspInformation window
						</div>
						<div>
							<ul class="chat">
								<c:forEach varStatus="loopcounter" var="messages"
									items="${requestScope.messageList}">
									<li>
										<div class="chat-body clearfix">

											<c:choose>
												<c:when
													test="${requestScope.loggedInUser.email == messages.fromUser.email}">
													<div class="header">
														<strong class="primary-font">You:</strong>
													</div>
													<p>
														<c:out value='${messages.message}'></c:out>
													</p>
												</c:when>


											</c:choose>
											<div class="header">
												<strong class="primary-font"><c:out
														value='${messages.toUser.person.firstName}'></c:out>:</strong>
											</div>
											<p>
												<c:out value='${messages.reply}'></c:out>
											</p>



										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

					</div>




				</div>

			</div>
			<br> <br> <br>
			<div class="col-md-8">

				<div class="thumbnail">
					<img class="img-responsive"
						src="<c:url value="${requestScope.selectedProperty.photoname}"/>"
						alt="">
					<div class="caption-full">
						<h4 class="pull-right">$${requestScope.selectedProperty.price}</h4>
						<h4>${requestScope.selectedProperty.propertyType}</h4>
						<p>${requestScope.selectedProperty.noOfBedrooms}Beds|
							${requestScope.selectedProperty.noOfBath} Baths|
							${requestScope.selectedProperty.area}sft</p>

						<p>${requestScope.selectedProperty.address}</p>

					</div>
					<div class="ratings">
						<p class="pull-right">
							<a id="fav" class="btn btn-primary" role="button"><span
								class="glyphicon glyphicon-star"></span> Add to Fav!</a>
						</p>
						<p class="pull-left">
							<a class="btn btn-warning" role="button" data-toggle="modal"
								data-target="#myModal"><span
								class="glyphicon glyphicon-question-sign
"></span> Need more
								info</a>
						</p>
						<p>
							<br> <br>
						</p>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button id="cross" type="button" class="close"
										data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Request more
										Information</h4>
								</div>
								<div class="modal-body">

									<div class="alert alert-success hide" role="alert">Information
										requested</div>

									<form action="requestinfo.htm" method="post">
										<label for="exampleInputEmail1">Email address</label> <input
											type="email" class="form-control"
											value="<c:out value='${requestScope.loggedInUser.email}'></c:out>" />
										<br> <br>
										<div class="form-group">
											<label class="col-sm-2 control-label">COMMENT</label>
											<textarea id="comment" class="form-control" rows="3"></textarea>


										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button id="close" type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button id="needInfo" type="button" class="btn btn-primary">Request
										Information</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal ends here -->
				</div>

				<div class="well">
					<p class="pull-right">${fn:length(requestScope.selectedProperty.listOfReviews)}
						reviews</p>
					<h4>Reviews</h4>

					<hr>

					<c:forEach varStatus="loopcounter" var="review"
						items="${requestScope.selectedProperty.listOfReviews}">
						<div class="row">
							<div class="col-md-12">
								<strong> <c:out value='${review.user.person.firstName}'></c:out>
									&nbsp <c:out value='${review.user.person.lastName}'></c:out>:
								</strong>
								<p>
									<c:out value='${review.review}'></c:out>
								</p>
							</div>
						</div>
						<hr>
					</c:forEach>
					<h4>Leave a Review:</h4>
					<form role="form" action="addreview.htm" method="post">
						<div class="form-group">
							<textarea name="review" class="form-control" rows="3"></textarea>
						</div>
						<input type="hidden" name="id" id="id"
							value="${requestScope.selectedProperty.id}" />
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>

			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container"></div>
</body>
</html>