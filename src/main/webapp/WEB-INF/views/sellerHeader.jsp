<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seller Home Page</title>



<spring:url value="/resources/CSS/starter-template.css" var="fontCss" />
<link href="${fontCss}" rel="stylesheet">

<!--  
<link href="<c:url value="resources/CSS/starter-template.css"/>"
	rel="stylesheet">-->
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<ul class="nav navbar-nav navbar-right">

			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">${sessionScope.loggedInUser.person.firstName}<span
					class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logout.htm">Logout</a></li>

				</ul></li>

		</ul>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="addProperty.htm">Add Properties</a></li>
				<li><a href="viewSellerProperties.htm">View My Properties</a></li>
				<li><a href="sellerMessages.htm">Messages<span class="badge"><c:out value='${sessionScope.unReadMsgs}'></c:out></span></a></li>
			</ul>


		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</body>
</html>