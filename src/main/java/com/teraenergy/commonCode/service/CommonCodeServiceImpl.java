package com.teraenergy.commonCode.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.teraenergy.commonCode.mapper.CommonCodeMapper;
import com.teraenergy.commonCode.service.CommonCodeService;

@Repository
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	private CommonCodeMapper commonCodeMapper;

	@Override
	public List<Map<String, Object>> listCommonCode(Map<String, Object> map) throws Exception {
		return commonCodeMapper.listCommonCode(map);
	}

	@Override
	public Map<String, Object> selectCommonCode(Map<String, Object> map) throws Exception {
		return commonCodeMapper.selectCommonCode(map);
	}

	@Override
	public int commonCodeValueCheck(Map<String, Object> map) throws Exception {
		return commonCodeMapper.commonCodeValueCheck(map);
	}

	@Override
	public List<Map<String, Object>> listCommonCode2(Map<String, Object> map) throws Exception {
		return commonCodeMapper.listCommonCode2(map);
	}

	@Override
	public void updateCommonCode(Map<String, Object> map) {
		commonCodeMapper.updateCommonCode(map);
	}

	@Override
	public void insertCommonCode(Map<String, Object> map) {
		commonCodeMapper.insertCommonCode(map);
	}

	@Override
	public Map<String, Object> lastCommonCodeSeqNum(Map<String, Object> map) throws Exception {
		return commonCodeMapper.lastCommonCodeSeqNum(map);
	}
}