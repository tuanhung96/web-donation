package springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springdemo.dao.DonationDAO;
import springdemo.entity.Donation;

@Service
public class DonationServiceImpl implements DonationService {
	@Autowired
	private DonationDAO donationDAO;
	
	@Override
	@Transactional
	public List<Donation> getDonations() {
		return donationDAO.getDonations();
	}

	@Override
	@Transactional
	public void saveDonation(Donation donation) {
		donationDAO.saveOrUpdate(donation);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		donationDAO.deleteDonation(theId);	
	}

	@Override
	@Transactional
	public Donation getDonation(int theId) {
		return donationDAO.getDonation(theId);
	}

	@Override
	@Transactional
	public List<Donation> getDonationsByPage(int start) {
		return donationDAO.getDonationsByPage(start);
	}

	@Override
	@Transactional
	public int getTotalDonation() {
		return donationDAO.getTotalDonation();
	}

}
