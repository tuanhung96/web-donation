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
import springdemo.entity.UserDonation;
import springdemo.service.DonationService;
import springdemo.service.UserDonationService;

@Controller
@RequestMapping("/public")
public class PublicController {
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;

	@GetMapping("/home") 
	public String home(Model theModel, HttpServletRequest request) {
		
		// get parameter "page"
		String page = request.getParameter("page");
		
		// set pageNumber that is choosen and add attribute
		int pageNumber;
		if(page == null) {
			pageNumber = 1;
		} else {
			pageNumber = Integer.parseInt(page);
		}
		theModel.addAttribute("pageNumber", pageNumber);
		
		// caculate totalPage and set attribute
		int totalDonation = donationService.getTotalDonation();
		int totalPage = totalDonation%5==0 ? totalDonation/5 : totalDonation/5+1;
		theModel.addAttribute("totalPage", totalPage);
		
		// caculate start position to get Donation in database and get donations
		int start = (pageNumber-1)*5;
		List<Donation> donations = donationService.getDonationsByPage(start);
		theModel.addAttribute("donations", donations);
		
		// set attribute donateSuccess and check if donate successfully or not
		theModel.addAttribute("donateSuccess", request.getParameter("donateSuccess"));
		
		return "public/home";
	}
	
	@GetMapping("/detail") 
	public String detail(@RequestParam("donationId") int donationId, Model theModel, HttpServletRequest request) {
		
		// get donation by id
		Donation donation = donationService.getDonation(donationId);
		theModel.addAttribute("donation", donation);
		
		// get user donate successfully
		List<UserDonation> successfullUserDonations = userDonationService.getSuccessfullUserDonations(donationId);
		theModel.addAttribute("successfullUserDonations", successfullUserDonations);
		
		// set attribute donateSuccess and check if donate successfully or not
		theModel.addAttribute("donateSuccess", request.getParameter("donateSuccess"));
		
		return "public/detail";
	}
	
     @PostMapping("addUserDonation")
     public String addUserDonation(Model theModel,
    		 @RequestParam("name") String name,
    		 @RequestParam("money") int money,
    		 @RequestParam("message") String message,
    		 @RequestParam("donationId") int donationId) {
    	 
    	 // set status = 2 : chờ xác nhận
    	 int status = 2;
    	 String date = java.time.LocalDate.now().toString();
    	 
    	 // create donation for this userDonation
    	 Donation donation = new Donation();
    	 donation.setId(donationId);
    	 
    	 // create userDonation and save to database
    	 UserDonation userDonation = new UserDonation(name,money,date,message,status,donation,null);
    	 userDonationService.saveUserDonation(userDonation);
    	 
    	 // set attribute donateSuccess
    	 theModel.addAttribute("donateSuccess", "DonateSuccessfully");

    	 return "redirect:/public/home";
     }
	
}
