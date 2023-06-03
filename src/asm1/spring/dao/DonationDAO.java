package asm1.spring.dao;

import java.util.List;

import asm1.spring.entity.Donation;


public interface DonationDAO {
	public List<Donation> getDonations();
	
	public void saveDonation(Donation theDonation);

	public Donation getDonationById(int id);

	public void deleteDonation(int id);
	
	public List<Donation> findAll(Integer offset, Integer maxResult);
    public Long count();
}
