package asm1.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm1.spring.dao.UserDAO;
import asm1.spring.entity.User;


@Service
public class UserServiceImpl implements UserService {
	
	// need to inject user dao
		@Autowired
//		@Transactional
		private UserDAO userDAO;
		
		@Override
		@Transactional
		public List<User> getUsers() {
			return userDAO.getUsers();
		}

		@Override
		@Transactional
		public void saveUser(User theUser) {
			userDAO.saveUser(theUser);
		}
		
		@Override
		@Transactional
		public User getUserById(int userId) {
			return userDAO.getUserById(userId);
		}

		@Override
		@Transactional
		public void deleteUser(int theId) {
			userDAO.deleteUser(theId);
			
		}
		
		
		
}
