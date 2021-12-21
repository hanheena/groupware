package com.teraenergy.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class SessionInterceptor implements HandlerInterceptor{
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		
//		HttpSession session = request.getSession();
//		String userid = (String) session.getAttribute("login_id");
//		
//		if(userid == null) {
//			System.out.println("Interceptor : Session Check Fail");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.flush();
//			
//			return false;
//		
//		} else {
//			return preHandle(request, response, handler);
//		}
//
//	}

}
