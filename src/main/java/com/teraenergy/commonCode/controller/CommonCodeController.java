package com.teraenergy.commonCode.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.commonCode.service.CommonCodeService;

@Controller
public class CommonCodeController {

	@Autowired
	private CommonCodeService commonCodeService;

	// ajax 코드 목록
	@PostMapping(value = "/teware/commonCode/ajaxListCommonCode")
	@ResponseBody
	public List<Map<String, Object>> ajaxListCommonCode(@RequestParam Map<String, Object> para, HttpSession session)
			throws Exception {
		// 해당 부서 인원 목록
		List<Map<String, Object>> listCommonCode = commonCodeService.listCommonCode(para);
		System.out.println("!@" + listCommonCode);
		return listCommonCode;
	}

	// ajax 코드 정보
	@PostMapping(value = "/teware/commonCode/ajaxCommonCode")
	@ResponseBody
	public Map<String, Object> ajaxCommonCode(@RequestParam Map<String, Object> para, HttpSession session)
			throws Exception {

		// 해당 부서 인원 목록
		Map<String, Object> commonCode = commonCodeService.selectCommonCode(para);

		return commonCode;
	}

	// ajax 코드 업데이트
	@PostMapping(value = "/teware/commonCode/ajaxUpdateCommonCode")
	@ResponseBody
	public Map<String, Object> ajaxUpdateCommonCode(@RequestParam Map<String, Object> para, HttpSession session)
			throws Exception {
		String code = "0";
		String msg = "";
		try {
			int chkCount = commonCodeService.commonCodeValueCheck(para);
			int seq = Integer.parseInt(String.valueOf(para.get("seq")));

			// 코드 값 중복 체크
			if (chkCount == 0) {
				// 수정할 정보 제외한 나머지 목록 호출
				List<Map<String, Object>> listMap = new ArrayList<>();
				listMap = commonCodeService.listCommonCode2(para);

				// 업데이트 할 정보 삽입
				if (listMap.size() >= seq) {
					// 중간에 추가 될경우 List 인덱스 지정
					listMap.add(seq - 1, para);
				} else {
					// 순서가 마지막일경우
					listMap.add(para);
				}
				// List 순서대로 seq 재 정의
				int seqNum = 1;
				for (Map<String, Object> map : listMap) {
					map.put("seq", seqNum);
					seqNum++;
					commonCodeService.updateCommonCode(map);
				}

			} else {
				// 중복값 존재하므로 변경작업 못함
				code = "1";
				msg = "중복값이 존재합니다.";
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", code);
		resultMap.put("msg", msg);
		return resultMap;
	}

	// ajax 코드 업데이트
	@PostMapping(value = "/teware/commonCode/ajaxInsertCommonCode")
	@ResponseBody
	public Map<String, Object> ajaxInsertCommonCode(@RequestParam Map<String, Object> para, HttpSession session)
			throws Exception {
		String code = "0";
		String msg = "";
		try {
			int chkCount = commonCodeService.commonCodeValueCheck(para);
			System.out.println(para);
			if (chkCount == 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("codeValue", para.get("codeTypeValue"));
				Map<String, Object> resultMap = commonCodeService.lastCommonCodeSeqNum(map);
				int seq = Integer.parseInt(String.valueOf(resultMap.get("seq")));
				seq++;
				para.put("seq", seq);
				para.put("codeTypeId", resultMap.get("codeTypeId"));
				System.out.println(para);
				commonCodeService.insertCommonCode(para);
			} else {
				// 중복값 존재하므로 변경작업 못함
				code = "1";
				msg = "중복값이 존재합니다.";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", code);
		resultMap.put("msg", msg);
		return resultMap;
	}

}