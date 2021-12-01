package com.teraenergy.dashboard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.teraenergy.dashboard.service.DashboardService;

//@RestController
@Controller
public class DashboardController {

	@Autowired
	DashboardService s;

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard() {
		return "/dashboard/dashboard";
	}

	@RequestMapping("/boardList")
	public @ResponseBody List<Object> boardList() throws Exception {

		List<Object> getData = s.getBoard();

		return getData;
	}

	// test img insert
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "test_img_insert", headers = "Accept=*/*")
	public String test_img_insert(@RequestParam (name="test_img") MultipartFile test_img) throws Exception {

		String filePath = "C:\\file_path";

		String test_img_filePath = filePath + "\\" + test_img.getOriginalFilename();

		if (!test_img.getOriginalFilename().isEmpty()) {
			test_img.transferTo(new File(filePath, test_img.getOriginalFilename()));
		}
		
//		map에 저장
		Map<String, Object> map = new HashMap<>();

		map.put("filePath", test_img_filePath);

		s.insert_file(map);

		return "redirect:/dashboard";
	}
}