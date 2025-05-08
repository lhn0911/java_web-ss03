<%@ page import="com.rikkei.ss03.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String msg = (String) request.getAttribute("message"); if (msg != null) { %>
<p style="color: green;"><%= msg %></p>
<% } %>

<table border="1" cellpadding="10">
    <tr><th>ID</th><th>Tên</th><th>Giá</th><th>Thao tác</th></tr>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        for (Product p : products) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getProductName() %></td>
        <td>$<%= p.getPrice() %></td>
        <td><a href="CartServlet?action=add&id=<%= p.getId() %>">Thêm giỏ hàng</a></td>
    </tr>
    <% } %>
</table>

<p><a href="CartServlet?action=cart">Xem giỏ hàng</a></p>
</body>
</html>
