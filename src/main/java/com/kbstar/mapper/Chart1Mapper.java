package com.kbstar.mapper;

import com.kbstar.dto.Chart1;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@Mapper
public interface Chart1Mapper {
    List<Chart1> getGoodTotal();
}
