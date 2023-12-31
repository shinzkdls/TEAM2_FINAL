package com.kbstar.mapper;

import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ClassMapper extends KBMapper<Integer, ClassBasic> {
    public ClassBasic selectNew();

    public Integer countall() throws Exception;


    public Integer earnings() throws Exception;
}