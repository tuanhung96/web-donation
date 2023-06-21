package springdemo.dao;

import java.util.List;

import springdemo.entity.Donation;

public interface DonationDAO{
	public List<Donation> getDonations();

	public void saveOrUpdate(Donation donation);

	public void deleteDonation(int theId);

	public Donation getDonation(int theId);

	List<Donation> getDonationsByPage(int start);

	public int getTotalDonation();

}
