<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Demo Spring App</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
</head>

<body>
    <div class="container">
        <div class="d-flex flex-column bd-highlight mb-3">
            <h2 class="font-weight-light p-0">
                Hello, this is a page for adding instructors!
            </h2>
            <span class="border border-primary" style="max-width: 18rem;">
                <form:form action="/updateInstructor" method="POST">
                    <div class="form-group col-md-12 p-3">
                        <input type="text" class="form-control mb-3" name="firstName" placeholder="Enter first name">
                        <input type="text" class="form-control mb-3" name="lastName" placeholder="Enter last name">
                        <input type="text" class="form-control mb-3" name="email" placeholder="Enter email">
                        <input type="submit" class="btn btn-primary" value="Add">
                    </div>
                </form:form>
            </span>
        </div>
    </div>
</body>

</html>