package eStoreProduct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {
		System.out.println("Employees List JSP Requested");

		// call the view
		return "home";
	}
}
