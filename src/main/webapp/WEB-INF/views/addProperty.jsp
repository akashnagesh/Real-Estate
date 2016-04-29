<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add property</title>
<script>
	$(function() {
		$("#date").datepicker();
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.result == 'success'}">
			<div class="alert alert-success" role="alert">Property has been
				posted</div>
		</c:when>
		<c:when test="${requestScope.msg == 'failure'}">
			<div class="alert alert-danger" role="alert">Oops!! Unable to
				add property!</div>
		</c:when>
	</c:choose>
	<hr />
	<div class="mainbox col-md-7 col-md-offset-3 col-sm-8 col-sm-offset-2">

		<h3>Post a new property</h3>
		<br> <br>
		<form:form action="postProperty.htm" commandName="sellerProperty"
			method="post" class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
				<label class="col-sm-2 control-label">Property Type </label>
				<div class="col-sm-6">
					<select name="property.propertyType" class="form-control"
						style="width: 480px">
						<option>Condo</option>
						<option>House</option>
						<option>Apartment</option>
					</select>
				</div>

			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Property
					for </label>
				<div class="col-sm-6">
					<select name="property.propertyFor" class="form-control"
						style="width: 480px">
						<option>For Sale</option>
						<option>Rent</option>
					</select>
				</div>

			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Bedrooms</label>
				<div class="col-sm-9">
					<input type="number" min="1" max="5" class="form-control"
						placeholder="Bedrooms" name="property.noOfBedrooms">
					<form:errors path="property.noOfBedrooms" style="color:red"
						element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Baths</label>
				<div class="col-sm-9">
					<input type="number" min="1" max="5" class="form-control"
						placeholder="Bedrooms" name="property.noOfBath">
					<form:errors path="property.noOfBath" style="color:red"
						element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Area
					in sft</label>
				<div class="col-sm-9">
					<input type="number" min="800" max="5000" class="form-control"
						placeholder="Area in sft" name="property.area">
					<form:errors path="property.area" style="color:red" element="div" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Price</label>
				<div class="col-sm-9">
					<input type="number" min="1" class="form-control"
						placeholder="Price" name="property.price">
					<form:errors path="property.price" style="color:red" element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Available
					from</label>
				<div class="col-sm-9">
					<input id="date" type="text" class="form-control"
						placeholder="Available from" name="availableFrom">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Address</label>
				<div class="col-sm-9">
					<textarea name="property.address" placeholder="Address"
						class="form-control"></textarea>
					<form:errors path="property.address" style="color:red"
						element="div" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Zip</label>
				<div class="col-sm-9">
					<input type="number" min="1" class="form-control"
						placeholder="Zip Code" name="property.zipcode">
					<form:errors path="property.zipcode" style="color:red"
						element="div" />
				</div>
			</div>

			<div class="form-group">
				<label  class="col-sm-2 control-label">Upload photo</label>
				<div class="col-sm-9">
					<input type="file" class="form-control"
						placeholder="An image here" name="property.photo">
				</div>
			</div>

			<br>
			<div class="col-sm-10">
				<input type="submit" value="Post Property" class="btn btn-success">
			</div>


		</form:form>
	</div>

</body>
</html>