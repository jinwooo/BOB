package com.bob.proj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bob.proj.api.FileValidator;
import com.bob.proj.api.Imgvision;
import com.bob.proj.api.Ttest;
import com.bob.proj.api.foodApi;
import com.bob.proj.model.dto.FoodApiDto;
import com.bob.proj.model.dto.ImgVisionDto;

@Controller
public class HomeController {
	
	@Autowired
	private Ttest test;
	
	@Autowired
	private FileValidator FileValidator;
	
	@Autowired
	private foodApi foodApi;
	
	@Autowired
	private Imgvision vision;
	
	@RequestMapping("/main.do")
	public String home() {		
		return "addr";
	}
	
	@RequestMapping("/food.do")
	public String food(Model model, String food) {
		
		
		List<FoodApiDto> list;
		try {
			list = foodApi.FoodSearch(food);
			model.addAttribute("list", list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		
		return "foodsearch";
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

	 @RequestMapping("/imgvision.do")
	 	public String imgVS(HttpServletRequest request,MultipartFile filevi ,Model model,String imgname) {
	 		
			String filename = filevi.getOriginalFilename();
			
			InputStream inputStream = null;
			OutputStream outputStream = null;
			
			try {
				inputStream = filevi.getInputStream();
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
				System.out.println("���ε� �� ���� ��� : " + path);
							
				File storage = new File(path);
				
				if(!storage.exists()) {
					storage.mkdirs();
				}
				
				File newfile = new File(path+"/"+filename);
				if(!newfile.exists()) {
					newfile.createNewFile();
				}
				
				outputStream = new FileOutputStream(newfile);
				
				int read= 0;
				byte[] b = new byte[(int)filevi.getSize()];
				
				while((read=inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}
				
				String root = path+"/"+filename;
				System.out.println(root);
			
				List<ImgVisionDto> list = vision.detectWebDetections(root);
				
				model.addAttribute("vision", list);
				
			} catch (IOException e) {

				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			
			
			
	 		
	 		return "addr_res";
	 	}
	 
	 @RequestMapping("/tandanji.do")
	 public String tandanji(Model model,String foodname){
		 
		 try {
			String foodname2 =  foodname.replace(" ", "");
			System.out.println(foodname2);
			List<FoodApiDto> list = foodApi.FoodSearch(foodname2);
			
			
			model.addAttribute("list",list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 
		 
		 return "addr_res2";
	 }

	
	
}
