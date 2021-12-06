package com.teraenergy.dashboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.dashboard.mapper.ScheduleMapper;

@Repository
public class ScheduleService implements ScheduleMapper {

	@Autowired
	ScheduleMapper schedulemapper;
	
	/* 캘린더 일정 정보 가져오기 */
    @Override
    public List<Object> get_calender() throws Exception{
        return schedulemapper.get_calender();
    }
    
	/* 일정 등록 */
	@Override
	public void insert_schedule(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);

		schedulemapper.insert_schedule(map);
		
	}
	
	/* 일정 수정 */
	@Override
	public void update_schedule(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);

		schedulemapper.update_schedule(map);
		
	}
	
	/* 일정 삭제 */
	@Override
	public void delete_schedule(int id_num) throws Exception {
		
		
		schedulemapper.delete_schedule(id_num);
	}

}


