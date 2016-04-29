<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
								<a
									href="viewpropertydetailsbuyer.htm?id=<c:out value='${property.id}'></c:out>"
									class="btn btn-primary" role="button">View Property</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

	</div>
</body>
</html>