<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="com.project.db.DBConnection" %>

<%
Integer userId = (Integer) session.getAttribute("userId");
if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Complaints</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/complaint.css">
</head>

<body>

<div class="container">
    <h2 class="title">📋 Your Complaints</h2>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Location</th>
            <th>Description</th>
            <th>Image</th>
            <th>Status</th>
        </tr>

<%
try {
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM complaints WHERE user_id=?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("location") %></td>
    <td><%= rs.getString("description") %></td>
    <td><img src="uploads/<%= rs.getString("image_path") %>" class="img"></td>
    <td class="status"><%= rs.getString("status") %></td>
</tr>

<%
    }
} catch(Exception e){
    out.println(e);
}
%>

    </table>

    <a href="userDashboard.jsp" class="back-btn">⬅ Back</a>
</div>

</body>
</html>