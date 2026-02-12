<%@ page import="java.sql.*, com.restaurant.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff | Restaurant App</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<div class="overlay">

    <h2>Staff Members</h2>

    <% if(request.getParameter("msg") != null) { %>
        <div class="success"><%=request.getParameter("msg")%></div>
    <% } %>

    <%
        String editId = request.getParameter("editId");
        String nameVal = "";
        String roleVal = "";

        if(editId != null) {
            try {
                Connection con = DBConnection.getConn();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE id=?");
                ps.setInt(1, Integer.parseInt(editId));
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    nameVal = rs.getString("name");
                    roleVal = rs.getString("role");
                }
            } catch(Exception e) { e.printStackTrace(); }
        }
    %>

    <form method="post" action="<%=request.getContextPath()%>/StaffServlet">
        <input type="hidden" name="action" value="<%= (editId != null ? "update" : "add") %>">
        <% if(editId != null) { %>
            <input type="hidden" name="id" value="<%= editId %>">
        <% } %>

        <input type="text" name="name" placeholder="Staff Name" value="<%= nameVal %>" required>
        <input type="text" name="role" placeholder="Role" value="<%= roleVal %>" required>
        <input type="submit" value="<%= (editId != null ? "Update Staff" : "Add Staff") %>">
    </form>

    <table>
        <tr><th>Name</th><th>Role</th><th>Actions</th></tr>
        <%
            Connection con = DBConnection.getConn();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM staff");
            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("role") %></td>
            <td>
                <button onclick="location.href='<%=request.getContextPath()%>/staff.jsp?editId=<%= rs.getInt("id") %>'">Edit</button>
                <button onclick="location.href='<%=request.getContextPath()%>/StaffServlet?id=<%= rs.getInt("id") %>'">Delete</button>
            </td>
        </tr>
        <% } %>
    </table>

    <button onclick="location.href='<%=request.getContextPath()%>/dashboard.jsp'">
        Back to Dashboard
    </button>

</div>
</body>
</html>
