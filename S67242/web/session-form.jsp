<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Booking Session</title>

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">

        <a href="<%=request.getContextPath()%>/list" class="navbar-brand">
            Booking Session Car
        </a>

        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/list" class="nav-link">
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

            <h2 class="mb-4">New Booking Session</h2>

            <form action="<%=request.getContextPath()%>/insert" method="post">

                <fieldset class="form-group">
                    <label>Student Name</label>
                    <input type="text"
                           class="form-control"
                           name="studentName"
                           required>
                </fieldset>

                <fieldset class="form-group">
                    <label>Branch Location</label>
                    <input type="text"
                           class="form-control"
                           name="branchLocation"
                           required>
                </fieldset>

                <fieldset class="form-group">
                    <label>Lesson Type</label>
                    <input list="typeList"
                           class="form-control"
                           name="type"
                           required>

                    <datalist id="typeList">
                        <option value="Manual Car">
                        <option value="Automatic Car">
                        <option value="Motorcycle">
                    </datalist>
                </fieldset>

                <fieldset class="form-group">
                    <label>Status</label>
                    <input list="statusList"
                           class="form-control"
                           name="status"
                           required>

                    <datalist id="statusList">
                        <option value="Booked">
                        <option value="Completed">
                    </datalist>
                </fieldset>

                <button type="submit" class="btn btn-success">
                    Save
                </button>

                <a href="<%=request.getContextPath()%>/list" class="btn btn-secondary">
                    Cancel
                </a>

            </form>

        </div>
    </div>

</div>

</body>
</html>