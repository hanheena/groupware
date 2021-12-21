package com.teraenergy.workReport.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

public interface WorkReportMapper {

	// 업무보고 게시판 리스츠
	List<Map<String, Object>> workReportList(Map<String, Object> map) throws Exception;

	// 업무보고 작성
	void workReportSave(Map<String, Object> map) throws Exception;

	// 업무보고 상세 조회
	Map<String, Object> workReportDetail(Map<String, Object> map) throws Exception;

	// 업무보고 수정
	int workReportChange(Map<String, Object> map) throws Exception;

	// 업무보고 삭제
	public void workReportDelete(int num) throws Exception;
}
