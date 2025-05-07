<%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/7/2025
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String name = request.getParameter("username");
    String email = request.getParameter("email");
    request.setAttribute("username",name);
    request.setAttribute("email",email);
%>
<html>
<head>
    <title>Thông tin người dùng</title>
</head>
<body>

<form method="post" action="UserInfo.jsp">
    <h2>Thông tin người dùng</h2>
    <label>
        Tên <input type="text" name="username">
    </label><br>
    <label>
        Email <input type="email" name="email">
    </label><br>
    <button type="submit">Lưu</button>
</form>
<%
    String savedName = (String) request.getAttribute("username");
    String savedEmail = (String) request.getAttribute("email");
    if (savedName != null && savedEmail != null) {
%>
<h2>Thông tin đã nhập</h2>
<p>Tên: <%= savedName %></p>
<p>Email: <%= savedEmail %></p>
<%
    }
%>
</body>
</html>
