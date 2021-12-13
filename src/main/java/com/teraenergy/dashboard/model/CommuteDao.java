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
public class CommuteDao {
	
	private static final String NAME_SPACE = "com.teraenergy.dashboard.model.CommuteDao";
	
	@Autowired
    @Qualifier(value = "local1SqlSession")
    private SqlSession local1SqlSession;
	
	/* 출퇴근 정보 가져오기 */
	public List<Object> get_commute(int user_id, String base_date) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
        
		map.put("user_id", user_id);
		map.put("base_date", base_date);

		return local1SqlSession.selectList(NAME_SPACE + ".get_commute", map);
	}
	
	/* 출근 시간 등록 */
	public void insert_attend(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);
		
		local1SqlSession.insert(NAME_SPACE + ".insert_attend", map);
	}
	
	/* 퇴근 시간 등록 */
	public void insert_leave(Map<String, Object> m) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m", m);
		
		local1SqlSession.insert(NAME_SPACE + ".insert_leave", map);
		
	}

}


