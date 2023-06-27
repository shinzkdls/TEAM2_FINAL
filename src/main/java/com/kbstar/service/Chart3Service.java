package com.kbstar.service;

import com.kbstar.dto.Chart2;
import com.kbstar.dto.Chart3;
import com.kbstar.mapper.Chart2Mapper;
import com.kbstar.mapper.Chart3Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Chart3Service {
    @Autowired
    Chart3Mapper chart3Mapper;
    public List<Chart3> getTypeTotalPayment() throws Exception{
        return chart3Mapper.getTypeTotalPayment();
    }

}
