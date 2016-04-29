<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My messages</title>
<script src="<c:url value="resources/JS/viewmymessages.js"/>"></script>
</head>
<body>
	<br>
	<br>
	<div class="container">
		<div>
			&nbsp &nbsp &nbsp
			<h3>My messages</h3>
		</div>
		<br>
		<c:forEach varStatus="loopcounter" var="messages"
			items="${requestScope.listOfMessages}">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 well">
					<h3>
						<strong> <a><u><c:out
										value='${messages.property.propertyType}'></c:out>:</u></a>
						</strong>
					</h3>
					<small><p>
							<c:out value='${messages.property.address}'></c:out>
						</p></small>
					<h5>
						<strong> <c:out
								value='${messages.fromUser.person.firstName}'></c:out>&nbsp <c:out
								value='${messages.fromUser.person.lastName}'></c:out>:
						</strong>
					</h5>

					<p>
						<c:out value='${messages.message}'></c:out>
					</p>
					<hr>
					<!-- replyyyy -->
					<div class="cell">
						<c:choose>
							<c:when test="${empty messages.reply}">
								<div class="replyBox">
									<h5>Reply:</h5>

									<div class="form-group msgdiv">
										<textarea name="review" class="form-control actualMsg"
											rows="2"></textarea>
									</div>
									<input type="hidden" name="id" class="id"
										value="${messages.id}" />
									<button type="button" class="btn btn-primary replyButton">Send
										Message</button>

								</div>
							</c:when>
							<c:when test="${not empty messages.reply}">
								<h5>
									<strong> You: </strong>
								</h5>

								<p>
									<c:out value='${messages.reply}'></c:out>
								</p>

							</c:when>
						</c:choose>
					</div>
					<!-- replyyyy -->
				</div>
				<div class="col-md-2"></div>
			</div>

		</c:forEach>



	</div>
</body>
</html>