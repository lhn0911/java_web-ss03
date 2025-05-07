<%@ page import="com.rikkei.ss03.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HOANGNAM
  Date: 5/8/2025
  Time: 1:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Quản Lý Sách</title>
    <style>
        body {
            font-family: Arial;
            max-width: 700px;
            margin: 30px auto;
        }
        input[type=text], input[type=number] {
            width: 100%;
            padding: 8px;
            margin: 4px 0 12px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 24px;
        }
        table, th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin-bottom: 24px;
        }
        .form-section {
            margin-bottom: 32px;
        }
    </style>
</head>
<body>
<h1>Quản Lý Sách</h1>

<div class="form-section">
    <h2>Thêm Sách</h2>
    <form action="BookServlet" method="post">
        <input type="hidden" name="action" value="add">
        <label>Tên sách:</label>
        <input type="text" name="title" required>

        <label>Tác giả:</label>
        <input type="text" name="author" required>

        <label>Năm xuất bản:</label>
        <input type="number" name="year" required>

        <button type="submit">Thêm sách</button>
    </form>
</div>

<div class="form-section">
    <h2>Tìm Kiếm Sách</h2>
    <form action="BookServlet" method="get">
        <input type="text" name="search" placeholder="Nhập tên sách cần tìm">
        <button type="submit">Tìm</button>
    </form>
</div>

<h2>Danh Sách Sách</h2>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    if (books != null && !books.isEmpty()) {
%>
<table>
    <tr>
        <th>STT</th>
        <th>Tên sách</th>
        <th>Tác giả</th>
        <th>Năm xuất bản</th>
    </tr>
    <%
        int i = 1;
        for (Book b : books) {
    %>
    <tr>
        <td><%= i++ %></td>
        <td><%= b.getTitle() %></td>
        <td><%= b.getAuthor() %></td>
        <td><%= b.getYear() %></td>
    </tr>
    <% } %>
</table>
<%  } else { %>
<p>Không có sách nào.</p>
<% } %>

</body>
</html>
