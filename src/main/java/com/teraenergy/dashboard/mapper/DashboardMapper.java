package com.teraenergy.dashboard.mapper;

import java.util.List;
import java.util.Map;

//@Mapper
//@Repository
public interface DashboardMapper {
	
    public List<Object> getBoard() throws Exception;
    
	/* 캘린더 정보 select */
    public List<Object> getCalender() throws Exception;
    
	/* 이미지 첨부 예시 소스 */
    /*ublic void insert_file(Map<String, Object> m) throws Exception;*/
    
}