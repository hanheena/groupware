package com.teraenergy.common.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teraenergy.common.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService s;

	@GetMapping(value = "/teware")
	public String home() {
		return "/login/login";
	}
	
	@GetMapping(value = "/teware/login")
	public String login() {
		return "/login/login";
	}

	@PostMapping("/teware/loginChk")
	public String loginChk(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		
		System.out.println("map :: ");
		System.out.println(map);
		
		try {
			if (map.get("loginId") == null || map.get("password") == null) {
				model.addAttribute("msg", "아이디 또는 비밀번호를 입력해주세요");
				return "error/error";
			}
			Map<String, String> userInfo = s.login(map);
			
			if (userInfo != null) {
				session.setAttribute("user_id", userInfo.get("login_id"));
				session.setAttribute("user_name", userInfo.get("kr_name"));
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
				return "error/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "/dashboard/dashboard";
	} 
	
	/*로그아웃 - 임시*/
	@GetMapping("/teware/logout")
	public String logout(HttpSession session) {
		
		// 세선 초기화
		session.invalidate();
		
		return "redirect:/teware/login";
	}
}