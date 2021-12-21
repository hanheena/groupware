package com.teraenergy.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.login.mapper.LoginMapper;

public interface LoginService {

	public Map<String, String> get_login(Map<String, String> map) throws Exception;

}