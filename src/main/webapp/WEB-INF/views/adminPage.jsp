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
<link rel="icon" href="../../favicon.ico">

<title>Admin Dashboard</title>

<!-- Bootstrap core CSS -->

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="<c:url value="resources/CSS/adminDashboard.css"/>"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="<c:url value="resources/JS/adminjs.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a data-toggle="modal" data-target="#myModal" href="#">Profile</a></li>
				<li><a href="logout.htm">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="container-fluid">

		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">List of Users <span
							class="sr-only">(current)</span></a></li>
				</ul>

			</div>
			<div id="sellers"
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<h2 class="sub-header">Section title</h2>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">User profile</h4>
							</div>
							
							<div class="modal-body form-group">
							<lable for="usr">First Name:</lable> <input type="text" class="form-control" value = "${sessionScope.loggedInUser.person.firstName}" readonly/><br>
							<lable>Last Name:</lable> <input type="text" class="form-control" value = "${sessionScope.loggedInUser.person.lastName}" readonly/><br>
							<lable>Date of birth:</lable> <input type="text" class="form-control" value = "${sessionScope.loggedInUser.person.dob}" readonly/><br>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button> 
							</div>
							
						</div>
					</div>
				</div>

				<!-- From here table -->
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Status</th>
								<th>Activate/De-Activate</th>
							</tr>
						</thead>
						<tbody id="seller_table">
							<c:forEach varStatus="loopcounter" var="users"
								items="${requestScope.listOfSellers}">
								<tr class="tableRow">
									<td><c:out value='${loopcounter.count}'></c:out></td>
									<td><c:out value='${users.person.firstName}'></c:out></td>
									<td><c:out value='${users.person.firstName}'></c:out></td>
									<td class="email"><c:out value='${users.email}'></c:out></td>
									<td><c:out value='${users.role}'></c:out></td>
									<td><c:out value='${users.status}'></c:out></td>
									<c:choose>
										<c:when test="${users.status == 'deactive'}">
											<td><a class="activate" href="#"
												class="btn btn-info btn-sm"> <span
													class="glyphicon glyphicon-ok"></span> Activate
											</a> <a class="deactivate hide" href="#"
												class="btn btn-info btn-sm"> <span
													class="glyphicon glyphicon-remove"></span> De-Activate
											</a></td>
										</c:when>
										<c:when test="${users.status == 'active'}">
											<td><a class="activate hide" href="#"
												class="btn btn-info btn-sm"> <span
													class="glyphicon glyphicon-ok"></span> Activate
											</a> <a class="deactivate" href="#" class="btn btn-info btn-sm">
													<span class="glyphicon glyphicon-remove"></span>
													De-Activate
											</a></td>
										</c:when>

									</c:choose>


								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
</element>