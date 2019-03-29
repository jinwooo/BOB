package com.bob.proj;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.bob.proj.model.dto.UserBoardDto;

@Component
public class sessionIntersep implements HandlerInterceptor {
	/*public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {*/

	/*	Map userInfo = (Map) request.getSession().getAttribute("user"); // 로그인 사용자 세션정보
		String requestURI = request.getRequestURI(); // 요청 URI

		if (requestURI.indexOf("/login.do") > -1) {
			return true;
		} else if (requestURI.indexOf("/actionLogin.do") > -1) {
			return true;
		} else {
			// 위의 예외페이지 외에는 세션값을 체크해서 있으면 그냥 페이지표시
			if (userInfo != null && !userInfo.isEmpty()) {
				return true;
			} else {
				// 정상적인 세션정보가 없으면 로그인페이지로 이동
				ModelAndView modelAndView = new ModelAndView("redirect:/proj/prac.do");
				throw new ModelAndViewDefiningException(modelAndView);
			}
		}
	}*/
	
		/*HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect(request.getContextPath()+"/prac.jsp");
			return false;
		}
		
		
		UserBoardDto dto = (UserBoardDto)session.getAttribute("user");
		
		if(dto == null) {
			response.sendRedirect(request.getContextPath()+"/prac.jsp");
			return false;
		}
		
		return true;
		
		
		
	}*/
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        
	        HttpSession session = request.getSession();
	        UserBoardDto loginVO = (UserBoardDto) session.getAttribute("user");
	 

	        if(loginVO == null){
	            response.sendRedirect("/proj/prac.do");
	            return false;
	        }	        
	        return true;
	    }
	 
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	    }
	 
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	            throws Exception {
	    }

}
