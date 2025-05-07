<%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 12:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Nhập hai số để cộng:</h2>
<form method="get">
    Số thứ nhất: <input type="number" name="num1" required><br><br>
    Số thứ hai: <input type="number" name="num2" required><br><br>
    <input type="submit" value="Tính tổng">
</form>

<%
    String n1 = request.getParameter("num1");
    String n2 = request.getParameter("num2");
    if (n1 != null && n2 != null) {
        try {
            int num1 = Integer.parseInt(n1);
            int num2 = Integer.parseInt(n2);
            int sum = num1 + num2;
%>
<h3>Kết quả: <%= sum %></h3>
<%
} catch (NumberFormatException e) {
%>
<h3 style="color:red;">Vui lòng nhập số hợp lệ!</h3>
<%
        }
    }
%>
</body>
</html>
