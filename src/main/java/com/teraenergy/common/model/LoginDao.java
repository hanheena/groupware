package com.teraenergy.common.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class LoginDao{
	
	private static final String NAME_SPACE = "com.teraenergy.common.model.LoginDao";
	
	@Autowired
    @Qualifier(value = "commonSqlSession")
    private SqlSession commonSqlSession;
	
	
    public Map<String, String> login(Map<String, String> map) throws Exception {
		
		return commonSqlSession.selectOne(NAME_SPACE + ".login", map);
	}
    
}