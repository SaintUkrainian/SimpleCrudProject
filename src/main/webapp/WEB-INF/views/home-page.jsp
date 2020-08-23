<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Demo Spring App</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css">
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="${pageContext.request.contextPath}/scripts/script.js" defer></script>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<div class="header">
			<div class="d-flex flex-column bd-highlight mb-3">
				<p><span style="font-weight: bold;">README:</span> It's a simple CRUD application of mine, which uses
					Spring REST (simple concepts), Spring Data JPA, Spring MVC, JSP and Bootstrap. Input validations are
					not provided yet (e.g. email can be like example.com or name like @gmail.com)</p>
				<h1 class="font-weight-light p-0">Hello, World of Spring!</h1>
				<h2 class="bd-highlight">Time on Server when page is loaded: ${date}</h3>
					<h3 class="font-weight-light">Type the name to get JSON from our DataBase!</h3>
					<form:form action="${pageContext.request.contextPath}/instructor" method="GET">
						<div class="form-inline">
							<div class="form-group">
								<input type="text" name="firstName" class="form-control mr-3">
							</div>
							<div class="form-group">
								<input type="submit" value="Get" class="btn btn-primary">
							</div>
						</div>

					</form:form>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/addInstructorPage" class="btn btn-secondary mb-2">New Instructor</a>
		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="temp" items="${instructors}">
					<c:url var="deleteLink" value="/deleteInstructor">
						<c:param name="instructorId" value="${temp.id}" />
					</c:url>
					<c:url var="updateLink" value="/addInstructor">
						<c:param name="instructorId" value="${temp.id}" />
					</c:url>
					<tr>
						<td>${temp.firstName}</td>

						<td>${temp.lastName}</td>

						<td>${temp.email}</td>
						<td><a href="${deleteLink}" class="text-danger"
								onclick="if(!confirm('Are you sure?')) return false;">Delete</a> <a href="${updateLink}"
								class="text-primary">Update</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

</html>