package com.teraenergy.personnel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.personnel.mapper.PersonnelMapper;
import com.teraenergy.workReport.service.WorkReportService;

@Repository
public class PersonnelServiceImpl implements PersonnelService {

	@Autowired
	private PersonnelMapper personnelMapper;

	public List<Map<String, String>> listDept(Map<String, String> map) throws Exception {
		return personnelMapper.listDept(map);
	}

	public List<Map<String, Object>> listDeptUser(Map<String, Object> map) throws Exception {
		return personnelMapper.listDeptUser(map);
	}

	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
		return personnelMapper.selectUserInfo(map);
	}

	public void updateUserInfo(Map<String, Object> map) throws Exception {
		personnelMapper.updateUserInfo(map);
	}

	public void updateCheckedYn(Map<String, Object> map) throws Exception {
		personnelMapper.updateCheckedYn(map);
	}
}