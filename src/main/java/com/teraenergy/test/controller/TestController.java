package com.teraenergy.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teraenergy.test.model.Board;
import com.teraenergy.test.service.BoardService;

@Controller
public class TestController {
	
	@Autowired
    BoardService s;
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard() {
        return "/dashboard/dashboard";
    }
    
    @RequestMapping("/boardList")
    public @ResponseBody List<Board> boardList() throws Exception{
        return s.getBoard();
    }
}
