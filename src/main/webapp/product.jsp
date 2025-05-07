<%@ page import="com.rikkei.ss03.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> productList = (List<Product>) session.getAttribute("productList");
    if (productList == null) {
        productList = new ArrayList<>();
        session.setAttribute("productList", productList);
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            int stock = Integer.parseInt(request.getParameter("stock"));
            boolean status = stock > 0; // Nếu stock > 0 thì còn hàng

            Product p = new Product(id, name, price, description, stock, status);
            productList.add(p);
        } catch (Exception e) {
            System.out.println("<p style='color:red;'>Dữ liệu không hợp lệ!</p>");
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Quản Lý Sản Phẩm</h1>
<h2>Thêm Sản Phẩm</h2>

<form method="post">
    ID: <input type="text" name="id" required><br><br>
    Tên sản phẩm: <input type="text" name="productName" required><br><br>
    Giá: <input type="text" name="price" required><br><br>
    Mô tả: <input type="text" name="description"><br><br>
    Số lượng: <input type="text" name="stock" required><br><br>
    <button type="submit">Thêm sản phẩm</button>
</form>

<h2>Danh sách sản phẩm đã thêm:</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th><th>Tên sản phẩm</th><th>Giá</th><th>Mô tả</th><th>Số lượng</th><th>Trạng thái</th>
    </tr>
    <%
        for (Product p : productList) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getProductName() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getDescription() %></td>
        <td><%= p.getStock() %></td>
        <td><%= p.isStatus() ? "Còn hàng" : "Hết hàng" %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
