package com.teraenergy.personnel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

public interface PersonnelMapper {
	
	public List<Map<String, String>> listDept(Map<String, String> map) throws Exception;
	
	public List<Map<String, Object>> listDeptUser(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;
	
	public void updateUserInfo(Map<String, Object> map) throws Exception;

	public void updateCheckedYn(Map<String, Object> map) throws Exception;

}