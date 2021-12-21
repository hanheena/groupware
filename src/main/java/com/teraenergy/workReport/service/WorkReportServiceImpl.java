package com.teraenergy.workReport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.workReport.mapper.WorkReportMapper;

@Repository
public class WorkReportServiceImpl implements WorkReportService {

	@Autowired
	private WorkReportMapper workReportMapper;

	// 업무보고 게시판 리스트
	@Override
	public List<Map<String, Object>> workReportList(Map<String, Object> map) throws Exception {
		return workReportMapper.workReportList(map);
	}

	// 업무 보고 작성
	@Override
	public void workReportSave(Map<String, Object> map) throws Exception {
		workReportMapper.workReportSave(map);
	}

	// 업무 보고 상세 조회
	@Override
	public Map<String, Object> workReportDetail(Map<String, Object> map) throws Exception {
		System.out.println("업무보고 상세 조회까지 들어옴 : " + map.get("id"));

		map.put("vo", workReportMapper.workReportDetail(map));
		return map;
	}

	// 업무 보고 수정
	@Override
	public int workReportChange(Map<String, Object> map) throws Exception {
		System.out.println("보고 수정 : " + map.get("id"));
		return workReportMapper.workReportChange(map) > 0 ? 1 : 0;
	}

	// 업무 보고 삭제
	@Override
	public void workReportDelete(int num) throws Exception {
		workReportMapper.workReportDelete(num);
	}
}
