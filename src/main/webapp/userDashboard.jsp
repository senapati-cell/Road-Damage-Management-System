<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/user.css">
</head>

<body>

<div class="container">
    <h2 class="title">🚧 Welcome, <%= user %></h2>

    <div class="card-group">
        <a href="report.jsp" class="card">
            <span>🛠</span>
            <h3>Report Damage</h3>
        </a>

        <a href="viewComplaints.jsp" class="card">
            <span>📋</span>
            <h3>View Complaints</h3>
        </a>

        <a href="logout" class="card logout">
            <span>🚪</span>
            <h3>Logout</h3>
        </a>
    </div>
</div>

</body>
</html>