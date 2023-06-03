package asm1.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm1.spring.dao.DonationDAO;
import asm1.spring.entity.Donation;

@Service
public class DonationServiceImpl implements DonationService{

	// need to inject DonationDAO
			@Autowired
//			@Transactional
			private DonationDAO donationDAO;
			
			@Override
			@Transactional
			public List<Donation> getDonations() {
				return donationDAO.getDonations();
			}

			@Override
			@Transactional
			public void saveDonation(Donation theDonation) {
				donationDAO.saveDonation(theDonation);
			}
			
			@Override
			@Transactional
			public Donation getDonationById(int id) {
				return donationDAO.getDonationById(id);
			}

			@Override
			@Transactional
			public void deleteDonation(int theId) {
				donationDAO.deleteDonation(theId);
				
			}
			
			@Override
			@Transactional
			public List<Donation> findAll(Integer offset, Integer maxResult) {
		        return donationDAO.findAll(offset, maxResult);
		    }

			@Override
			@Transactional
		    public Long count() {
		        return donationDAO.count();
			
		    }
			
}
