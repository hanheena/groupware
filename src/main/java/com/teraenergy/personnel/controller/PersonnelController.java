package com.teraenergy.personnel.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.commonCode.service.CommonCodeService;
import com.teraenergy.personnel.service.PersonnelService;

@Controller
public class PersonnelController {

	@Autowired
	private PersonnelService personnelService;

	@Autowired
	private CommonCodeService commonCodeService;

	// 인사 카드 화면 이동
	@GetMapping(value = "/teware/test")
	public String test(HttpSession session, Model model, @RequestParam Map<String, Object> map) throws Exception {

		// 회원 정보
		Map<String, Object> userMap = new HashMap<String, Object>();
		Map<String, Object> userInfoMap = (Map<String, Object>) session.getAttribute("userInfo");

		return "groupware/personnel/test";
	}

	// 인사 카드 화면 이동
	@GetMapping(value = "/teware/personnel")
	public String personnel(HttpSession session, Model model, @RequestParam Map<String, Object> map) throws Exception {

		// 회원 정보
		Map<String, Object> userMap = new HashMap<String, Object>();
		Map<String, Object> userInfoMap = (Map<String, Object>) session.getAttribute("userInfo");

		if (map.get("userId") == null || map.get("userId") == "") {
			userMap.put("userId", userInfoMap.get("userId"));
		} else {
			userMap.put("userId", map.get("userId"));
		}
		Map<String, Object> personnel = personnelService.selectUserInfo(userMap);
		model.addAttribute("personnel", personnel);

		// 부서 목록 & 인원 카운트
		Map<String, String> deptInfoMap = new HashMap<String, String>();
		deptInfoMap.put("codeValue", "dept");
		List<Map<String, String>> listDeptInfo = personnelService.listDept(deptInfoMap);
		model.addAttribute("listDeptInfo", listDeptInfo);

		// 부서 [공통코드]
		Map<String, Object> deptMap = new HashMap<String, Object>();
		deptMap.put("codeValue", "dept");
		List<Map<String, Object>> listDept = commonCodeService.listCommonCode(deptMap);
		System.out.println("!@" + listDept);
		model.addAttribute("listDept", listDept);
		// 직급 [공통코드]
		Map<String, Object> positionMap = new HashMap<String, Object>();
		positionMap.put("codeValue", "position");
		List<Map<String, Object>> listPosition = commonCodeService.listCommonCode(positionMap);
		model.addAttribute("listPosition", listPosition);
		// 직책 [공통코드]
		Map<String, Object> dutyMap = new HashMap<String, Object>();
		dutyMap.put("codeValue", "duty");
		List<Map<String, Object>> listDuty = commonCodeService.listCommonCode(dutyMap);
		model.addAttribute("listDuty", listDuty);
		// 업무 위치 [공통코드]
		Map<String, Object> placeMap = new HashMap<String, Object>();
		placeMap.put("codeValue", "place");
		List<Map<String, Object>> listPlace = commonCodeService.listCommonCode(placeMap);
		model.addAttribute("listPlace", listPlace);
		// 근로 형태 [공통코드]
		Map<String, Object> workTypeMap = new HashMap<String, Object>();
		workTypeMap.put("codeValue", "workType");
		List<Map<String, Object>> listWorkType = commonCodeService.listCommonCode(workTypeMap);
		model.addAttribute("listWorkType", listWorkType);
		// 상태 [공통코드]
		Map<String, Object> stateMap = new HashMap<String, Object>();
		stateMap.put("codeValue", "state");
		List<Map<String, Object>> listState = commonCodeService.listCommonCode(stateMap);
		model.addAttribute("listState", listState);
		// 등급 [공통코드]
		Map<String, Object> authMap = new HashMap<String, Object>();
		authMap.put("codeValue", "auth");
		List<Map<String, Object>> listAuth = commonCodeService.listCommonCode(authMap);
		model.addAttribute("listAuth", listAuth);

		return "groupware/personnel/personnelInfo";
	}

	// 해당 부서 인원 목록 조회
	@PostMapping(value = "/teware/personnel/ajaxListDeptUser")
	@ResponseBody
	public List<Map<String, Object>> ajaxListDeptUser(@RequestParam Map<String, Object> para, HttpSession session)
			throws Exception {

		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("department", para.get("department"));
		System.out.println("!@");
		System.out.println(para.get("department"));
		if (para.get("workTypes") != null && para.get("workTypes") != "") {
			String[] item = ((String) para.get("workTypes")).split(",");
			List<String> list = new ArrayList<String>(Arrays.asList(item));
			reMap.put("workTypes", list);
		} else {
			reMap.put("workTypes", null);
		}
		System.out.println(reMap);
		// 해당 부서 인원 목록
		List<Map<String, Object>> listDeptUser = personnelService.listDeptUser(reMap);
		return listDeptUser;

	}

	// 인사카드 갱신
	@PostMapping(value = "/teware/personnel/ajaxUpdateUserInfo")
	@ResponseBody
	public void ajaxUpdateUserInfo(@RequestParam Map<String, Object> para, HttpSession session) throws Exception {
		try {
			Map<String, Object> obj = (Map<String, Object>) session.getAttribute("userInfo");
			LocalDate now = LocalDate.now();

			para.put("updateId", obj.get("userId"));
			para.put("updateDt", now.toString());
			personnelService.updateUserInfo(para);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

	}

	// 인사카드 체크박스 기능(출퇴근, 스킬, 서류)
	@PostMapping(value = "/teware/personnel/ajaxUpdateChecked")
	@ResponseBody
	public void ajaxUpdateChecked(@RequestParam Map<String, Object> para, HttpSession session) throws Exception {
		try {
			Map<String, Object> obj = (Map<String, Object>) session.getAttribute("userInfo");
			System.out.println("!@" + para);
			personnelService.updateCheckedYn(para);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

	}
}