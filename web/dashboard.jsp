<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="overlay">

    <h2>DineDesk Dashboard</h2>

    <div class="dashboard-buttons">
        <button onclick="location.href='menu.jsp'">Menu</button>
        <button onclick="location.href='customers.jsp'">Customers</button>
        <button onclick="location.href='booking.jsp'">Booking</button>
        <button onclick="location.href='staff.jsp'">Staff</button>
        <button class="logout" onclick="if(confirm('Are you sure you want to logout?')){ location.href='logout.jsp'; }">
            Logout
        </button>
    </div>

</div>
</body>
</html>
