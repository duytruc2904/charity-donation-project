package asm1.spring.dao;

import java.util.List;


import asm1.spring.entity.User;


public interface UserDAO {
	
	public List<User> getUsers();
	
	public void saveUser(User theUser);

	public User getUserById(int userId);

	public void deleteUser(int theId);
}
