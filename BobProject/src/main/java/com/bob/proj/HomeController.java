package com.bob.proj;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Authenticator;
import javax.mail.Multipart;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bob.proj.api.FileValidator;
import com.bob.proj.api.Imgvision;
import com.bob.proj.api.SMTPAuthenticator;
import com.bob.proj.api.TransApi;
import com.bob.proj.api.foodApi;
import com.bob.proj.model.dto.BobDto;
import com.bob.proj.model.dto.BobManagerDto;
import com.bob.proj.model.dto.ChatDto;
import com.bob.proj.model.dto.ChatUserDto;
import com.bob.proj.model.dto.FoodApiDto;
import com.bob.proj.model.dto.ImgVisionDto;
import com.bob.proj.model.biz.BobManagerBiz;
import com.bob.proj.model.biz.ChatBiz;
import com.bob.proj.model.biz.ChatRoomBiz;
import com.bob.proj.model.biz.ChatUserBiz;
import com.bob.proj.model.biz.NoticeBiz;
import com.bob.proj.model.biz.UserBoardBiz;
import com.bob.proj.model.dto.NoticeDto;
import com.bob.proj.model.dto.UserBoardDto;

@Controller
@SessionAttributes("user")
public class HomeController {

	@Autowired
	private TransApi test;
	@Autowired
	private FileValidator FileValidator;
	@Autowired
	private foodApi foodApi;
	@Autowired
	private Imgvision vision;

	@Autowired
	private NoticeBiz NoticeBiz;
	@Autowired
	private UserBoardBiz UserBiz;
	@Autowired
	private BobManagerBiz bobbiz;
	@Autowired
	private JavaMailSender mailSender;
	private String res = "";

	@Autowired
	private ChatBiz chatbiz;

	@Autowired
	private ChatUserBiz chatuserbiz;

	@Autowired
	private ChatRoomBiz chatroombiz;

	@RequestMapping("main3.do")
	public String main() {
		return "main3";
	}

	@RequestMapping("findInfo.do")
	public String findInfoForm() {
		return "findInfo";
	}

	@RequestMapping("tomain.do")
	public String tomain() {
		return "main_page";
	}

