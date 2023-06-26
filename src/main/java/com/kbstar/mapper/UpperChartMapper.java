package com.kbstar.mapper;

import com.kbstar.dto.UpperChart;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@Mapper
public interface UpperChartMapper {
    public UpperChart getCustTotal();
}
