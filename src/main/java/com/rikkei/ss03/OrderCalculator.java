package com.rikkei.ss03;

import java.util.List;

public class OrderCalculator {
    public static double calculateTotal(List<OrderItem> items) {
        double total = 0;
        for (OrderItem item : items) {
            total += item.getTotal();
        }
        return total;
    }
}
