<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Demo Spring App</title>
    <!-- Required meta tags -->
    <style>
        .error {
            color: red;
        }
    </style>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>

<body>
<div class="container">
    <div class="d-flex flex-column bd-highlight mb-3">
        <h2 class="font-weight-light p-0">
            This is a page for adding instructors!
        </h2>
        <span class="border border-primary" style="max-width: 18rem;">
                <form:form action="/updateInstructor" method="POST" modelAttribute="instructor">
                    <div class="form-group col-md-12 p-3">
                        <form:hidden path="id"/>
                        <form:errors path="firstName" cssClass="error" />
                        <input type="text" class="form-control mb-3" name="firstName" value="${instructor.firstName}"
                               placeholder="Enter first name">
                        <form:errors path="lastName" cssClass="error" />
                        <input type="text" class="form-control mb-3" name="lastName" value="${instructor.lastName}"
                               placeholder="Enter last name">
                        <form:errors path="email" cssClass="error" />
                        <input type="text" class="form-control mb-3" name="email" value="${instructor.email}"
                               placeholder="Enter email">
                        <br>
                        <input type="submit" class="btn btn-primary" value="Add">
                    </div>
                    <a href="${pageContext.request.contextPath}/" class="text-primary m-3">Back to home page</a>
                </form:form>
            </span>
    </div>
</div>
</body>

</html>