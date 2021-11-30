package com.teraenergy.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teraenergy.test.mapper.BoardMapper;
import com.teraenergy.test.model.Board;

@Service
public class BoardService {
	
    @Autowired
    BoardMapper boardmapper;
	
    public List<Board> getBoard() throws Exception{
        return boardmapper.getBoard();
    }
}