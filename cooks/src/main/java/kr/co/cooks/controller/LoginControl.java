package kr.co.cooks.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.co.cooks.service.UserService;
import kr.co.cooks.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginControl {

	private static final Logger logger = LoggerFactory.getLogger(LoginControl.class);
	
	@Autowired UserService userService;
	UserVO userVO;
	
/*	페이지 이동만 필요할 경우 */
  
	@RequestMapping(value = "/cooksMain.app")
	public ModelAndView mainForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main/main");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/login.app")
	public Object login(@RequestParam String email, String password, HttpSession session, String requestUrl) {

		System.out.println("이메일 : " +email);
		System.out.println("비밀번호 : " +password);

		userVO = userService.validation_Check(email, password);
		
		HashMap<String, Object> resultMap = new HashMap<>();

		if(userVO != null) {
			session.setAttribute("loginUser", userVO);
			resultMap.put("status", "success");
			
		} else {
			session.invalidate();
			resultMap.put("status", "fail");
		}

		return resultMap;
	}

	
}
	
