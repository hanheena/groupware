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

import com.teraenergy.dashboard.mapper.ScheduleMapper;

public interface ScheduleService {

	/* 캘린더 일정 정보 가져오기 */
	public List<Object> get_calender() throws Exception;

	/* 일정 등록 */
	public void insert_schedule(Map<String, Object> m) throws Exception;

	/* 일정 수정 */
	public void update_schedule(Map<String, Object> m) throws Exception;

	/* 일정 삭제 */
	public void delete_schedule(int id_num) throws Exception;
	
	/* 부서 별 이름 불러오기 */
	public List<Object> select_department(String param);
}
