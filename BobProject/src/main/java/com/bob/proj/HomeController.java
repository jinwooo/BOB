package com.bob.proj;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bob.proj.api.Ttest;

@Controller
public class HomeController {
	
	@Autowired
	private Ttest test;
	

	
	@RequestMapping("/main.do")
	public String home() {		
		return "view";
	}
	
	
	 @RequestMapping("/trans.do")
	    public ModelAndView trans(@RequestParam(required=false) String text){
	        ModelAndView mav = new ModelAndView();
	        
	        if(text!= null){
	            mav.addObject("result", test.TranslateService(text));
	            
	        }
	        mav.setViewName("view"); 
	        return mav;
	    }


	
	
}
