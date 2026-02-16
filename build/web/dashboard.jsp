<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>DineDesk Dashboard</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">

    <h2>DineDesk Dashboard</h2>

    <div class="dashboard-buttons">
        <button onclick="location.href='<%=request.getContextPath()%>/menu.jsp'">Menu</button>
        <button onclick="location.href='<%=request.getContextPath()%>/customers.jsp'">Customers</button>
        <button onclick="location.href='<%=request.getContextPath()%>/booking.jsp'">Booking</button>
        <button onclick="location.href='<%=request.getContextPath()%>/staff.jsp'">Staff</button>
        <button onclick="location.href='<%=request.getContextPath()%>/logout.jsp'">Logout</button>
    </div>

</div>
</body>
</html>
