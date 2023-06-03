package asm1.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import asm1.spring.entity.UserDonation;

@Repository
public class UserDonationDAOImpl implements UserDonationDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<UserDonation> getUserDonations() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query
		Query<UserDonation> theQuery = 
				currentSession.createQuery("from UserDonation",
											UserDonation.class);
		
		// execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();
				
		// return the results		
		return userDonations;
	}

	@Override
	public void saveUserDonation(UserDonation theUserDonation) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the user donation ... finally LOL
		currentSession.saveOrUpdate(theUserDonation);

	}

	@Override
	public UserDonation getUserDonationById(int id) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		UserDonation theUserDonation = currentSession.get(UserDonation.class, id);
		
		return theUserDonation;
	}

	@Override
	public void deleteUserDonation(int id) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from UserDonation where id=:id");
		theQuery.setParameter("id", id);
		
		theQuery.executeUpdate();	

	}

	@Override
	public List<UserDonation> getListUserDonationById(int id) {
		// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
						
				// create a query  ... sort by date
				Query<UserDonation> theQuery = 
						currentSession.createQuery("from UserDonation where donationid=:id order by date desc",
													UserDonation.class);
				theQuery.setParameter("id", id);
				
				// execute query and get result list
				List<UserDonation> userDonations = theQuery.getResultList();
						
				// return the results		
				return userDonations;
								
				
				
	}

}
