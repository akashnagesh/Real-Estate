<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View properties</title>
<!-- Bootstrap core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script src="<c:url value="resources/JS/viewallproperties.js"/>"></script>
<!-- Custom styles for this template -->

<link href="<c:url value="resources/CSS/carousel.css"/>"
	rel="stylesheet">
</head>
<body>

	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Web Tools</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Menu<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login.htm">Log In</a></li>
								<li><a href="signup.htm">Sign Up</a></li>


							</ul></li>

					</ul>

				</div>
			</div>
			</nav>

		</div>
	</div>
	<!-- End of navigator -->

	<div class="container">
		<br> <br> <br> <br>
		<h3>Properties in ${requestScope.location}</h3>




		<hr>
		<c:choose>
			<c:when test="${empty requestScope.listOfProperties}">
				<div class="alert alert-danger" role="alert">Sorry! No
					properties in the selected area!</div>
			</c:when>
		</c:choose>
		<div class="row maindiv">
			<c:forEach varStatus="loopcounter" var="property"
				items="${requestScope.listOfProperties}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<c:url value="${property.photoname}"/>" style="min-height:50px;height:200px;" alt="...">
						<div class="caption">
							<h4>
								<em> <c:out value='${loopcounter.count}'></c:out> . <c:out
										value='${property.propertyType}'></c:out></em>
							</h4>
							<p>
								Property for: <strong><c:out
										value='${property.propertyFor}'></c:out></strong>
							</p>
							<p>
								<c:out value='${property.noOfBedrooms}'></c:out>
								Beds
							</p>
							<p>
								<c:out value='${property.noOfBath}'></c:out>
								Total Baths
							</p>
							<p>
								<em><c:out value='${property.area}'></c:out> sft<em>
							</p>
							<p>
								<em><b>$<c:out value='${property.price}'></c:out></b></em>
							</p>
							<p>
								<em><c:out value='${property.address}'></c:out></em>
							</p>
							<p>
								<a href="signinbuyer.htm" class="btn btn-primary" role="button">View
									Property</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="http://www.geoplugin.net/javascript.gp"
		type="text/javascript"></script>

</body>
</html>