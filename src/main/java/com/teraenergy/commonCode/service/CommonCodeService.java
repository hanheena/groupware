package com.teraenergy.commonCode.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.commonCode.mapper.CommonCodeMapper;

public interface CommonCodeService{

	public List<Map<String, Object>> listCommonCode(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectCommonCode(Map<String, Object> map) throws Exception ;

	public int commonCodeValueCheck(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> listCommonCode2(Map<String, Object> map) throws Exception;

	public void updateCommonCode(Map<String, Object> map);

	public void insertCommonCode(Map<String, Object> map);

	public Map<String, Object> lastCommonCodeSeqNum(Map<String, Object> map) throws Exception;
}