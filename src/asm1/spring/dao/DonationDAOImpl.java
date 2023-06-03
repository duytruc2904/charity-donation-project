package asm1.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import asm1.spring.entity.Donation;

@Repository
public class DonationDAOImpl implements DonationDAO {
			@Autowired
			private SessionFactory sessionFactory;
					
			@Override
			public List<Donation> getDonations() {
				
				// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
						
				// create a query
				Query<Donation> theQuery = 
						currentSession.createQuery("from Donation",
													Donation.class);
				
				// execute query and get result list
				List<Donation> donations = theQuery.getResultList();
						
				// return the results		
				return donations;
			}
			
			@Override
			public void saveDonation(Donation theDonation) {

				// get current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// save/upate the donation ... finally LOL
				currentSession.saveOrUpdate(theDonation);
				
			}
			
			@Override
			public Donation getDonationById(int id) {
				// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// now retrieve/read from database using the primary key
				Donation theDonation = currentSession.get(Donation.class, id);
				
				return theDonation;
			}

			@Override
			public void deleteDonation(int theId) {
				// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// delete object with primary key
				Query theQuery = 
						currentSession.createQuery("delete from Donation where id=:id");
				theQuery.setParameter("id", theId);
				
				theQuery.executeUpdate();		
				
			}
	
			@Override
			@SuppressWarnings("unchecked")
		    public List<Donation> findAll(Integer offset, Integer maxResults) {
		        return sessionFactory.openSession()
		                .createCriteria(Donation.class)
		                .setFirstResult(offset!=null?offset:0)
		                .setMaxResults(maxResults!=null?maxResults:5)
		                .list();
		    }

			@Override
		    @SuppressWarnings("unchecked")
		    public Long count() {
		        return (Long)sessionFactory.openSession()
		                .createCriteria(Donation.class)
		                .setProjection(Projections.rowCount())
		                .uniqueResult();
		    }

}
