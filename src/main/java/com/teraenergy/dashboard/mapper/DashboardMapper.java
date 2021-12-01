package com.teraenergy.dashboard.mapper;

import java.util.List;
import java.util.Map;

//@Mapper
//@Repository
public interface DashboardMapper {
	
    public List<Object> getBoard() throws Exception;
    
//    파일 첨부
    public void insert_file(Map<String, Object> m) throws Exception;
    
}