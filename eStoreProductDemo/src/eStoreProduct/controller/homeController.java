package eStoreProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import eStoreProduct.DAO.customerDAO;
import eStoreProduct.model.custCredModel;
import eStoreProduct.model.emailSend;

@Controller
public class homeController {
	static boolean flag = false;

	customerDAO cdao;

	@Autowired
	public homeController(customerDAO customerdao) {
		cdao = customerdao;
	}

	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String getHome(Model model) {
		System.out.println("Home Page");
		model.addAttribute("fl", flag);

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

	@RequestMapping(value = "/signOk", method = RequestMethod.POST)
	public String getHomeFinal(@Validated custCredModel ccm, Model model) {
		System.out.println("checking sign in");
		custCredModel b = cdao.checkCustomer(ccm.getCustName(), ccm.getCustPassword());
		if (b != null) {
			model.addAttribute("customer", ccm);
		}
		boolean flag = true;
		model.addAttribute("fl", flag);
		// call the view
		return "home";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPswd(Model model) {
		System.out.println("mail forget Page");
		emailSend es = new emailSend();
		es.sendEmail("akshayavarma39@gmail.com");
		// call the view
		return "signIn";
	}

	@RequestMapping(value = "/signInCreateAccount", method = RequestMethod.POST)
	public String createAccount(@Validated custCredModel ccm, Model model) {
		System.out.println("sign Up page creating account");
		boolean b = cdao.createCustomer(ccm);

		// set it to the model
		if (b) {
			model.addAttribute("customer", ccm);
		}
		// call the view
		return "createdMsg";
	}
}