package com.kbstar.mapper;

import com.kbstar.dto.Chart2;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface Chart2Mapper {
    List<Chart2> getTypeTotal();
}
