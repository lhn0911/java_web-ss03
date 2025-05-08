<%@ page import="com.rikkei.ss03.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Giỏ hàng</h1>

<table border="1" cellpadding="10">
  <tr><th>ID</th><th>Tên</th><th>Giá</th><th>Xóa</th></tr>
  <%
    List<Product> cart = (List<Product>) request.getAttribute("cart");
    for (Product p : cart) {
  %>
  <tr>
    <td><%= p.getId() %></td>
    <td><%= p.getProductName() %></td>
    <td>$<%= p.getPrice() %></td>
    <td><a href="CartServlet?action=remove&id=<%= p.getId() %>">Xóa</a></td>
  </tr>
  <% } %>
</table>

<p><strong>Tổng giá trị:</strong> $<%= request.getAttribute("total") %></p>
<p><a href="CartServlet">Quay lại danh sách sản phẩm</a></p>
</body>
</html>
