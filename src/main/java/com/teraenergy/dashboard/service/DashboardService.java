package com.teraenergy.dashboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teraenergy.dashboard.mapper.DashboardMapper;

//@Service
@Repository
public class DashboardService implements DashboardMapper {
	
    @Autowired
    DashboardMapper dashboardmapper;
	
    @Override
    public List<Object> getBoard() throws Exception{
        return dashboardmapper.getBoard();
    }
    
    /* 캘린더 정보 select */
    @Override
    public List<Object> getCalender() throws Exception{
        return dashboardmapper.getCalender();
    }
    
    /* 이미지 첨부 예시 소스 */
	/*
	 * @Override public void insert_file(Map<String, Object> m) throws Exception {
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * map.put("m", m);
	 * 
	 * System.out.println("파일 맵 확인 : " +m);
	 * 
	 * dashboardmapper.insert_file(m); }
	 */
}