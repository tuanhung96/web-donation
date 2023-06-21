package springdemo.dao;

import java.util.List;

import springdemo.entity.User;

public interface UserDAO {
	public List<User> getUsers();

	public void saveUser(User theUser);

	public void deleteUser(int theId);

	public User getUser(int theId);

}
