package com.rikkei.ss03;

public class OrderItem {
    private String product;
    private int quantity;
    private double unitPrice;

    public OrderItem(String product, int quantity, double unitPrice) {
        this.product = product;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public double getTotal() {
        return quantity * unitPrice;
    }

    public String getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }
}
