<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/register.css">
</head>

<body>

<div class="container">
    <h2>🛠 Register</h2>

    <form action="register" method="post">

        <div class="input-box">
            <input type="text" name="name" required>
            <label>Name</label>
        </div>

        <div class="input-box">
            <input type="email" name="email" required>
            <label>Email</label>
        </div>

        <div class="input-box password-box">
            <input type="password" name="password" id="password" required>
            <label>Password</label>
            <span class="toggle" onclick="togglePassword()">👁</span>
        </div>

        <button type="submit">Register</button>

    </form>

    <a href="login.jsp" class="link">Already have an account?</a>
     <br><br>
        <a href="index.jsp" class="back-btn">Back To Home</a>
</div>

<script>
function togglePassword() {
    var pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>

</body>
</html>