<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Session Car</title>

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">

        <div>
            <a href="#" class="navbar-brand">
                Booking Session Car
            </a>
        </div>

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

<br>

<div class="container col-md-6">

    <div class="card">

        <div class="card-body">

            <c:if test="${sessionBean == null}">
                <form action="insert" method="post">
            </c:if>

            <c:if test="${sessionBean != null}">
                <form action="update" method="post">

                    <input type="hidden"
                           name="id"
                           value="<c:out value='${sessionBean.id}' />">

            </c:if>

            <h2 class="mb-4">
                <c:if test="${sessionBean == null}">
                    New Booking Session
                </c:if>

                <c:if test="${sessionBean != null}">
                    Edit Booking Session
                </c:if>
            </h2>

            <!-- Student Name -->
            <fieldset class="form-group">
                <label>Student Name</label>

                <input type="text"
                       class="form-control"
                       name="studentName"
                       value="<c:out value='${sessionBean.studentName}' />"
                       required>
            </fieldset>

            <!-- Branch Location -->
            <fieldset class="form-group">
                <label>Branch Location</label>

                <input type="text"
                       class="form-control"
                       name="branchLocation"
                       value="<c:out value='${sessionBean.branchLocation}' />"
                       required>
            </fieldset>

            <!-- Lesson Type -->
            <fieldset class="form-group">
                <label>Lesson Type</label>

                <input list="typeList"
                       class="form-control"
                       name="type"
                       value="<c:out value='${sessionBean.type}' />">

                <datalist id="typeList">
                    <option value="Manual Car">
                    <option value="Automatic Car">
                    <option value="Motorcycle">
                </datalist>
            </fieldset>

            <!-- Status -->
            <fieldset class="form-group">
                <label>Status</label>

                <input list="statusList"
                       class="form-control"
                       name="status"
                       value="<c:out value='${sessionBean.status}' />">

                <datalist id="statusList">
                    <option value="Booked">
                    <option value="Completed">
                </datalist>
            </fieldset>

            <button type="submit"
                    class="btn btn-success">
                Save
            </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>