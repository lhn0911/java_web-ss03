<%@ page import="com.rikkei.ss03.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.rikkei.ss03.OrderCalculator" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 1:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<OrderItem> items = new ArrayList<>();
  double totalPrice = 0;

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    String product = request.getParameter("product");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));

    OrderItem item = new OrderItem(product, quantity, unitPrice);
    items.add(item);
    totalPrice = OrderCalculator.calculateTotal(items);
  }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Order Form</h1>
<form method="post">
  Product: <input type="text" name="product" required><br><br>
  Quantity: <input type="number" name="quantity" required><br><br>
  Price per Unit: <input type="text" name="unitPrice" required><br><br>
  <button type="submit">Submit</button>
</form>

<%
  if (!items.isEmpty()) {
%>
<h2>Order Summary</h2>
<table border="1">
  <tr><th>Product</th><th>Quantity</th><th>Price per Unit</th><th>Total</th></tr>
  <%
    for (OrderItem item : items) {
  %>
  <tr>
    <td><%= item.getProduct() %></td>
    <td><%= item.getQuantity() %></td>
    <td><%= item.getUnitPrice() %></td>
    <td><%= item.getTotal() %></td>
  </tr>
  <%
    }
  %>
  <tr>
    <td colspan="3"><strong>Total Price:</strong></td>
    <td><%= totalPrice %></td>
  </tr>
</table>
<%
  }
%>
</body>
</html>
