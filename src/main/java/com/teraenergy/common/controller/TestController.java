package com.teraenergy.common.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.common.service.TestService;


@Controller
public class TestController {
	
	@Autowired
    TestService s;
    
    @RequestMapping("/userInfoList")
    public @ResponseBody List<Object> userInfoList() throws Exception{
    	
    	List<Object> getData = s.getUserinfo();
    	
        return getData;
    }
}
