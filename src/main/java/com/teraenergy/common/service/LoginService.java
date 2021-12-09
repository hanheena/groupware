package com.teraenergy.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teraenergy.common.mapper.LoginMapper;

@Repository
public class LoginService implements LoginMapper {
	
    @Autowired
    LoginMapper loginMapper;
	
    @Override
    public Map<String, String> login(Map<String, String> map) throws Exception {
		System.out.println("!@!@!@");
		System.out.println(map);
		return loginMapper.login(map);
	}
    
}