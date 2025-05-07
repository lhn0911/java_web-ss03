package com.rikkei.ss03;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UserManager {
    private static List<User> userList = new ArrayList<>();
    private static int currentId = 1;

    public static void addUser(User user) {
        user.setId(currentId++);
        userList.add(user);
    }

    public static List<User> getUsers() {
        return userList;
    }

    public static void removeUser(int id) {
        Iterator<User> iterator = userList.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getId() == id) {
                iterator.remove();
                break;
            }
        }
    }
}
