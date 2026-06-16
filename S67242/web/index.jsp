<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DriveSmart Booking System</title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/list">
        DriveSmart Booking System
    </a>
</nav>

<div class="container mt-5">

    <div class="card">
        <div class="card-header">
            <h3>Booking Car Session</h3>
        </div>

        <div class="card-body">
            <div class="list-group">

                <a href="<%=request.getContextPath()%>/list"
                   class="list-group-item list-group-item-action">
                    View All Booking Sessions
                </a>

                <a href="<%=request.getContextPath()%>/new"
                   class="list-group-item list-group-item-action">
                    Add New Booking Session
                </a>

            </div>
        </div>
    </div>

</div>

</body>
</html>