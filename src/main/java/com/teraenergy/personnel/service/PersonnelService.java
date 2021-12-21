package com.teraenergy.personnel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.personnel.mapper.PersonnelMapper;

public interface PersonnelService{
	
	public List<Map<String, String>> listDept(Map<String, String> map) throws Exception;
	
	public List<Map<String, Object>> listDeptUser(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;

	public void updateUserInfo(Map<String, Object> map) throws Exception;

	public void updateCheckedYn(Map<String, Object> map) throws Exception;
}