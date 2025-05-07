<%@ page import="com.rikkei.ss03.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 2:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function confirmDelete(id) {
            if (confirm("Bạn có chắc chắn muốn xóa người dùng này?")) {
                window.location.href = "UserServlet?action=delete&id=" + id;
            }
        }
    </script>
</head>
<body>
<h2>Danh sách người dùng</h2>

<% String msg = (String) request.getAttribute("message");
    if (msg != null) { %>
<p style="color: green;"><%= msg %></p>
<% } %>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th><th>Tên</th><th>Email</th><th>Hành động</th>
    </tr>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null) {
            for (User user : users) {
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getEmail() %></td>
        <td><button onclick="confirmDelete(<%= user.getId() %>)">Xóa</button></td>
    </tr>
    <% }} %>
</table>

<br><a href="input.jsp">Quay lại trang thêm người dùng</a>
</body>
</html>
