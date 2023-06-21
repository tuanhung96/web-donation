package springdemo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springdemo.entity.Donation;
import springdemo.entity.Role;
import springdemo.entity.User;
import springdemo.entity.UserDonation;
import springdemo.service.DonationService;
import springdemo.service.UserDonationService;
import springdemo.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserService userService;

	@Autowired
	private DonationService donationService;

	@Autowired
	private UserDonationService userDonationService;

	@GetMapping("/home")
	public String adminHome(Model theModel) {
		return "admin/home";
	}

	@GetMapping("/detail")
	public String adminDetail(@RequestParam("donationId") int donationId, Model theModel) {
		// get donation by id
		Donation donation = donationService.getDonation(donationId);
		theModel.addAttribute("donation", donation);

		// get all userDonations
		List<UserDonation> userDonations = userDonationService.getUserDonations(donationId);
		theModel.addAttribute("userDonations", userDonations);
		
		return "admin/detail";
	}

	@RequestMapping("/login")
	public String login(Model theModel) {
		return "admin/login";
	}

	@GetMapping("/account")
	public String account(Model theModel, HttpServletRequest request) {
		// get users from service
		List<User> theUsers = userService.getUsers();

		// add users to the Model
		theModel.addAttribute("users", theUsers);

		// set attribute addUserSuccess and check if add user successfully or not
		theModel.addAttribute("addUserSuccess", request.getParameter("addUserSuccess"));
		return "admin/account";
	}

	@PostMapping("/addUser")
	public String addUser(Model theModel,
			@RequestParam("fullName") String fullName,
			@RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("address") String address,
			@RequestParam("userName") String userName,
			@RequestParam("password") String password,
			@RequestParam("roleId") int roleId) {

		// create role for this user
		Role role = new Role();
		role.setId(roleId);
		
		// set status = 1 : Hoạt động
		int status = 1;
		
		// create user and save to database
		User user = new User(fullName, email, phoneNumber, address, userName, password, status, role);
		userService.saveUser(user);

		// set attribute addUserSuccess
		theModel.addAttribute("addUserSuccess", "Successfully");
		
		return "redirect:/admin/account";
	}

	@PostMapping("/delete")
	public String deleteUser(@RequestParam("userId") int theId) {
		userService.deleteUser(theId);
		return "redirect:/admin/account";
	}

	@PostMapping("/lock")
	public String lockUser(@RequestParam("userId") int theId) {
		// get user by id
		User user = userService.getUser(theId);
		
		// set status = 2 : Khóa
		user.setStatus(2);
		
		// update user in database
		userService.saveUser(user);
		
		return "redirect:/admin/account";
	}

	@PostMapping("/unlock")
	public String unlockUser(@RequestParam("userId") int theId) {
		// get user by id
		User user = userService.getUser(theId);
		
		// set status = 2 : Hoạt động
		user.setStatus(1);
		
		// update user in database
		userService.saveUser(user);
		
		return "redirect:/admin/account";
	}

	@GetMapping("/updateUser")
	public String updateUser(@RequestParam("userId") int userId,
			@RequestParam("fullName") String fullName,
			@RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("address") String address,
			@RequestParam("userName") String userName,
			@RequestParam("password") String password,
			@RequestParam("status") int status,
			@RequestParam("roleId") int roleId) {

		// create role for this user
		Role role = new Role();
		role.setId(roleId);
		
		// create user
		User user = new User(fullName, email, phoneNumber, address, userName, password, status, role);
		user.setId(userId);
		
		// update user in database
		userService.saveUser(user);

		return "redirect:/admin/account";
	}

	@GetMapping("/donation")
	public String donation(Model theModel, HttpServletRequest request) {
		// get users from service
		List<Donation> donations = donationService.getDonations();

		// add users to the Model
		theModel.addAttribute("donations", donations);

		// set attribute addDonationSuccess and check if add donation successfully or not
		theModel.addAttribute("addDonationSuccess", request.getParameter("addDonationSuccess"));
		
		return "admin/donation";
	}

	@PostMapping("/addDonation")
	public String addDonation(Model theModel,
			@RequestParam("code") String code,
			@RequestParam("name") String name,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("organizationName") String organizationName,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("description") String description) {

		// set money = 0 when create donation
		int money = 0;
		
		// set status = 1 : Mới tạo
		int status = 1;
		
		// create donation and save to database
		Donation donation = new Donation(code, name, startDate, endDate, organizationName, phoneNumber, money, status, description);
		donationService.saveDonation(donation);

		// set attribute addDonationSuccess
		theModel.addAttribute("addDonationSuccess", "Successfully");
		
		return "redirect:/admin/donation";
	}

	@PostMapping("/deleteDonation")
	public String deleteDonation(@RequestParam("donationId") int theId) {
		donationService.deleteDonation(theId);
		return "redirect:/admin/donation";
	}

	@PostMapping("/updateDonation")
	public String updateDonation(@RequestParam("donationId") int theId,
			@RequestParam("code") String code,
			@RequestParam("name") String name,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("organizationName") String organizationName,
			@RequestParam("phoneNumber") String phoneNumber, 
			@RequestParam("money") int money,
			@RequestParam("status") int status,
			@RequestParam("description") String description) {

		// create donation
		Donation donation = new Donation(code, name, startDate, endDate, organizationName, phoneNumber, money, status, description);
		donation.setId(theId);
		
		// update donation in database
		donationService.saveDonation(donation);
		
		return "redirect:/admin/donation";
	}

	@PostMapping("/statusToDonate")
	public String statusToDonate(@RequestParam("donationId") int theId) {
		// get donation by id
		Donation donation = donationService.getDonation(theId);
		
		// set status = 2 : Đang quyên góp
		donation.setStatus(2);
		
		// update donation in database
		donationService.saveDonation(donation);
		
		return "redirect:/admin/donation";
	}

	@PostMapping("/statusToFinish")
	public String statusToFinish(@RequestParam("donationId") int theId) {
		// get donation by id
		Donation donation = donationService.getDonation(theId);
		
		// set status = 3 : Kết thúc quyên góp
		donation.setStatus(3);
		
		// update donation in database
		donationService.saveDonation(donation);
		
		return "redirect:/admin/donation";
	}

	@PostMapping("/statusToClose")
	public String statusToClose(@RequestParam("donationId") int theId) {
		// get donation by id
		Donation donation = donationService.getDonation(theId);
		
		// set status = 4 : Đóng quyên góp
		donation.setStatus(4);
		
		// update donation in database
		donationService.saveDonation(donation);
		
		return "redirect:/admin/donation";
	}

	@PostMapping("confirmUserDonation")
	public String confirmUserDonation(@RequestParam("userDonationId") int userDonationId,
			@RequestParam("donationId") int donationId) {
		
		// get userDonation by id
		UserDonation userDonation = userDonationService.getUserDonation(userDonationId);
		
		// set status = 1 : Đã xác nhận
		userDonation.setStatus(1);
		
		// update donation in database
		userDonationService.saveUserDonation(userDonation);
		
		// get donation by id
		Donation donation = donationService.getDonation(donationId);

		// caculate totalMoney and set money of this donation
		int totalMoney = donation.getMoney() + userDonation.getMoney();
		donation.setMoney(totalMoney);
		
		// update donation in database
		donationService.saveDonation(donation);

		return "redirect:/admin/detail?donationId=" + donationId;
	}

	@PostMapping("unconfirmUserDonation")
	public String unconfirmUserDonation(@RequestParam("userDonationId") int userDonationId,
			@RequestParam("donationId") int donationId) {
		
		// get userDonation by id
		UserDonation userDonation = userDonationService.getUserDonation(userDonationId);
		
		// set status = 3 : Hủy xác nhận
		userDonation.setStatus(3);
		
		// update donation in database
		userDonationService.saveUserDonation(userDonation);

		return "redirect:/admin/detail?donationId=" + donationId;
	}

}
