package com.teraenergy.dashboard.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class DashboardDao{
	
	private static final String NAME_SPACE = "com.teraenergy.dashboard.model.DashboardDao";
	
	@Autowired
    @Qualifier(value = "local1SqlSession")
    private SqlSession local1SqlSession;
	
	/* 테스트 select */
    public List<Object> getBoard() throws Exception{
    	
    	return local1SqlSession.selectList(NAME_SPACE + ".getBoard");
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