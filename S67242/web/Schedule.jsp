<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Car Session</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
        style="background-color: tomato">
        <div>
            <a href="<%=request.getContextPath()%>/list"
                class="navbar-brand">Booking Car Session</a>
        </div>

        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/list"
                    class="nav-link">Booking List</a>
            </li>
        </ul>
    </nav>
</header>

<div class="container mt-4">

    <h3 class="text-center">List of Booking</h3>
    <hr>

    <div class="mb-3">
        <a href="<%=request.getContextPath()%>/new"
            class="btn btn-success">
            Add New Booking
        </a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Position</th>
                <th width="180">Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="employee" items="${listEmployee}">
                <tr>
                    <td><c:out value="${employee.id}" /></td>
                    <td><c:out value="${employee.name}" /></td>
                    <td><c:out value="${employee.email}" /></td>
                    <td><c:out value="${employee.position}" /></td>

                    <td>
                        <a href="edit?id=${employee.id}"
                            class="btn btn-primary btn-sm">
                            Edit
                        </a>

                        <a href="delete?id=${employee.id}"
                            class="btn btn-danger btn-sm"
                            onclick="return confirm('Are you sure?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty listEmployee}">
                <tr>
                    <td colspan="5" class="text-center">
                        No records found.
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

</div>

</body>
</html>