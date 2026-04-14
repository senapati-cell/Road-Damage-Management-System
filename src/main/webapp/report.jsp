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
    <title>Report Damage</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/report.css">
</head>

<body>

<div class="container">
    <h2>🚧 Report Road Damage</h2>

    <form action="report" method="post" enctype="multipart/form-data">

        <input type="text" name="location" placeholder="Enter Location" required>

        <textarea name="description" placeholder="Describe the issue" required></textarea>

        <input type="file" name="image" required>

        <button type="submit">Submit</button>

    </form>
</div>

</body>
</html>