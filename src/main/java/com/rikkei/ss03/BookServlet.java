package com.rikkei.ss03;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {
    private List<Book> bookList = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("books", bookList);
        request.getRequestDispatcher("homeb8.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            int year = Integer.parseInt(request.getParameter("year"));

            bookList.add(new Book(title, author, year));
            request.setAttribute("books", bookList);
        } else if ("search".equals(action)) {
            String keyword = request.getParameter("search");
            List<Book> result = bookList.stream()
                    .filter(b -> b.getTitle().toLowerCase().contains(keyword.toLowerCase()))
                    .collect(Collectors.toList());
            request.setAttribute("books", result);
        }

        request.getRequestDispatcher("homeb8.jsp").forward(request, response);
    }
}