package com.teraenergy.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teraenergy.login.mapper.LoginMapper;

@Repository
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper loginMapper;

	@Override
	public Map<String, String> get_login(Map<String, String> map) throws Exception {

		return loginMapper.get_login(map);
	}

}