package com.teraenergy.workReportTest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.workReportTest.service.WorkReportTestService;

import javafx.scene.control.Pagination;

@Controller
public class WorkReportTestController {

	@Autowired
	private WorkReportTestService workReportTestService;

	// 업무 버튼 클릭 시 리스트 페이지
	@RequestMapping(value = "/teware/workReportTest/workReportTestList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String workReportTest(Map<String, Object> map, Model model) throws Exception {

		List<Map<String, Object>> list = workReportTestService.workReportList(map);

		model.addAttribute("list", list);

		return "workReportTest/workReportTestList";
	}

	// 일일보고/주간보고 버튼 클릭 시 작성 화면으로 이동
	@RequestMapping(value = "/teware/workReportTest/workReportTestWrite", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String workReportTestWrite(@RequestParam Map<String, Object> map, Model model) {
		model.addAttribute("map", map);
		return "workReportTest/workReportTestWrite";
	}

	// 일일보고/주간보고 작성 -> DB 저장
	@RequestMapping(value = "/teware/workReportTest/workReportTestSave", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String wordReportSave(@RequestParam Map<String, Object> map, Model model) throws Exception {
		workReportTestService.workReportSave(map);
		model.addAttribute("map", map);
		return "redirect:/teware/workReportTest/workReportTestList";
	}

	// 보고 게시글 상세보기
	@RequestMapping(value = "/teware/workReportTest/workReportTestDetail", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String workReportTestDetail(@RequestParam Map<String, Object> map, Model model) throws Exception {

		// 게시물 상세 조회하기
		System.out.println("Controller : " + map.get("id"));
		workReportTestService.workReportDetail(map);
		System.out.println(map.get("title"));
		model.addAttribute("map", map);
		return "workReportTest/workReportTestDetail";
	}

	// 보고 게시글 수정 -> 화면 전환
	@RequestMapping(value = "/teware/workReportTest/workReportTestModify", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String workReportTestModify(@RequestParam Map<String, Object> map, Model model) throws Exception {

		workReportTestService.workReportDetail(map);
		model.addAttribute("map", map);
		return "groupware/workReportTest/workReportTestModify";
	}

	// 보고 게시글 수정 -> DB 반영
	@ResponseBody
	@RequestMapping(value = "/teware/workReportTest/workReportTestChange", method = { RequestMethod.GET,
			RequestMethod.POST })
	public boolean workReportTestChange(@RequestParam Map<String, Object> map) throws Exception {

		// 수정
		Boolean result;
		int result_num = workReportTestService.workReportChange(map);

		if (result_num == 0) {
			result = false;
		} else {
			result = true;
		}

		return result;
	}

	// 보고 게시판 삭제
	@RequestMapping(value = "/teware/workReportTest/workReportTestDelete", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String workReportTestDelete(@RequestParam("id") int num) throws Exception {
		workReportTestService.workReportDelete(num);
		return "redirect:/teware/workReportTest/workReportTestList";
	}
}
