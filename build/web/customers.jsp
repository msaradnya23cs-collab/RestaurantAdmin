<%@ page import="java.sql.*, com.restaurant.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customers | Restaurant App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="overlay">

    <h2>Customers</h2>

    <% if(request.getParameter("msg") != null) { %>
        <div class="success"><%=request.getParameter("msg")%></div>
    <% } %>

    <%
        String editId = request.getParameter("editId");
        String nameVal = "";
        String phoneVal = "";

        if(editId != null) {
            Connection con = DBConnection.getConn();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE id=?");
            ps.setInt(1, Integer.parseInt(editId));
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                nameVal = rs.getString("name");
                phoneVal = rs.getString("phone");
            }
        }
    %>

    <form method="post" action="CustomerServlet">
        <input type="hidden" name="action" value="<%= (editId != null ? "update" : "add") %>">
        <% if(editId != null) { %>
            <input type="hidden" name="id" value="<%= editId %>">
        <% } %>

        <input type="text" name="name" placeholder="Name" value="<%= nameVal %>" required>
        <input type="text" name="phone" placeholder="Phone" value="<%= phoneVal %>" required>
        <input type="submit" value="<%= (editId != null ? "Update Customer" : "Add Customer") %>">
    </form>

    <table>
        <tr><th>Name</th><th>Phone</th><th>Actions</th></tr>
        <%
            Connection con2 = DBConnection.getConn();
            Statement st = con2.createStatement();
            ResultSet rs2 = st.executeQuery("SELECT * FROM customers");
            while(rs2.next()) {
        %>
        <tr>
            <td><%= rs2.getString("name") %></td>
            <td><%= rs2.getString("phone") %></td>
            <td>
                <button onclick="location.href='customers.jsp?editId=<%= rs2.getInt("id") %>'">Edit</button>

                <button onclick="location.href='CustomerServlet?id=<%= rs2.getInt("id") %>'">
                    Delete
                </button>
            </td>
        </tr>
        <% } %>
    </table>

    <button onclick="location.href='dashboard.jsp'">Back to Dashboard</button>

</div>
</body>
</html>
