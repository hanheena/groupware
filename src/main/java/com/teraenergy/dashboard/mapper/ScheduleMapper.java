package com.teraenergy.dashboard.mapper;

import java.util.List;
import java.util.Map;

// @Mapper //@Repository 
public interface ScheduleMapper {

	/* 캘린더 일정 정보 가져오기 */
	public List<Object> get_calender() throws Exception;

	/* 일정 등록 */
	public void insert_schedule(Map<String, Object> m) throws Exception;
	
	/* 일정 수정 */
	public void update_schedule(Map<String, Object> m) throws Exception;
	
	/* 일정 삭제 */
	public void delete_schedule(int id_num) throws Exception;
}
