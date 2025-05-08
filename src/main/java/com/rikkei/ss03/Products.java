package com.rikkei.ss03;

public class Products {
    private int id;
    private String name;
    private double price;

    public Products(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
}
