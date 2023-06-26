package com.kbstar.service;

import com.kbstar.dto.Chart1;
import com.kbstar.mapper.Chart1Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Chart1Service {
    @Autowired
    Chart1Mapper chart1Mapper;
    public List<Chart1> getGoodTotal() throws Exception{
        return chart1Mapper.getGoodTotal();
    }

}
