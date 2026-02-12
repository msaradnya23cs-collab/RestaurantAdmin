<%@ page import="java.sql.*, com.restaurant.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bookings | Restaurant App</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">

    <h2>Bookings</h2>

    <% if(request.getParameter("msg") != null) { %>
        <div class="success"><%=request.getParameter("msg")%></div>
    <% } %>

    <%
        String editId = request.getParameter("editId");
        String customerVal = "";
        String tableVal = "";
        String dateVal = "";
        String timeVal = "";

        if(editId != null) {
            try {
                Connection con = DBConnection.getConn();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE id=?");
                ps.setInt(1, Integer.parseInt(editId));
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    customerVal = rs.getString("customer");
                    tableVal = String.valueOf(rs.getInt("tableno"));
                    dateVal = String.valueOf(rs.getDate("booking_date"));
                    timeVal = String.valueOf(rs.getTime("booking_time")).substring(0,5); // HH:mm
                }
            } catch(Exception e) { e.printStackTrace(); }
        }
    %>

<form method="post" action="<%=request.getContextPath()%>/BookingServlet">
        <input type="hidden" name="action" value="<%= (editId != null ? "update" : "add") %>">
        <% if(editId != null) { %>
            <input type="hidden" name="id" value="<%= editId %>">
        <% } %>

        <input type="text" name="customer" placeholder="Customer Name" value="<%=customerVal%>" required>
        <input type="number" name="tableno" placeholder="Table No" value="<%=tableVal%>" required>
        <input type="date" name="date" value="<%=dateVal%>" required>
        <input type="time" name="time" value="<%=timeVal%>" required>
        <input type="submit" value="<%= (editId != null ? "Update Booking" : "Add Booking") %>">
    </form>

    <table border="1">
        <tr>
            <th>Customer</th>
            <th>Table</th>
            <th>Date</th>
            <th>Time</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection con2 = DBConnection.getConn();
                Statement st = con2.createStatement();
                ResultSet list = st.executeQuery("SELECT * FROM bookings ORDER BY id DESC");
                while(list.next()){
        %>
        <tr>
            <td><%= list.getString("customer") %></td>
            <td><%= list.getInt("tableno") %></td>
            <td><%= list.getDate("booking_date") %></td>
            <td><%= list.getTime("booking_time") %></td>
            <td>
                <button onclick="location.href='<%=request.getContextPath()%>/booking.jsp?editId=<%=list.getInt("id")%>'">Edit</button>
                <button onclick="if(confirm('Delete this booking?')) location.href='<%=request.getContextPath()%>/BookingServlet?id=<%=list.getInt("id")%>'">Delete</button>
            </td>
        </tr>
        <%  }
            } catch(Exception e) { e.printStackTrace(); }
        %>
    </table>

    <button onclick="location.href='<%=request.getContextPath()%>/dashboard.jsp'">>Back to Dashboard</button>

</div>
</body>
</html>
