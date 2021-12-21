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
import com.teraenergy.dashboard.service.ScheduleService;

@Repository
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleMapper scheduleMapper;

	/* 캘린더 일정 정보 가져오기 */
	@Override
	public List<Object> get_calender() throws Exception {

		return scheduleMapper.get_calender();
	}

	/* 일정 등록 */
	@Override
	public void insert_schedule(Map<String, Object> m) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("m", m);

		scheduleMapper.insert_schedule(map);
	}

	/* 일정 수정 */
	@Override
	public void update_schedule(Map<String, Object> m) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("m", m);

		scheduleMapper.update_schedule(map);
	}

	/* 일정 삭제 */
	@Override
	public void delete_schedule(int id_num) throws Exception {

		scheduleMapper.delete_schedule(id_num);
	}
	
	/* 부서 별 이름 불러오기 */
	@Override
	public List<Object> select_department(String param) {
		// TODO Auto-generated method stub
		return scheduleMapper.select_department(param);
	}
}
