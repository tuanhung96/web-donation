package springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query to get users
		Query<User> theQuery = currentSession.createQuery("from User", User.class);
		
		// execute query and get result list
		List<User> users = theQuery.getResultList();
	
		return users;
	}

	@Override
	public void saveUser(User theUser) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save the user to db
		currentSession.saveOrUpdate(theUser);
		
	}

	@Override
	public void deleteUser(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();
	}

	@Override
	public User getUser(int theId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// now retrieve/read form db using the primary key
		User user = currentSession.get(User.class, theId);

		return user;
	}
	

}
