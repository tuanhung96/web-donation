package springdemo.service;

import java.util.List;
import springdemo.entity.Donation;

public interface DonationService {
	public List<Donation> getDonations();

	public void saveDonation(Donation donation);

	public void deleteDonation(int theId);

	public Donation getDonation(int theId);

	public List<Donation> getDonationsByPage(int start);

	public int getTotalDonation();

}
