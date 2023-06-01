package eStoreProduct.controller;
import eStoreProduct.model.emailSend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHome(Model model) {
		System.out.println("Home Page");

		// call the view
		return "home";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String getSignUpPage(Model model) {
		System.out.println("Sign Up Page");

		// call the view
		return "signUp";
	}
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String getSignInPage(Model model) {
		System.out.println("Sign In Page");

		// call the view
		return "signIn";
	}
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPswd(Model model) {
		System.out.println("mail forget Page");
		emailSend es=new emailSend();
		es.sendEmail();
		// call the view
		return "signIn";
	}
}