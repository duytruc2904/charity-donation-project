package asm1.spring.dao;

import java.util.List;

import asm1.spring.entity.UserDonation;


public interface UserDonationDAO {
	public List<UserDonation> getUserDonations();
	
	public void saveUserDonation(UserDonation theDonation);

	public UserDonation getUserDonationById(int id);

	public void deleteUserDonation(int id);

	public List<UserDonation> getListUserDonationById(int id);
}
