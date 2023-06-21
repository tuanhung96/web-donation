package springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springdemo.dao.UserDonationDAO;
import springdemo.entity.UserDonation;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	@Autowired
	private UserDonationDAO userDonationDAO;

	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int theId) {
		return userDonationDAO.getUserDonations(theId);
	}

	@Override
	@Transactional
	public void saveUserDonation(UserDonation userDonation) {
		userDonationDAO.saveUserDonation(userDonation);
		
	}

	@Override
	@Transactional
	public UserDonation getUserDonation(int theId) {
		return userDonationDAO.getUserDonation(theId);
	}

	@Override
	@Transactional
	public List<UserDonation> getSuccessfullUserDonations(int donationId) {
		return userDonationDAO.getSuccessfullUserDonations(donationId);
	}

}
