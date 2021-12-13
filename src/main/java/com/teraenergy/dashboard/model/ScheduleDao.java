package com.teraenergy.dashboard.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao{
	
	private static final String NAME_SPACE = "com.teraenergy.dashboard.model.ScheduleDao";

	@Autowired
    @Qualifier(value = "local1SqlSession")
	private SqlSession local1SqlSession;
	
	/* 캘린더 일정 정보 가져오기 */
    public List<Object> get_calender() throws Exception{
    	
        return local1SqlSession.selectList(NAME_SPACE + ".get_calender");
    }
    
	/* 일정 등록 */
	public void insert_schedule(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);

		local1SqlSession.insert(NAME_SPACE + ".insert_attend", map);
	}
	
	/* 일정 수정 */
	public void update_schedule(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);
		
		local1SqlSession.update(NAME_SPACE + ".update_schedule", map);
	}
	
	/* 일정 삭제 */
	public void delete_schedule(int id_num) throws Exception {
		
		local1SqlSession.delete(NAME_SPACE + ".delete_schedule", id_num);
	}

}


