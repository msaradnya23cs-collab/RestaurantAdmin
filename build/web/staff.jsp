<%@ page import="java.sql.*, com.restaurant.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff | Restaurant App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="overlay">

<h2>Staff Members</h2>
<% if(request.getParameter("msg") != null) { %>
    <div class="success"><%= request.getParameter("msg") %></div>
<% } %>

<%
    String editId = request.getParameter("editId");
    String nameVal = "";
    String roleVal = "";
    if(editId != null){
        Connection con = DBConnection.getConn();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE id=?");
        ps.setInt(1, Integer.parseInt(editId));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            nameVal = rs.getString("name");
            roleVal = rs.getString("role");
        }
    }
%>

<form method="post" action="StaffServlet">
    <input type="hidden" name="action" value="<%= (editId != null ? "update" : "add") %>">
    <% if(editId != null){ %>
        <input type="hidden" name="id" value="<%= editId %>">
    <% } %>
    <input type="text" name="name" placeholder="Staff Name" value="<%= nameVal %>" required>
    <input type="text" name="role" placeholder="Role" value="<%= roleVal %>" required>
    <input type="submit" value="<%= (editId != null ? "Update Staff" : "Add Staff") %>">
</form>

<table>
<tr><th>Name</th><th>Role</th><th>Actions</th></tr>
<%
    Connection con2 = DBConnection.getConn();
    Statement st = con2.createStatement();
    ResultSet rs2 = st.executeQuery("SELECT * FROM staff ORDER BY id");
    while(rs2.next()) {
%>
<tr>
    <td><%= rs2.getString("name") %></td>
    <td><%= rs2.getString("role") %></td>
    <td>
        <button onclick="location.href='staff.jsp?editId=<%= rs2.getInt("id") %>'">Edit</button>
        <button onclick="location.href='StaffServlet?id=<%= rs2.getInt("id") %>'">Delete</button>
    </td>
</tr>
<% } %>
</table>

<button onclick="location.href='dashboard.jsp'">Back to Dashboard</button>

</div>
</body>
</html>
