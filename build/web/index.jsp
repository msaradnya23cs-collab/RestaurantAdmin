<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Restaurant App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="overlay">

    <h2>Login to DineDesk</h2>

    <% if(request.getParameter("error") != null) { %>
        <div style="color:red;">
            <%= request.getParameter("error") %>
        </div>
    <% } %>

    <form action="./LoginServlet" method="post">

        <input type="text" name="username" placeholder="Username" required>

        <input type="password" name="password" placeholder="Password" required>

        <input type="submit" value="Login">

    </form>

    <a href="signup.jsp">
        Don't have an account? Sign Up
    </a>

</div>

</body>
</html>
