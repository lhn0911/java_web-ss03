package com.rikkei.ss03;

import java.util.ArrayList;
import java.util.List;

public class CartManager {
    private List<Products> cart = new ArrayList<>();

    public boolean addProduct(Products product) {
        for (Products p : cart) {
            if (p.getId() == product.getId()) return false;
        }
        cart.add(product);
        return true;
    }

    public List<Products> getCart() {
        return cart;
    }

    public void removeProduct(int id) {
        cart.removeIf(p -> p.getId() == id);
    }

    public double getTotalPrice() {
        return cart.stream().mapToDouble(Products::getPrice).sum();
    }
}
