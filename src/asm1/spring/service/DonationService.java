package asm1.spring.service;

import java.util.List;

import asm1.spring.entity.Donation;


public interface DonationService {
	public List<Donation> getDonations();
	
	public void saveDonation(Donation theDonation);

	public Donation getDonationById(int id);

	public void deleteDonation(int theId);
	
	public List<Donation> findAll(Integer offset, Integer maxResult);
    public Long count();
}
