package ourmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoodsPutaway {
	@RequestMapping("goodsPutaway")
	public String index(){
		return "goodsPutaway";
	}
}