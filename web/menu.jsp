<%@ page import="java.sql.*, com.restaurant.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Menu | Restaurant App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="overlay">

    <h2>Menu Items</h2>

    <% if(request.getParameter("msg") != null) { %>
        <div class="success"><%= request.getParameter("msg") %></div>
    <% } %>

    <%
        String editId = request.getParameter("editId");
        String nameVal = "";
        String priceVal = "";

        if (editId != null) {
            try {
                Connection c = DBConnection.getConn();
                PreparedStatement ps = c.prepareStatement("SELECT * FROM menu WHERE id=?");
                ps.setInt(1, Integer.parseInt(editId));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    nameVal = rs.getString("name");
                    priceVal = String.valueOf(rs.getDouble("price"));
                }
            } catch(Exception e) { e.printStackTrace(); }
        }
    %>

    <form method="post" action="MenuServlet">
        <input type="hidden" name="action" value="<%= (editId != null ? "update" : "add") %>">
        <% if (editId != null) { %>
            <input type="hidden" name="id" value="<%= editId %>">
        <% } %>
        <input type="text" name="name" placeholder="Item Name" value="<%= nameVal %>" required>
        <input type="number" step="0.01" name="price" placeholder="Price" value="<%= priceVal %>" required>
        <input type="submit" value="<%= (editId != null ? "Update Item" : "Add Item") %>">
    </form>

    <table>
        <tr><th>Name</th><th>Price</th><th>Actions</th></tr>
        <%
            Connection c = DBConnection.getConn();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM menu");
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td>
                <button onclick="location.href='menu.jsp?editId=<%=rs.getInt("id")%>'">Edit</button>
                <button onclick="location.href='MenuServlet?id=<%=rs.getInt("id")%>'">Delete</button>
            </td>
        </tr>
        <% } %>
    </table>

    <button onclick="location.href='dashboard.jsp'">Back to Dashboard</button>

</div>
</body>
</html>
