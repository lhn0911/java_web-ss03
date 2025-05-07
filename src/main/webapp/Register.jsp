<%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Biểu mẫu đăng ký</h2>

<form method="post">
  Họ và tên: <input type="text" name="fullname" required><br><br>
  Email: <input type="email" name="email" required><br><br>
  Mật khẩu: <input type="password" name="password" required><br><br>
  <input type="submit" value="Đăng ký">
</form>

<%
  if ("POST".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (name != null && email != null && password != null &&
            !name.isEmpty() && !email.isEmpty() && !password.isEmpty()) {
%>
<h3 style="color:green;">Cảm ơn <%= name %> đã đăng ký với email <%= email %>!</h3>
<%
} else {
%>
<h3 style="color:red;">Vui lòng nhập đầy đủ thông tin!</h3>
<%
    }
  }
%>
</body>
</html>
