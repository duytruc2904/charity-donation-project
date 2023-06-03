package asm1.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm1.spring.dao.UserDonationDAO;
import asm1.spring.entity.UserDonation;


@Service
public class UserDonationServiceImpl implements UserDonationService {
	
	@Autowired
	private UserDonationDAO userDonationDAO;

	@Override
	@Transactional
	public List<UserDonation> getUserDonations() {
		return userDonationDAO.getUserDonations();
	}

	@Override
	@Transactional
	public void saveUserDonation(UserDonation theUserDonation) {
		userDonationDAO.saveUserDonation(theUserDonation);
	}

	@Override
	@Transactional
	public UserDonation getUserDonationById(int id) {
		return userDonationDAO.getUserDonationById(id);
	}

	@Override
	@Transactional
	public void deleteUserDonation(int theId) {
		userDonationDAO.deleteUserDonation(theId);

	}

	@Override
	@Transactional
	public List<UserDonation> getListUserDonationById(int id) {
		return userDonationDAO.getListUserDonationById(id);
	}

}
