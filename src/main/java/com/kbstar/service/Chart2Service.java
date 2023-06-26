package com.kbstar.service;

import com.kbstar.dto.Chart2;
import com.kbstar.mapper.Chart2Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Chart2Service {
    @Autowired
    Chart2Mapper chart2Mapper;
    public List<Chart2> getTypeTotal() throws Exception{
        return chart2Mapper.getTypeTotal();
    }

}
