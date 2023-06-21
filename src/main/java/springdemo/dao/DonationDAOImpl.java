package springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.Donation;

@Repository
public class DonationDAOImpl implements DonationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Donation> getDonations() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query to get users
		Query<Donation> theQuery = currentSession.createQuery("from Donation", Donation.class);

		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
				
		return donations;
	}

	@Override
	public void saveOrUpdate(Donation donation) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save the donation to db
		currentSession.saveOrUpdate(donation);
		
	}

	@Override
	public void deleteDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Donation where id=:donationId");
		theQuery.setParameter("donationId", theId);
		theQuery.executeUpdate();
		
	}

	@Override
	public Donation getDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// get Donation by id
		Donation donation = currentSession.get(Donation.class, theId);
		return donation;
	}
	
	@Override
	public List<Donation> getDonationsByPage(int start) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query to get donations each page
		Query<Donation> theQuery = currentSession.createQuery("FROM Donation", Donation.class);
		theQuery.setFirstResult(start);
		theQuery.setMaxResults(5);
		
		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
				
		return donations;
	}

	@Override
	public int getTotalDonation() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query to total of donations
		Query theQuery = currentSession.createQuery(
				"SELECT count(*) FROM Donation");

		// get result and cast to int
		int result = ((Long) theQuery.getSingleResult()).intValue();
		
		return result;
	}

}
