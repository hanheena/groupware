package com.teraenergy.dashboard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teraenergy.dashboard.service.DashboardService;

//@RestController
@Controller
public class DashboardController {
	
	@Autowired
	DashboardService s;

	@RequestMapping(value = "/teware/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("user_id", session.getAttribute("user_id"));
		mav.addObject("user_name", session.getAttribute("user_name"));
		
		mav.setViewName("/dashboard/dashboard");

		return mav;
	}
	

	/* 이미지 첨부 예시 소스
	 * @RequestMapping("/test_img_view") public @ResponseBody List<Object>
	 * test_img_view() throws Exception {
	 * 
	 * List<Object> getData = s.getBoard();
	 * 
	 * return getData; }
	 */

	// 이미지 첨부 예시 소스
	// @SuppressWarnings("unchecked")
	// @RequestMapping(value = "test_img_insert", headers = "Accept=*/*")
	/*
	 * public String test_img_insert(@RequestParam (name="test_img") MultipartFile
	 * test_img) throws Exception {
	 * 
	 * String filePath = "C:\\file_path";
	 * 
	 * String test_img_filePath = filePath + "\\" + test_img.getOriginalFilename();
	 * 
	 * if (!test_img.getOriginalFilename().isEmpty()) { test_img.transferTo(new
	 * File(filePath, test_img.getOriginalFilename())); }
	 * 
	 * // map에 저장 Map<String, Object> map = new HashMap<>();
	 * 
	 * map.put("filePath", test_img_filePath);
	 * 
	 * s.insert_file(map);
	 * 
	 * return "redirect:/dashboard"; }
	 */
}