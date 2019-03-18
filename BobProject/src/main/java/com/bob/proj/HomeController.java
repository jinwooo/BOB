package com.bob.proj;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.bob.biz.BobBiz;
import com.bob.proj.dto.BobDto;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping("/join.do")
	public String joinForm() {
		return "join";
	}
	
	
/*	@RequestMapping("/join.do")
	public String Bob(HttpServletRequest request, Model model, BobDto bobdto) {
		
		
		BobDto fileobj = new BobDto();
		
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
			System.out.println("업로드 될 실제 경로 :" +path);
		
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdirs();
			}
			File newfile = new File(path+"/"+);
		} catch (FileNotFoundException e) {
			
		}
		
		
		return "join";
	}
	*/
	
	@RequestMapping("/login.do")
	public String loginForm() {
		return "login";
	}
	
	/*@RequestMapping("/loginajax.do")
	@ResponseBody
	public Map<String, Boolean> login(String id,@RequestParam("pw") String password, HttpSession session){
		
		BobDto dto = biz.login(id,password);
		boolean loginchk = false;
		if(dto != null) {
			session.setAttribute("dto", dto);
			loginchk = true;
		}
		Map<String,Boolean> res = new HashMap<String, Boolean>();
		res.put("loginchk", loginchk);
		return res;
		
	}*/
	@RequestMapping("findInfo.do")
	public String findInfoForm() {
		return "findInfo";
	}
}
