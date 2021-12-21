package com.teraenergy.commonCode.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public interface CommonCodeMapper {

	List<Map<String, Object>> listCommonCode(Map<String, Object> map) throws Exception;

	Map<String, Object> selectCommonCode(Map<String, Object> map) throws Exception;

	int commonCodeValueCheck(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> listCommonCode2(Map<String, Object> map) throws Exception;

	void updateCommonCode(Map<String, Object> map);

	void insertCommonCode(Map<String, Object> map);

	Map<String, Object> lastCommonCodeSeqNum(Map<String, Object> map) throws Exception;
}