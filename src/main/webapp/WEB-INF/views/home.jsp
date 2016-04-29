<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">


<title>Real Estate</title>



<!-- Bootstrap core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

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
					<c:choose>
						<c:when test="${not empty sessionScope.loggedInUser}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="favproperties.htm">Favorite Properties</a></li>

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">${sessionScope.loggedInUser.person.firstName}<span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="logout.htm">Logout</a></li>
									</ul></li>



							</ul>
						</c:when>

						<c:when test="${empty sessionScope.loggedInUser}">
							<ul class="nav navbar-nav navbar-right">

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Menu<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="login.htm">Sign In</a></li>
										<li><a href="signup.htm">Sign Up</a></li>


									</ul></li>
							</ul>
						</c:when>
					</c:choose>




				</div>
			</div>
			</nav>

		</div>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide"
					src="resources/Images/homepage/perfecthome.jpg" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Let's find your perfect home</h1>

						<p>
						<form action="viewallproperties.htm" method="get"
							class="form-inline">
							<input id="carousel_input" type="text" class="form-control"
								placeholder="Search for..." name="location"> <input
								type="submit" value="Go!" class="btn btn-default" />

						</form>

						<!-- /input-group -->

						<!-- /.col-lg-6 -->
						</p>
					</div>
				</div>
			</div>

			<div class="item">
				<img class="second-slide"
					src="resources/Images/homepage/interiors.jpg" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>You can sign up here to sell/rent properties.</h1>
						<p></p>
						<p>
							<a class="btn btn-lg btn-primary" href="signup.htm" role="button">Sign
								Up</a>
						</p>
					</div>
				</div>
			</div>


		</div>


		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<img class="img-circle" src="resources/Images/homepage/buy.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2>Buy Property</h2>
				<p>Buying a bigger home doesn’t necessarily mean spending more
					money!!</p>

			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/Images/homepage/rent.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2>Rent Property</h2>
				<br>
				<p>Service You Deserve. People You Trust.</p>

			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/Images/homepage/sell.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2>Sell Property</h2>
				<br>
				<p>The Best in the Business.</p>

			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->



		<hr>

		<!-- FOOTER -->
		<footer>
		<p class="pull-right">
			<a href="#">Back to top</a>
		</p>
		<p>&copy; 2016 WebProject
		</footer>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="<c:url value="resources/JS/homejs.js"/>"></script>
	<script src="http://www.geoplugin.net/javascript.gp"
		type="text/javascript"></script>

</body>
</html>