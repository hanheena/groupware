package com.teraenergy.common.mapper;

import java.util.List;
import java.util.Map;

public interface LoginMapper {
	
	public Map<String, String> login(Map<String, String > map) throws Exception;
    
}