<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">

    <h2>Signup</h2>

    <% if(request.getParameter("msg") != null){ %>
        <div class="error"><%= request.getParameter("msg") %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/SignupServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Signup">
    </form>

    <a href="<%=request.getContextPath()%>/login.jsp">Login</a>

</div>
</body>
</html>
