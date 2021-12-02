package com.teraenergy.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teraenergy.test.mapper.TestMapper;

@Repository
public class TestService implements TestMapper {
	
    @Autowired
    TestMapper testmapper;
	
    public List<Object> getUserinfo() throws Exception{
        return testmapper.getUserinfo();
    }
}