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
		<h3>Your favorite properties</h3>
		
		<c:choose>
			<c:when test="${empty requestScope.buyerProperties}">
				<div class="alert alert-danger" role="alert">No favorite properties yet!</div>
			</c:when>
		</c:choose>
		<div class="row maindiv">
			<c:forEach varStatus="loopcounter" var="buyerProperty"
				items="${requestScope.buyerProperties}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<c:url value="${buyerProperty.property.photoname}"/>" style="min-height:50px;height:200px;" alt="...">
						<div class="caption">
							<h4>
								<em> <c:out value='${loopcounter.count}'></c:out> . <c:out
										value='${buyerProperty.property.propertyType}'></c:out></em>
							</h4>
							<p>
								Property for: <strong><c:out
										value='${buyerProperty.property.propertyFor}'></c:out></strong>
							</p>
							<p>
								<c:out value='${buyerProperty.property.noOfBedrooms}'></c:out>
								Beds
							</p>
							<p>
								<c:out value='${buyerProperty.property.noOfBath}'></c:out>
								Total Baths
							</p>
							<p>
								<em><c:out value='${buyerProperty.property.area}'></c:out> sft<em>
							</p>
							<p>
								<em><b>$<c:out value='${buyerProperty.property.price}'></c:out></b></em>
							</p>
							<p>
								<em><c:out value='${buyerProperty.property.address}'></c:out></em>
							</p>
							<p>
								<a
									href="viewpropertydetailsbuyer.htm?id=<c:out value='${buyerProperty.property.id}'></c:out>"
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