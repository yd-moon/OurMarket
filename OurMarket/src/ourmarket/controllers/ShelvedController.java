package ourmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShelvedController {
	@RequestMapping("shelved")
	public String index(){
		return "shelved";
	}
}
