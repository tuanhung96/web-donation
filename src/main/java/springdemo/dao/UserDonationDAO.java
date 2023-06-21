package springdemo.dao;

import java.util.List;

import springdemo.entity.UserDonation;

public interface UserDonationDAO {

	List<UserDonation> getUserDonations(int theId);

	void saveUserDonation(UserDonation userDonation);

	UserDonation getUserDonation(int theId);

	List<UserDonation> getSuccessfullUserDonations(int donationId);

}
