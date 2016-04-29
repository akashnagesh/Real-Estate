<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="<c:url value="resources/JS/sellerviewproperties.js"/>"></script>
<title>View my properties</title>
</head>
<body>
	<h1>My properties</h1>
	<hr />
	
	<div class="row maindiv">
		<c:forEach varStatus="loopcounter" var="property"
			items="${requestScope.myProperties}">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="<c:url value="${property.photoname}"/>" style="min-height:50px;height:200px;" alt="...">
					<div class="caption">
						<h4><em>
							<c:out value='${loopcounter.count}'></c:out>
							.
							<c:out value='${property.propertyType}'></c:out></em>
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
							<em><c:out value='${property.area}'></c:out>
							sft<em>
						</p>
						<p>
							<em><b>$<c:out value='${property.price}'></c:out></b></em>
						</p>
						<p>
							<em><c:out value='${property.address}'></c:out></em>
						</p>
						<p>
							<a href="viewpropertydetails.htm?id=<c:out value='${property.id}'></c:out>" class="btn btn-primary" role="button">View
								Property</a> <a href="#" class="btn btn-default delete" role="button">Delete</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<button id="more" type="button" class="btn btn-primary btn-lg btn-block">View More Properties</button>
</body>
</html>