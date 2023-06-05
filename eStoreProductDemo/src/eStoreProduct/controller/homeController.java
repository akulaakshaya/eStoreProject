package eStoreProduct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHome(Model model) {
		System.out.println("Home Page");
		model.addAttribute("fl", flag);

		// call the view
		return "home";
	}

	@RequestMapping(value = "/loggedIn", method = RequestMethod.GET)
	public String getHomeLogged(Model model) {
		System.out.println("Home Page");

		flag = true;
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

	@RequestMapping(value = "/signOk", method = RequestMethod.GET)
	public String getHomeFinal(@RequestParam("em") String email, @RequestParam("ps") String psd, Model model,
			HttpSession session) {
		System.out.println("checking sign in");
		custCredModel cust = cdao.getCustomer(email, psd);
		// custCredModel b = cdao.checkCustomer(email, psd);
		System.out.println("checking sign in 1");
		cdao.updatelastlogin(cust.getCustId());
		System.out.println("checking sign in 2");
		if (cust != null) {
			session.setAttribute("customer", cust); // Store customer object in the session
			flag = true;
		}

		model.addAttribute("fl", flag);
		return "home";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPswd(Model model) {
		System.out.println("mail forget Page");
		// emailSend es = new emailSend();
		// es.sendEmail("akshayavarma39@gmail.com");
		// // call the view
		return "forgotPage";
	}

	@RequestMapping(value = "/otpAction", method = RequestMethod.GET)
	public String sendOTP(Model model) {
		System.out.println("otp");
		emailSend es = new emailSend();
		es.sendEmail("akshayavarma39@gmail.com");
		// call the view
		return "forgotPage";
	}

	// On clicking my profile should display profile.jsp

	@RequestMapping(value = "/profilePage")
	public String sendProfilePage(Model model, HttpSession session) {
		custCredModel cust = (custCredModel) session.getAttribute("customer");
		System.out.println(cust.getCustId());
		model.addAttribute("cust", cust);
		return "profile";
	}

	// on clicking update Profile in profile page
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String userupdate(@ModelAttribute("Customer") custCredModel cust, Model model, HttpSession session) {
		cdao.updatecustomer(cust);
		custCredModel custt = cdao.getCustomerById(cust.getCustId());
		System.out.print(custt.getCustLocation());
		if (custt != null) {
			model.addAttribute("cust", custt);
		}
		return "profile";
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

	@RequestMapping(value = "/logout")
	public String userlogout(Model model, HttpSession session) {
		custCredModel cust = (custCredModel) session.getAttribute("customer");
		model.addAttribute("cust", cust);
		flag = false;
		model.addAttribute("fl", flag);

		return "home";
	}

}