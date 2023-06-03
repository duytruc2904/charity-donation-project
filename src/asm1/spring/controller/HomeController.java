package asm1.spring.controller;

import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

@Controller
@RequestMapping("/public")
public class HomeController {
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;

	
//	Home Donation -----------------------------------------------------------------------------------------------------
//	Get Donatio, using nagigation
	@RequestMapping(value = "/home", method = RequestMethod.GET )
	public String homeController(Model model, @RequestParam(defaultValue = "0", name = "offset") Integer offset, @RequestParam(defaultValue = "5", name = "maxResults") Integer maxResults) {
	    List<Donation> list = donationService.findAll(offset, maxResults);
	    model.addAttribute("list", list);
	    model.addAttribute("count", donationService.count());
	    model.addAttribute("offset", offset);
	    model.addAttribute("maxResults", maxResults);

	    return "public/home";
	}
		
//	Save User Donate--------------------------------------------------
//	Create Model Attribute success ---------------------------------------------------
	@RequestMapping("/saveUserDonation")
	public String saveUser(@ModelAttribute("userdonation") UserDonation theUserDonation, RedirectAttributes redirectAttributes) {
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(currentDate);
		theUserDonation.setDate(formattedDate);	
		
		userDonationService.saveUserDonation(theUserDonation);	
		
		redirectAttributes.addFlashAttribute("msg", "success");
		
		return "redirect:/public/home";
	}
	
//	Save User Donate at detail page
	@RequestMapping("/saveUserDonationdetail")
	public String saveUserDonation(@ModelAttribute("userdonation") UserDonation theUserDonation, RedirectAttributes redirectAttributes) {
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(currentDate);
		theUserDonation.setDate(formattedDate);	
		
		userDonationService.saveUserDonation(theUserDonation);	
		
		redirectAttributes.addFlashAttribute("msg", "success");
		String url = "/public/detail?id=" + theUserDonation.getDonationId();
		return "redirect:" + url;
		
	}

	
//	Detail --------------------------------------------------------------
//	Get User Donate ---------------------------------------------------------------
	 @RequestMapping(value="/detail", method = RequestMethod.GET)
	 public String detail(@RequestParam("id") int id, Model model) {
		 Donation theDonation = donationService.getDonationById(id);		 
		 model.addAttribute("donation", theDonation);
		 
		 List<UserDonation> userDonations = userDonationService.getListUserDonationById(id);
		 model.addAttribute("userdonations", userDonations);
	
	     return "public/detail";
	 }
	
	
}
