package com.bob.proj;

import java.io.File;
<<<<<<< HEAD
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
=======
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
>>>>>>> refs/remotes/origin/master
import java.util.Locale;
<<<<<<< HEAD
import java.util.Map;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
=======
import java.io.IOException;
>>>>>>> refs/remotes/origin/master

<<<<<<< HEAD
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
=======
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
>>>>>>> refs/remotes/origin/master
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestBody;
=======
>>>>>>> refs/remotes/origin/master
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
=======
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
>>>>>>> refs/remotes/origin/master
import org.springframework.web.util.WebUtils;

<<<<<<< HEAD
import com.bob.biz.BobBiz;
import com.bob.proj.dto.BobDto;

=======
import com.bob.proj.api.FileValidator;
import com.bob.proj.api.Imgvision;
import com.bob.proj.api.TransApi;
import com.bob.proj.api.foodApi;
import com.bob.proj.model.dto.FoodApiDto;
import com.bob.proj.model.dto.ImgVisionDto;
import com.bob.proj.model.biz.NoticeBiz;
import com.bob.proj.model.dto.NoticeDto;
>>>>>>> refs/remotes/origin/master

@Controller
public class HomeController {
	
	@Autowired
	private TransApi test;
	
	@Autowired
	private FileValidator FileValidator;
	
	@Autowired
	private foodApi foodApi;
	
	@Autowired
	private Imgvision vision;
	private NoticeBiz biz;
	
	private String res = "";

	
	@RequestMapping("/main.do")
	public String home() {		
		return "addr";
	}
	
<<<<<<< HEAD
	
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
			System.out.println("���ε� �� ���� ��� :" +path);
		
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
=======
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
	 

	 @RequestMapping(value = "crawling.do")
		public String crawling(Model model) throws IOException {
			
			String url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query="+res;
			//String url ="https://weather.naver.com/rgn/cityWetrMain.nhn";
			
			Document doc = Jsoup.connect(url).get();
			//System.out.println(doc.toString());

			//Elements elem = doc.select(".tbl_weather tbody>tr:nth-child(1) img"); //날씨
			
			//Elements elem = doc.select("img._img"); //피자전체 검색결과
			//Elements elem1 = doc.select("img._img:nth-child(1)"); //첫번째피자 검색결과
			Elements elem1 = doc.select("._box>div>a>img"); //첫번째피자 검색결과
			Elements elem2 = doc.select("._box>div:nth-child(2)>a>img"); //첫번째피자 검색결과
			Elements elem3 = doc.select("._box>div:nth-child(3)>a>img"); //첫번째피자 검색결과
			Elements elem4 = doc.select("._box>div:nth-child(4)>a>img"); //첫번째피자 검색결과
			Elements elem5 = doc.select("._box>div:nth-child(5)>a>img"); //첫번째피자 검색결과
			
			//System.out.println(elem2);//src url 
			
			String imgsrc1=elem1.attr("data-source");
			String imgsrc2=elem2.attr("data-source");
			String imgsrc3=elem3.attr("data-source");
			String imgsrc4=elem4.attr("data-source");
			String imgsrc5=elem5.attr("data-source");
			
//			String[] arr;
//			
//			for(int i=0; i<5; i++) {
//				arr[i] = 
//			}
			
			model.addAttribute("message1",imgsrc1);
			model.addAttribute("message2",imgsrc2);
			model.addAttribute("message3",imgsrc3);
			model.addAttribute("message4",imgsrc4);
			model.addAttribute("message5",imgsrc5);
			
			return "crawling";
		}
		
		@RequestMapping(value="/search.do", method=RequestMethod.POST)
		public String search(Model model, String name) throws IOException {
			
			res=name;
			
			return crawling(model);
		}
		
		@RequestMapping(value="/pay.do")
		public String pay() {
			return "pay";
		}
		
		@RequestMapping(value="/notice_list.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String noticelist(Model model) {
			model.addAttribute("noticelist",biz.selectList());
			return "notice_list";
		}
		
		@RequestMapping("/notice_insertform.do")
		public String notice_insertForm() {
			return "notice_insert";
		}
		
		@RequestMapping(value="/notice_insert.do", method=RequestMethod.POST)
		public String notice_insert(@ModelAttribute NoticeDto dto) {
			
			int res = biz.insert(dto);
			
			if(res>0) {
				return "redirect:notice_list.do";
			}else {
				return "redirect:notice_insertform.do";
			}
		}
		
		@RequestMapping(value="/notice_selectone.do")
		public String notice_selectone(Model model, int n_no) {
			
			NoticeDto dto = biz.selectOne(n_no);
			
			model.addAttribute("dto",dto);
			
			return "notice_selectone";
		}
		
		@RequestMapping(value="/notice_updateform.do")
		public String notice_updateform(Model model, int n_no) {
			
			NoticeDto dto = biz.selectOne(n_no);
			
			model.addAttribute("dto",dto);
			
			return "notice_update";
		}
		
		@RequestMapping(value="/notice_update.do")
		public String notice_update(@ModelAttribute NoticeDto dto) {
			
			int res = biz.update(dto);
			
			if(res>0) {
				return "redirect:notice_list.do";
			}else {
				return "redirect:notice_selectone.do";
			}
		}
		
		@RequestMapping(value="/notice_delete.do")
		public String notice_delete(int n_no) {
			
			System.out.println(n_no);
			
			int res = biz.delete(n_no);
			
			if(res>0) {
				return "redirect:notice_list.do";
			}else {
				return "redirect:notice_delete.do";
			}
		}
		
		@RequestMapping("/main2.do")
		public String main() {
			return "main";
		}
		@RequestMapping(value="/map.do", method={RequestMethod.GET, RequestMethod.POST})
		public String map() {		
			return "map";
		}

		@RequestMapping("/map_category.do")
		public String map_category() {
			return "map_category";
		}
		
		@RequestMapping("/map_search.do")
		public String map_search() {
			return "map_search";
		}
		
		@RequestMapping(value="/map_search.do", method=RequestMethod.GET)
		public String map_search(Model model, String foodselect) {
			System.out.println(foodselect);
			model.addAttribute("foodselect", foodselect);
			return "map_search";
		}	
		
		@RequestMapping("/chart01.do")
		public String chart01() {
			return "chart01";
		}
		
		@RequestMapping("/chart02.do")
		public String chart02() {
			return "chart02";
		}
		
		@RequestMapping("/chart03.do")
		public String chart03() {
			return "chart03";
		}
>>>>>>> refs/remotes/origin/master
}













