package com.teraenergy.test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Mapper;
import com.teraenergy.test.model.Board;

@Mapper
@Repository
public interface BoardMapper {
	
    public List<Board> getBoard() throws Exception;
    
}