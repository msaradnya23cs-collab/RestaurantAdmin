<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">

    <h2>Signup</h2>

<form action="SignupServlet" method="post">
        <input type="text" name="username" required>
        <input type="password" name="password" required>
        <input type="submit" value="Signup">
    </form>

    <a href="<%=request.getContextPath()%>/login.jsp">Login</a>

</div>
</body>
</html>
