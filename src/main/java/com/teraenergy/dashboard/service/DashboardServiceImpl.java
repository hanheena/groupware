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
import com.teraenergy.dashboard.service.DashboardService;

@Repository
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private DashboardMapper dashboardMapper;

	/* 테스트 select */
	@Override
	public List<Object> getBoard() throws Exception {

		return dashboardMapper.getBoard();
	}
}