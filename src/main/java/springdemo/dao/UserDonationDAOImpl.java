package springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.UserDonation;

@Repository
public class UserDonationDAOImpl implements UserDonationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<UserDonation> getUserDonations(int theId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query to get users
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id=:donationId", UserDonation.class);
		theQuery.setParameter("donationId", theId);
		
		// execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();
		
		return userDonations;
	}

	@Override
	public void saveUserDonation(UserDonation userDonation) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(userDonation);	
	}

	@Override
	public UserDonation getUserDonation(int theId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// get userDonation by id
		UserDonation userDonation = currentSession.get(UserDonation.class, theId);
		
		return userDonation;
	}

	@Override
	public List<UserDonation> getSuccessfullUserDonations(int donationId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query to get users
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id=:donationId and status=1", UserDonation.class);
		
		theQuery.setParameter("donationId", donationId);
		
		// execute query and get result list
		List<UserDonation> successfullUserDonations = theQuery.getResultList();
		
		return successfullUserDonations;
	}

}
