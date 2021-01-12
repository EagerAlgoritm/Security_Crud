package spring_crud.service;



import spring_crud.model.User;

import java.util.List;

public interface UserService {

    List<User> GetAllUsers();

    User getUserByName(String username);

    void saveUser(User user);

    User getUser(int id);

    void deleteUser(int id);
}
