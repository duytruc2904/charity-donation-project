package asm1.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm1.spring.entity.Donation;
import asm1.spring.entity.User;
import asm1.spring.entity.UserDonation;
import asm1.spring.service.DonationService;
import asm1.spring.service.UserDonationService;
import asm1.spring.service.UserService;
import asm1.spring.model.CheckInfomation;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
//	User ---------------------------------------------------------
	@RequestMapping("/account")
	public String account(Model theModel) {
		List<User> theUser = userService.getUsers();
		theModel.addAttribute("list", theUser);	       
		
		return "admin/account";
	}
	
//	Add User ------------------------------------------------------------------
	@RequestMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser, Model model) {
		userService.saveUser(theUser);		
		
//		popup add user successfully
		model.addAttribute("success", "1");		
		
		return "redirect:/admin/account/";
	}	
	
//	Update User ------------------------------------------------------------------
	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User theUser) {
		userService.saveUser(theUser);		

		return "redirect:/admin/account/";
	}
	
//	LockUser ----------------------------------------------------------
//	Change status = 0
	@PostMapping("/lockUser")
    public String lockUser(@RequestParam("idUser") int userId) {
        User user = userService.getUserById(userId);
        user.setStatus(0);
        
        userService.saveUser(user);

        return "redirect:/admin/account"; 
    }

//	LockUser ----------------------------------------------------------
//	Change status = 1
    @PostMapping("/unlockUser")
    public String unlockUser(@RequestParam("idUser") int userId) {
        User user = userService.getUserById(userId);
        user.setStatus(1); 

        userService.saveUser(user); 

        return "redirect:/admin/account";
    }
    
//    Delete User------------------------------------------------------
    @RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("idUser") int theId) {
		userService.deleteUser(theId);
		
		return "redirect:/admin/account";
	}

    
   
//    Donation ---------------------------------------------------------
//    Get Donation -----------------------------------------------------
	@RequestMapping("/donation")
	public String donation(Model theModel) {
		List<Donation> theDonation = donationService.getDonations();
		theModel.addAttribute("list", theDonation);	       
					
		return "admin/donation";
	}
	
//	Save Donation ---------------------------------------------------------
	@PostMapping("/saveDonation")
	public String saveDonation(@ModelAttribute("donation") Donation theDonation, Model model) {
		donationService.saveDonation(theDonation);	
		
//		popup add user successfully
		model.addAttribute("success", "1");
		
		return "redirect:/admin/donation";
	}
	
//	Update Donation ---------------------------------------------------------
	@PostMapping("/updateDonation")
	public String updateDonation(@ModelAttribute("donation") Donation theDonation, Model model) {
		donationService.saveDonation(theDonation);	
		
		return "redirect:/admin/donation";
	}
	
//	Delete Donation ---------------------------------------------------------
	 @RequestMapping("/deleteDonation")
		public String deleteDonation(@RequestParam("idDonation") int theId) {
			donationService.deleteDonation(theId);
			
			return "redirect:/admin/donation";
		}
	

	 
//	 Change status donation -----------------------------------------------
//	 Created(status=0), Donating(status=1), Finished(status=2), Closed(status=3)
	 @PostMapping("/updateStatusDonation")
		public String updateStatusDonation(@RequestParam("status") int theStatus, @RequestParam("id") int theId) {
			Donation theDonation = donationService.getDonationById(theId);	
			
			theDonation.setStatus(theStatus);		
			donationService.saveDonation(theDonation);
		
			return "redirect:/admin/donation";
		}
	
	
	
	
//	Detail -----------------------------------------------------------------------
//	 Get Detail---------------------------------------------------
	 @RequestMapping(value="/detail", method = RequestMethod.GET)
	 public String detail(@RequestParam("id") int id, Model model) {
		 Donation theDonation = donationService.getDonationById(id);
		 model.addAttribute("donation", theDonation);
		 
		 List<UserDonation> userDonations = userDonationService.getListUserDonationById(id);
		 model.addAttribute("userdonations", userDonations);
	     
	     return "admin/detail";
	 }

//	 Confirm Donation ------------------------------------------------------
//	 Change status = 1
//	 Change money -> add money form user donate
	 @RequestMapping("/confirmdonation")
	 public String confirmDonation(@RequestParam("id") int id) {
		 UserDonation userDonation = userDonationService.getUserDonationById(id);
		 userDonation.setStatus(1);
		 userDonationService.saveUserDonation(userDonation);
		 
		 Donation donation = donationService.getDonationById(userDonation.getDonationId());
		 int money = donation.getMoney() + userDonation.getMoney();
		 donation.setMoney(money);
		 donationService.saveDonation(donation);
		 
		 String url = "/admin/detail?id=" + donation.getId();
	     return "redirect:" + url;
	 }
	
	
//	Login -------------------------------------------------------
	@RequestMapping("/login")
	public String login() {	
		return "admin/login";
	}
	
//	Check login
	@RequestMapping("checklogin")
	public String checkLogin(@RequestParam("email") String email, @RequestParam("password") String password, Model model) {
		List<User> users = userService.getUsers();
		CheckInfomation check = new CheckInfomation();
		if (!check.checkLogin(users, email, password)) {
			model.addAttribute("error", true);
			return "forward:/admin/login";
		}
		
		return "redirect:/admin/account";
	}
	
	
	
	
	
}
