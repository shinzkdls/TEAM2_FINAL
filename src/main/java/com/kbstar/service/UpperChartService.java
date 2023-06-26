package com.kbstar.service;

import com.kbstar.dto.Chart1;
import com.kbstar.dto.UpperChart;
import com.kbstar.mapper.UpperChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UpperChartService {
    @Autowired
    UpperChartMapper upperChartMapper;
    public UpperChart getCustTotal() throws Exception{
        return upperChartMapper.getCustTotal();
    }
}
