package com.rikkei.ss03;

import java.util.ArrayList;
import java.util.List;

public class CartManager {
    private List<Product> cart = new ArrayList<>();

    public boolean addProduct(Products product) {
        for (Product p : cart) {
            if (p.getId() == product.getId()) return false; // đã tồn tại
        }
        cart.add(product);
        return true;
    }

    public List<Product> getCart() {
        return cart;
    }

    public void removeProduct(int id) {
        cart.removeIf(p -> p.getId() == id);
    }

    public double getTotalPrice() {
        return cart.stream().mapToDouble(Product::getPrice).sum();
    }
}
