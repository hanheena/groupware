package com.teraenergy.workReport.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teraenergy.workReport.service.WorkReportService;

@Controller
public class WorkReportController {

	@Autowired
	private WorkReportService workReportService;

	// 업무 버튼 클릭 시 리스트 페이지
	@RequestMapping(value = "/teware/workReport/workReportList", method = { RequestMethod.GET, RequestMethod.POST })
	public String workReport(Map<String, Object> map, Model model) throws Exception {

		List<Map<String, Object>> list = workReportService.workReportList(map);

		model.addAttribute("list", list);
		
		System.out.println("워크 레포트 확인 : " + list);

		return "workReport/workReportList";
	}

	// 일일보고/주간보고 버튼 클릭 시 작성 화면으로 이동
	@RequestMapping(value = "/teware/workReport/workReportWrite", method = { RequestMethod.GET, RequestMethod.POST })
	public String workReportWrite(@RequestParam Map<String, Object> map, Model model) {
		model.addAttribute("map", map);
		return "workReport/workReportWrite";
	}

	// 일일보고/주간보고 작성 -> DB 저장
	@RequestMapping(value = "/teware/workReport/workReportSave", method = { RequestMethod.GET, RequestMethod.POST })
	public String wordReportSave(@RequestParam Map<String, Object> map, Model model) throws Exception {
		workReportService.workReportSave(map);
		model.addAttribute("map", map);
		return "redirect:/teware/workReport/workReportList";
	}

	// 보고 게시글 상세보기
	@RequestMapping(value = "/teware/workReport/workReportDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String workReportDetail(@RequestParam Map<String, Object> map, Model model) throws Exception {

		// 게시물 상세 조회하기
		System.out.println("Controller : " + map.get("id"));
		workReportService.workReportDetail(map);
		System.out.println(map.get("title"));
		model.addAttribute("map", map);
		return "workReport/workReportDetail";
	}

	// 보고 게시글 수정 -> 화면 전환
	@RequestMapping(value = "/teware/workReport/workReportModify", method = { RequestMethod.GET, RequestMethod.POST })
	public String workReportModify(@RequestParam Map<String, Object> map, Model model) throws Exception {

		workReportService.workReportDetail(map);
		model.addAttribute("map", map);
		return "workReport/workReportModify";
	}

	// 보고 게시글 수정 -> DB 반영
	@ResponseBody
	@RequestMapping(value = "/teware/workReport/workReportChange", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean workReportChange(@RequestParam Map<String, Object> map) throws Exception {

		// 수정
		Boolean result;
		int result_num = workReportService.workReportChange(map);

		if (result_num == 0) {
			result = false;
		} else {
			result = true;
		}

		return result;
	}

	// 보고 게시판 삭제
	@RequestMapping(value = "/teware/workReport/workReportDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String workReportDelete(@RequestParam("id") int num) throws Exception {
		workReportService.workReportDelete(num);
		return "redirect:/teware/workReport/workReportList";
	}
}
