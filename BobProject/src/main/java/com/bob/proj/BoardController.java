package com.bob.proj;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.proj.model.biz.BoardBiz;
import com.bob.proj.model.biz.ReplyBiz;
import com.bob.proj.model.dto.BoardDto;
import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.PageMaker;
import com.bob.proj.model.dto.ReplyDto;
import com.bob.proj.model.dto.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	public BoardController() {
	}
	
	@Inject
	BoardBiz biz;
	
	@Inject
	ReplyBiz replybiz;
	
	//글작성 get
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public void getWrite() throws Exception{
		logger.info("get write");
	}
	
	//글작성 post
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String postWrite(BoardDto dto) throws Exception{
		logger.info("post write");
		
		biz.write(dto);
		
		return "redirect:/board/listSearch";
	}
	//GET은 해당 페이지에 접속, POST는 해당 페이지에서 값을 전송하는 것
	
	//글목록
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model) throws Exception{
		logger.info("get list");
		
		List<BoardDto> list = biz.list();
		
		model.addAttribute("list",list);
	}
	
	// 글 조회 
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("bno") int bno, 
						@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get read");
			
		BoardDto dto = biz.read(bno);		
		model.addAttribute("read", dto);		
		model.addAttribute("scri", scri);

		System.out.println(scri.getPage());
		System.out.println(scri.getPerPageNum());
		System.out.println((scri.getKeyword()));
		System.out.println(scri.getSearchType());
			
		//댓글을 불러오는 코드 추가 
		List<ReplyDto> repList = replybiz.readReply(bno);
		model.addAttribute("repList", repList);
			
	}	
	
	//글수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno,@ModelAttribute("srci") SearchCriteria scri, Model model) throws Exception {
		logger.info("get modify");
	  
		BoardDto dto = biz.read(bno);
	  	
		model.addAttribute("modify", dto);
		model.addAttribute("scri",scri);
	} 
	
	//글삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno,@ModelAttribute("srci") SearchCriteria scri, Model model) throws Exception {
		logger.info("get delete");
	    
		model.addAttribute("delete", bno);
		model.addAttribute("scri",scri);
	  
	}
	
	//값을전송할때 post
	// 글 수정  POST	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardDto dto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("post modify");
			
		biz.update(dto);
				
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		System.out.println(scri.getPage());
		System.out.println(scri.getPerPageNum());
		System.out.println((scri.getKeyword()));
		System.out.println(scri.getSearchType());
		
		return "redirect:/board/listSearch";
	}

	// 글 삭제  POST 
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("post delete");
					
		biz.delete(bno);
			
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/board/listSearch";	
	}
	
	//글목록 + 페이징
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		logger.info("get list page");
		
		List<BoardDto> list = biz.listPage(cri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.listCount());
		model.addAttribute("pageMaker",pageMaker);
	}

	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply write");
		 
		replybiz.writeReply(dto);
		 
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		System.out.println(scri.getPage());
		System.out.println(scri.getPerPageNum());
		System.out.println((scri.getKeyword()));
		System.out.println(scri.getSearchType());
	 
		return "redirect:/board/read"; 
	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");
		 
		List<BoardDto> list = biz.listSearch(scri);
		model.addAttribute("list", list);
		 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(biz.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	 logger.info("reply update");
	 
	 replybiz.replyUpdate(dto);
	 
	 rttr.addAttribute("bno", dto.getBno());
	 rttr.addAttribute("page", scri.getPage());
	 rttr.addAttribute("perPageNum", scri.getPerPageNum());
	 rttr.addAttribute("searchType", scri.getSearchType());
	 rttr.addAttribute("keyword", scri.getKeyword());
	 
	 return "redirect:/board/read";
	}

	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyDto dto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	 logger.info("reply delete");
	 
	 replybiz.replyDelete(dto);
	 
	 rttr.addAttribute("bno", dto.getBno());
	 rttr.addAttribute("page", scri.getPage());
	 rttr.addAttribute("perPageNum", scri.getPerPageNum());
	 rttr.addAttribute("searchType", scri.getSearchType());
	 rttr.addAttribute("keyword", scri.getKeyword());
	 
	 return "redirect:/board/read";
	}
	
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno,
	      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	 logger.info("reply update");
	 
	 ReplyDto dto = null;
	 
	 dto = replybiz.readReplySelect(rno);
	 
	 model.addAttribute("readReply", dto);
	 model.addAttribute("scri", scri);
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("rno") int rno,
	      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	 logger.info("reply delete");
	 
	 ReplyDto dto = null;
	 
	 dto = replybiz.readReplySelect(rno);
	 
	 model.addAttribute("readReply", dto);
	 model.addAttribute("scri", scri);
	}
}


