package com.rikkei.ss03;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    private List<Products> products = new ArrayList<>();
    private CartManager cartManager = new CartManager();
    @Override
    public void init() {
        products.add(new Products(1, "iPhone", 999.0));
        products.add(new Products(2, "Samsung", 899.0));
        products.add(new Products(3, "Xiaomi", 499.0));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("cart".equals(action)) {
            request.setAttribute("cart", cartManager.getCart());
            request.setAttribute("total", cartManager.getTotalPrice());
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Products selected = products.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
            String message;
            if (selected != null && cartManager.addProduct(selected)) {
                message = "Đã thêm vào giỏ hàng.";
            } else {
                message = "Sản phẩm đã có trong giỏ hàng.";
            }
            request.setAttribute("message", message);
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } else if ("remove".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            cartManager.removeProduct(id);
            response.sendRedirect("CartServlet?action=cart");
        } else {
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}