package com.bob.proj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bob.proj.model.biz.NoticeBiz;
import com.bob.proj.model.dto.NoticeDto;

@Controller
@RequestMapping("/board/*")
public class BoardController {
      
	@Autowired
	NoticeBiz service;
   
    public BoardController() {
    }


    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public void getWrite() throws Exception {
    }

    // 글 작성 post
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public String postWrite(NoticeDto vo) throws Exception {
     
     service.insert(vo);
     
     return "redirect:/";
    }

}
