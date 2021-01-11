package spring_crud.dao;



import spring_crud.model.User;

import java.util.List;

public interface UserDao {

    List<User> GetAllUsers();

    void saveUser(User user);

    User getUser(int id);

    User getUserByName(String username);

    void deleteUser(int id);

}
