<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- Custom styles for this template -->

<title>Sign Up</title>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.msg == 'success'}">
			<div class="alert alert-success" role="alert">User account has
				been created</div>
		</c:when>
		<c:when test="${requestScope.msg == 'failure'}">
			<div class="alert alert-danger" role="alert">User account has
				not been created</div>
		</c:when>
	</c:choose>
	<div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

		<h3>Sign up!</h3>
		<p class="pull-right">* = required</p>
		<br> <br>
		<form:form action="registerUser.htm" commandName="user" method="post"
			class="form-horizontal">

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">First
					Name*</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="First Name"
						name="person.firstName">
					<form:errors path="person.firstName" style="color:red"
						element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Last
					Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Last Name"
						name="person.lastName">
					<form:errors path="person.lastName" style="color:red" element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Email*</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="email"
						name="email" id="email" required/>
						<p style="color:red" id="emailerror" class="hide">
						This email Id is already registered with us.</p>
					<form:errors path="email" style="color:red" element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password*
				</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" placeholder="password"
						name="password">
					<form:errors path="password" style="color:red" element="div" />
				</div>
			</div>

			<div class="form-inline">
				<label for="inputPassword3" class="col-sm-2 control-label">You
					are: </label>&nbsp <select name="role" class="form-control"
					style="width: 480px">
					<option>Buyer</option>
					<option>Seller</option>

				</select>
			</div>
			<br>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">DOB*</label>
				<div class="col-sm-10">
					<input id="dob" type="text" class="form-control" placeholder="DOB"
						name="person.dob">
					<form:errors path="person.dob" style="color:red" element="div" />
				</div>
			</div>
			<h5>Address</h5>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">
					Street*</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Street"
						name="person.address.street">
					<form:errors path="person.address.street" style="color:red"
						element="div" />

				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">City*</label>
				<div class="col-sm-10">
					<input id="city" type="text" class="form-control"
						placeholder="city" name="person.address.city">
					<form:errors path="person.address.city" style="color:red"
						element="div" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">State*</label>
				<div class="col-sm-10">
					<input id="state" type="text" class="form-control"
						placeholder="state" name="person.address.state">
					<form:errors path="person.address.state" style="color:red"
						element="div" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Zip*</label>
				<div class="col-sm-10">
					<input id="zip" type="text" class="form-control" placeholder="Zip"
						name="person.address.zip">
					<form:errors path="person.address.zip" style="color:red"
						element="div" />
				</div>
			</div>
			<div>

				<div class="col-sm-10">
					<input type="submit" value="Create Account" class="btn btn-success">
				</div>
				<br>
					<p class="pull-left">Already have an account?</p>
					 <a class="pull-left" href="login.htm"> Sign in Here </a>
				

			</div>

		</form:form>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="<c:url value="resources/JS/signup.js"/>"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	<script src="http://www.geoplugin.net/javascript.gp"
		type="text/javascript"></script>
</body>
</html>