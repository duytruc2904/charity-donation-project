package asm1.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import asm1.spring.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{
	// need to inject the session factory
		@Autowired
		private SessionFactory sessionFactory;
				
		@Override
//		@Transactional
		public List<User> getUsers() {
			
			// get the current hibernate session
			Session currentSession = sessionFactory.getCurrentSession();
					
			// create a query 
			Query<User> theQuery = 
					currentSession.createQuery("from User",
												User.class);
			
			// execute query and get result list
			List<User> users = theQuery.getResultList();
					
			// return the results		
			return users;
		}
		
		@Override
		public void saveUser(User theUser) {
			System.out.println(theUser.getId());

			// get current hibernate session
			Session currentSession = sessionFactory.getCurrentSession();
			
			// save/upate the user ... finally LOL
			currentSession.saveOrUpdate(theUser);
			
		}
		
		@Override
		public User getUserById(int userId) {
			// get the current hibernate session
			Session currentSession = sessionFactory.getCurrentSession();
			
			// now retrieve/read from database using the primary key
			User theUser = currentSession.get(User.class, userId);
			
			return theUser;
		}

		@Override
		public void deleteUser(int theId) {
			// get the current hibernate session
			Session currentSession = sessionFactory.getCurrentSession();
			
			// delete object with primary key
			Query theQuery = 
					currentSession.createQuery("delete from User where id=:id");
			theQuery.setParameter("id", theId);
			
			theQuery.executeUpdate();		
			
		}
		
		
		
}
