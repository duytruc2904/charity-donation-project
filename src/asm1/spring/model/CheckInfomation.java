package asm1.spring.model;

import java.util.List;

import asm1.spring.entity.User;

public class CheckInfomation {
	public boolean checkLogin(List<User> users, String email, String password) {
		for(User user: users) {
			if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
				return true;
			}
		}
		
		return false;
	}
	

}
