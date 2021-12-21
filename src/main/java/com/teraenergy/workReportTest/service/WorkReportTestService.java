package com.teraenergy.workReportTest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.workReportTest.mapper.WorkReportTestMapper;

public interface WorkReportTestService {

	// 업무보고 게시판 리스트
	public List<Map<String, Object>> workReportList(Map<String, Object> map) throws Exception;

	// 업무 보고 작성
	public void workReportSave(Map<String, Object> map) throws Exception;

	// 업무 보고 상세 조회
	public Map<String, Object> workReportDetail(Map<String, Object> map) throws Exception;

	// 업무 보고 수정
	public int workReportChange(Map<String, Object> map) throws Exception;

	// 업무 보고 삭제
	public void workReportDelete(int num) throws Exception;
}
