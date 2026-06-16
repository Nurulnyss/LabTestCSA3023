<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Car Session</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
        style="background-color: tomato">

        <a href="<%=request.getContextPath()%>/list"
            class="navbar-brand">
            Booking Car Session
        </a>

        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/list"
                    class="nav-link">
                    Booking List
                </a>
            </li>
        </ul>

    </nav>
</header>

<div class="container mt-4">

    <h3 class="text-center">List of Booking Sessions</h3>
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
                <th>Student Name</th>
                <th>Branch Location</th>
                <th>Lesson Type</th>
                <th>Status</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="session" items="${listSession}">
                <tr>
                    <td><c:out value="${session.session_id}" /></td>
                    <td><c:out value="${session.student_name}" /></td>
                    <td><c:out value="${session.branch_location}" /></td>
                    <td><c:out value="${session.type}" /></td>
                    <td><c:out value="${session.status}" /></td>
                </tr>
            </c:forEach>

            <c:if test="${empty listSession}">
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