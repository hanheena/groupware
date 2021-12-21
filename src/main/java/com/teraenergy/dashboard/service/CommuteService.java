package com.teraenergy.dashboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.dashboard.mapper.CommuteMapper;

public interface CommuteService {
	
	/* 출퇴근 정보 가져오기 */
	public List<Object> get_commute(Map<String, Object> m) throws Exception;
	
	/* 출근 시간 등록 */
	public void insert_attend(Map<String, Object> m) throws Exception;
	
	/* 퇴근 시간 등록 */
	public void insert_leave(Map<String, Object> m) throws Exception;

}


