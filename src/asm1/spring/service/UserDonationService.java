package asm1.spring.service;

import java.util.List;

import asm1.spring.entity.UserDonation;

public interface UserDonationService {
	public List<UserDonation> getUserDonations();
	
	public void saveUserDonation(UserDonation theUserDonation);

	public UserDonation getUserDonationById(int id);

	public void deleteUserDonation(int theId);
	
	public List<UserDonation> getListUserDonationById(int id);
}
