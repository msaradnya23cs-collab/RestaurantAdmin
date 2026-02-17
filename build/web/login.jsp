<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Restaurant App</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">
    <h2>Login to DineDesk</h2>
    <% if(request.getParameter("error") != null) { %>
        <div style="color:red;"><%= request.getParameter("error") %></div>
    <% } %>

<form action="LoginServlet" method="post">
    <input type="text" name="username" required />
    <input type="password" name="password" required />
    <button type="submit">Login</button>
</form>


    <a href="<%=request.getContextPath()%>/signup.jsp">Don't have an account? Sign Up</a>
</div>
</body>
</html>
