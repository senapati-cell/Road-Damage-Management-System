<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>

<div class="container">
    <h2>🚧 Login</h2>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="login" method="post">

        <div class="input-box">
            <input type="email" name="email" required>
            <label>Email</label>
        </div>

        <div class="input-box password-box">
            <input type="password" name="password" id="password" required>
            <label>Password</label>
            <span class="toggle" onclick="togglePassword()">👁</span>
        </div>

        <button type="submit">Login</button>
        <br><br>
        <a href="index.jsp" class="back-btn">Back To Home</a>

    </form>
</div>

<script>
function togglePassword() {
    var pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>

</body>
</html>