	@RequestMapping("addr.do")
	public String addr() {
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

	@RequestMapping("/manager.do")
	public String fooamanager() {
		return "chart_main";
	}

	@RequestMapping("/craw.do")
	public String craw() {
		return "crawling";
	}

	@RequestMapping("/trans.do")
	public ModelAndView trans(@RequestParam(required = false) String text) {
		ModelAndView mav = new ModelAndView();

		if (text != null) {
			mav.addObject("result", test.TranslateService(text));
		}
		mav.setViewName("view");
		return mav;
	}

	@RequestMapping("/imgvision.do")
	public String imgVS(HttpServletRequest request, MultipartFile filevi, Model model, String imgname) {

		String filename = filevi.getOriginalFilename();

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = filevi.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
			System.out.println("path : " + path);

			File storage = new File(path);

			if (!storage.exists()) {
				storage.mkdirs();
			}
			File newfile = new File(path + "/" + filename);
			if (!newfile.exists()) {
				newfile.createNewFile();
			}
			outputStream = new FileOutputStream(newfile);
			int read = 0;
			byte[] b = new byte[(int) filevi.getSize()];
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
			String root = path + "/" + filename;
			System.out.println(root);

			List<ImgVisionDto> list = vision.detectWebDetections(root);
			model.addAttribute("root", root);
			model.addAttribute("vision", list);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	public String tandanji(Model model, String foodname, String root, String inp) {

		try {
			String foodname2 = foodname.replace(" ", "");
			System.out.println(foodname2);
			List<FoodApiDto> list = foodApi.FoodSearch(foodname2);
			FoodApiDto dto = new FoodApiDto();

			dto.setFoodname(list.get(0).getFoodname());
			dto.setKal(list.get(0).getKal());
			model.addAttribute("root", root);
			model.addAttribute("inp", inp);
			model.addAttribute("list", list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "addr_res2";
	}

	@RequestMapping(value = "bm_insert", method = RequestMethod.POST)
	public String bm_insert(@ModelAttribute BobManagerDto dto) {

		int res = 0;

		res = bobbiz.bminsert(dto);
		if (res > 0) {
			System.out.println("입력성공");
			return "chart_main";
		} else {
			System.out.println("입력실패");
			return "chart_main";
		}
	}

	@RequestMapping("/chart_main.do")
	public String chart_main(Model model, String user_id, String bm_date) {
		List<BobManagerDto> dto = bobbiz.selectList(user_id, bm_date);

		String[] menu = new String[dto.size()];
		int[] kal = new int[dto.size()];
		int size = dto.size();
		String[] menuType = new String[dto.size()];

		for (int i = 0; i < dto.size(); i++) {
			menu[i] = dto.get(i).getBm_menu();
			kal[i] = Integer.parseInt(dto.get(i).getBm_kal());
			menuType[i] = dto.get(i).getBm_type();
			System.out.println("menutype : " + menuType[i]);
		}

		model.addAttribute("size", size);
		model.addAttribute("menu", menu);
		model.addAttribute("kal", kal);
		model.addAttribute("menuType", menuType);

		return "chart_main";

	}

	@RequestMapping(value = "crawling.do")
	public String crawling(Model model) throws IOException {

		String url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query=" + res;

		Document doc = Jsoup.connect(url).get();

		Elements elem1 = doc.select("._box>div>a>img"); // 첫번째피자 검색결과
		Elements elem2 = doc.select("._box>div:nth-child(2)>a>img"); // 첫번째피자 검색결과
		Elements elem3 = doc.select("._box>div:nth-child(3)>a>img"); // 첫번째피자 검색결과
		Elements elem4 = doc.select("._box>div:nth-child(4)>a>img"); // 첫번째피자 검색결과
		Elements elem5 = doc.select("._box>div:nth-child(5)>a>img"); // 첫번째피자 검색결과

		String imgsrc1 = elem1.attr("data-source");
		String imgsrc2 = elem2.attr("data-source");
		String imgsrc3 = elem3.attr("data-source");
		String imgsrc4 = elem4.attr("data-source");
		String imgsrc5 = elem5.attr("data-source");
		model.addAttribute("foodname", res);
		model.addAttribute("message1", imgsrc1);
		model.addAttribute("message2", imgsrc2);
		model.addAttribute("message3", imgsrc3);
		model.addAttribute("message4", imgsrc4);
		model.addAttribute("message5", imgsrc5);

		return "crawling";
	}

	@RequestMapping(value = "/search.do", method = RequestMethod.POST)
	public String search(Model model, String name) throws IOException {

		res = name;

		return crawling(model);
	}

	@RequestMapping(value = "/pay.do")
	public String pay() {
		return "pay";
	}

	@RequestMapping(value = "/notice_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticelist(Model model) {
		model.addAttribute("noticelist", NoticeBiz.selectList());
		return "notice_list";
	}

	@RequestMapping("/notice_insertform.do")
	public String notice_insertForm() {
		return "notice_insert";
	}

	@RequestMapping(value = "/notice_insert.do", method = RequestMethod.POST)
	public String notice_insert(@ModelAttribute NoticeDto dto) {

		int res = NoticeBiz.insert(dto);

		if (res > 0) {
			return "redirect:notice_list.do";
		} else {
			return "redirect:notice_insertform.do";
		}
	}

	@RequestMapping(value = "/notice_selectone.do")
	public String notice_selectone(Model model, int n_no) {

		NoticeDto dto = NoticeBiz.selectOne(n_no);

		model.addAttribute("dto", dto);

		return "notice_selectone";
	}

	@RequestMapping(value = "/notice_updateform.do")
	public String notice_updateform(Model model, int n_no) {

		NoticeDto dto = NoticeBiz.selectOne(n_no);

		model.addAttribute("dto", dto);

		return "notice_update";
	}

	@RequestMapping(value = "/notice_update.do")
	public String notice_update(@ModelAttribute NoticeDto dto) {

		int res = NoticeBiz.update(dto);

		if (res > 0) {
			return "redirect:notice_list.do";
		} else {
			return "redirect:notice_selectone.do";
		}
	}

	@RequestMapping(value = "/notice_delete.do")
	public String notice_delete(int n_no) {

		System.out.println(n_no);

		int res = NoticeBiz.delete(n_no);

		if (res > 0) {
			return "redirect:notice_list.do";
		} else {
			return "redirect:notice_delete.do";
		}
	}

	@RequestMapping(value = "/map.do", method = { RequestMethod.GET, RequestMethod.POST })
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

	@RequestMapping(value = "/map_search.do", method = RequestMethod.GET)
	public String map_search(Model model, String foodselect) {
		System.out.println(foodselect);
		model.addAttribute("foodselect", foodselect);
		return "map_search";
	}

	@RequestMapping("/main2.do")
	public String main2() {
		return "main";
	}


	@RequestMapping(value = "/chart03.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chart03(Model model, String user_id, String bm_date, String type) {
		List<BobManagerDto> dto = bobbiz.selectList(user_id, bm_date);
		int size = 0;
		int[] kal = new int[dto.size()];
		String[] menu = new String[dto.size()];

		for (int i = 0; i < dto.size(); i++) {
			if (type.equals("morning") && (dto.get(i).getBm_type() + "").equals("아침")) {
				kal[i] = Integer.parseInt(dto.get(i).getBm_kal());
				menu[i] = dto.get(i).getBm_menu() + " ";
			} else if (type.equals("lunch") && (dto.get(i).getBm_type() + "").equals("점심")) {
				kal[i] = Integer.parseInt(dto.get(i).getBm_kal());
				menu[i] = dto.get(i).getBm_menu() + " ";
			} else if (type.equals("dinner") && (dto.get(i).getBm_type() + "").equals("저녁")) {
				kal[i] = Integer.parseInt(dto.get(i).getBm_kal());
				menu[i] = dto.get(i).getBm_menu() + " ";
			}

			model.addAttribute("size", size);
			model.addAttribute("menu", menu);
			model.addAttribute("kal", kal);

			return "chart04";

		}

		int cnt_menu = 0, cnt_kal = 0;
		for (int i = 0; i < menu.length; i++) {
			if (menu[i] != null) {
				menu[cnt_menu] = menu[i];
				cnt_menu++;
			}

			if (kal[i] != 0) {
				kal[cnt_kal] = kal[i];
				cnt_kal++;
			}
		}

		String[] menu_res = new String[cnt_menu];
		int[] kal_res = new int[cnt_kal];

		for (int i = 0; i < cnt_menu; i++) {
			menu_res[i] = menu[i];
			kal_res[i] = kal[i];
		}

		model.addAttribute("size", cnt_menu);
		model.addAttribute("kal_res", kal_res);
		model.addAttribute("menu_res", menu_res);
		return "chart03";
	}

	@RequestMapping(value = "/chart04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chart04(Model model, String user_id, String bm_date) {
		List<BobManagerDto> dto = bobbiz.selectList(user_id, bm_date);

		String[] menu = new String[dto.size()];
		int[] kal = new int[dto.size()];
		int size = dto.size();

		for (int i = 0; i < dto.size(); i++) {
			menu[i] = dto.get(i).getBm_menu();
			kal[i] = Integer.parseInt(dto.get(i).getBm_kal());
		}

		model.addAttribute("size", size);
		model.addAttribute("menu", menu);
		model.addAttribute("kal", kal);

		return "chart04";
	}

	@RequestMapping("/prac.do")
	public String prac() {
		return "prac";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm() {
		return "join";
	}

	@RequestMapping(value = "/joinajax")
	public String joinajax() {
		System.out.println("join");
		return "join";

	}

	@RequestMapping("/menutype.do")
	public String menutype(Model model, String user_id, String bm_date, String type) {
		List<BobManagerDto> dto = bobbiz.selectList(user_id, bm_date);
		int size = dto.size();

		int kal_res = 0;
		String menu_type = "";
		String menu_res = "";

		for (int i = 0; i < dto.size(); i++) {
			if (type.equals("morning") && (dto.get(i).getBm_type() + "").equals("아침")) {
				kal_res += Integer.parseInt(dto.get(i).getBm_kal());
				menu_type = "아침";
				menu_res += dto.get(i).getBm_menu() + " ";
			} else if (type.equals("lunch") && (dto.get(i).getBm_type() + "").equals("점심")) {
				kal_res += Integer.parseInt(dto.get(i).getBm_kal());
				menu_type = "점심";
				menu_res += dto.get(i).getBm_menu() + " ";
			} else if (type.equals("dinner") && (dto.get(i).getBm_type() + "").equals("저녁")) {
				kal_res += Integer.parseInt(dto.get(i).getBm_kal());
				menu_type = "저녁";
				menu_res += dto.get(i).getBm_menu() + " ";
			}
		}

		model.addAttribute("kal_res", kal_res);
		model.addAttribute("menu_type", menu_type);
		model.addAttribute("menu_res", menu_res);

		return "menutype";
	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();

	}

	@RequestMapping("/mailform.do")
	public String mailgo(HttpServletRequest request, Model model, String email, String randomcode) {
		String authNum = RandomNum();

		String setform = "ghdwns9a3@gmail.com";
		String tomail = email; // �޴� ��� �̸���
		String title = "BOBTONG ACCOUNT MAIL"; // ����
		String content = authNum;

		System.out.println(setform);
		System.out.println(email);
		System.out.println(tomail);
		System.out.println(content);

		try {
			Authenticator auth = new SMTPAuthenticator();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setform);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

		} catch (Exception e) {
			System.out.println(e);
		}

		model.addAttribute("emailauth", content);
		model.addAttribute("email", tomail);
		return "mailform";
	}

	@RequestMapping("/mailformajax.do")
	@ResponseBody
	public int ajax(HttpServletRequest request, Model model, @RequestParam(required = false) String emailval,
			@RequestParam(required = false) String contentval, @RequestParam(required = false) String emailauth) {

		System.out.println("emailval:" + emailval);

		System.out.println("contentval:" + contentval);
		System.out.println("emailauth : " + emailauth);
		System.out.println(emailauth + ":" + contentval);

		if (contentval.equals(emailauth)) {
			int res = 0;
			System.out.println("일치");
			return res;
		} else {
			int res = 1;
			System.out.println("불일치");
			return res;
		}
	}

	@RequestMapping(value = "/joinuser.do", method = RequestMethod.POST)
	public String joinuser(@ModelAttribute UserBoardDto dto) {
		dto.setUser_grade("user");
		dto.setUser_sns("N");
		dto.setUser_img("resources/image/로고.png");
		dto.setCno(1);

		int res = UserBiz.join(dto);

		if (res > 0) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/idChk.do")
	public String idcheck() {
		return "idchk";
	}

	@RequestMapping(value = "/idChkres.do", method = RequestMethod.POST)
	@ResponseBody
	public int idcheck_res(HttpServletRequest request, Model model, @RequestParam(required = false) String user_id) {

		int res = UserBiz.idCheck(user_id);
		System.out.println(res);

		if (res > 0) {

			System.out.println("중복");
			return res;
		} else {
			model.addAttribute("user_id", user_id);
			System.out.println("사용하실수있음");
			return res;
		}
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model, String user_id, String user_pw) {

		return "main_page";

	}

	@RequestMapping(value = "/kakao.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakao(String id, String user_name, Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String user_id = id;
		String user_pw = user_name;
		System.out.println("카카오 ID :" + user_id);
		System.out.println("카카오 PW : " + user_pw);

		UserBoardDto resdto = UserBiz.selectOne(user_id);
		if (resdto != null) {

			UserBoardDto user = UserBiz.login(user_id, user_pw);
			session = request.getSession(true);
			session.setAttribute("user", user);

			return "main_page";
		} else {
			model.addAttribute("user_id", user_id);
			model.addAttribute("user_pw", user_pw);

			System.out.println("회원정보가 없음");
			return "snsjoin";
		}

	}

	@RequestMapping(value = "/joinsns.do", method = RequestMethod.POST)
	public String joinsns(@ModelAttribute UserBoardDto dto) {
		dto.setUser_grade("user");
		dto.setUser_sns("N");
		dto.setUser_img("resources/image/로고.png");
		dto.setCno(1);

		int res = UserBiz.join(dto);

		if (res > 0) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping("/loginajax.do")
	@ResponseBody
	public Map<String, Boolean> login(String user_id, String user_pw,HttpServletRequest request, HttpSession session) {

		UserBoardDto dto = UserBiz.login(user_id, user_pw);
		boolean sendMessageButton = false;
		System.out.println("로그인 인증처리..");
		System.out.println(user_id);
		System.out.println(user_pw);
		if (dto != null) {
			if(session.getAttribute("user") != null) {
				session.removeAttribute("user");
			}
			
			
			session = request.getSession(true);
			session.setAttribute("user", dto);
			sendMessageButton = true;
		}

		Map<String, Boolean> res = new HashMap<String, Boolean>();
		res.put("sendMessageButton", sendMessageButton);
		System.out.println("login : " + ((UserBoardDto) session.getAttribute("user")).getUser_name());
		return res;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
		session.removeAttribute("user");
		session.invalidate();
		session = request.getSession(false);
		status.setComplete();

		if (session == null) {
			System.out.println("세션 종료됨");
		}

		return "redirect:main3.do";
	}

	@RequestMapping("/findform.do")
	public String findidpw(HttpServletRequest request, Model model, String email, String randomcode) {
		String authNum = RandomNum();

		String setform = "ghdwns9a3@gmail.com";
		String tomail = email; // �޴� ��� �̸���
		String title = "BOBTONG ACCOUNT MAIL"; // ����
		String content = authNum;

		System.out.println(setform);
		System.out.println(email);
		System.out.println(tomail);
		System.out.println(content);

		try {
			Authenticator auth = new SMTPAuthenticator();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setform);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
		} catch (Exception e) {
			System.out.println(e);
		}

		model.addAttribute("emailauth", content);
		model.addAttribute("email", tomail);
		return "findform";
	}

	@RequestMapping("/findformajax.do")
	@ResponseBody
	public HashMap<Object, Object> findajax(HttpServletRequest request, Model model,
			@RequestParam(required = false) String emailval, @RequestParam(required = false) String contentval,
			@RequestParam(required = false) String emailauth) {

		System.out.println("emailval:" + emailval);

		System.out.println("contentval:" + contentval);
		System.out.println("emailauth : " + emailauth);
		System.out.println(emailauth + ":" + contentval);

		if (contentval.equals(emailauth)) {
			int res = 0;
			System.out.println("일치");
			UserBoardDto dto = UserBiz.findInfo(emailval);
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("id", dto.getUser_id());
			map.put("pw", dto.getUser_pw());
			map.put("res", res);

			return map;
		} else {
			int res = 1;
			System.out.println("불일치");
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("res", res);
			return map;
		}
	}

	@RequestMapping("/findpwform.do")
	public String findpwform(HttpServletRequest request, Model model, String email, String randomcode) {
		String authNum = RandomNum();

		String setform = "ghdwns9a3@gmail.com";
		String tomail = email; // �޴� ��� �̸���
		String title = "BOBTONG ACCOUNT MAIL"; // ����
		String content = authNum;

		System.out.println(setform);
		System.out.println(email);
		System.out.println(tomail);
		System.out.println(content);

		try {
			Authenticator auth = new SMTPAuthenticator();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setform);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
		} catch (Exception e) {
			System.out.println(e);
		}

		model.addAttribute("emailauth", content);
		model.addAttribute("email", tomail);
		return "transpw";

	}

	@RequestMapping(value = "transjax.do", method = RequestMethod.POST)
	@ResponseBody
	public int transjax(HttpServletRequest request, Model model, @RequestParam(required = false) String emailval,
			@RequestParam(required = false) String contentval, @RequestParam(required = false) String emailauth) {
		if (contentval.equals(emailauth)) {
			int res = 0;
			System.out.println("일치");
			return res;
		} else {
			int res = 1;
			System.out.println("불일치");
			return res;
		}
	}

	@RequestMapping(value = "/transrespw.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<Object, Object> transrespw(HttpServletRequest request, String user_id, String user_pw) {
		HashMap<Object, Object> map = new HashMap<>();
		UserBoardDto dto = new UserBoardDto();
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);

		int res = UserBiz.transpw(dto);

		if (res > 0) {
			int num = 0;
			map.put("num", num);
			return map;
		} else {
			int num = 1;
			map.put("num", num);
			return map;
		}

	}

	@RequestMapping("/header.do")
	public String header() {
		return "header";
	}

	@RequestMapping("/footer.do")
	public String footer() {
		return "footer";
	}

	@RequestMapping("/main_menu.do")
	public String main_menu() {
		return "main_page";
	}
     
	@RequestMapping(value = "/chat.do")
	public String chatroom(Model model, HttpSession session) {

		UserBoardDto userdto = new UserBoardDto();

		userdto = (UserBoardDto) (session.getAttribute("user"));

		model.addAttribute("chatuser", UserBiz.chatuser(userdto.getUser_id()));

		return "chat";
	}
		
		
		// 채팅방 번호 확인 + 채팅메세지 가져오기 + 채팅방 만들기
		@ResponseBody
		@RequestMapping(value="/roomNum.do")
		public Map<Object, Object> roomNum(Model model, String user_id, String target_id) {
			
			Map<Object, Object> map = new HashMap<>();
			
			List<ChatDto> chatmsg = null; 
			
			int ch_roomno = 0;
			ChatUserDto dto = chatuserbiz.roomNum(user_id, target_id);
			
			if(dto != null) {
				ch_roomno = dto.getCh_roomno();
				System.out.println(user_id+"와 "+target_id+"의 채팅방 번호: " + ch_roomno);
				
				chatmsg = chatbiz.chatList(ch_roomno);
				
				map.put("ch_roomno", ch_roomno);
				map.put("msglist", chatmsg);
				
				return map;
				
			} else {
				System.out.println(user_id+"와 "+target_id+"는 채팅방이 없슴다");
				
				// 채팅방 만들기
				ChatUserDto insertRoom = new ChatUserDto();
				insertRoom.setUser_id(user_id);
				insertRoom.setTarget_id(target_id);
				
				chatuserbiz.ChatUserInsert(insertRoom);
				chatuserbiz.ChatTargetInsert(insertRoom);
				chatroombiz.RoomInsert(insertRoom);
				
				ChatUserDto roomnum = chatuserbiz.roomNum(user_id, target_id);
				
				// 방번호 넣기
				ch_roomno = roomnum.getCh_roomno();
				chatmsg = chatbiz.chatList(ch_roomno);
				
				map.put("ch_roomno", ch_roomno);
				map.put("msglist", chatmsg);
				
				return map;
			}
		}      
		
	

}
