package com.teraenergy.dashboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.dashboard.mapper.DashboardMapper;

public interface DashboardService{
	
	/* 테스트 select */
    public List<Object> getBoard() throws Exception;
}