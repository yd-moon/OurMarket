package ourmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class OrderManageController {
	@RequestMapping("orderManage")
	public String index(){
		return "orderManage";
	}
}