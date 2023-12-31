package com.kbstar.service;

import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CustService implements KBService<String, Cust> {

    @Autowired
    CustMapper mapper;

    @Override
    public void register(Cust cust) throws Exception {
    }

    @Override
    public void remove(String s) throws Exception {
    }

    @Override
    public void modify(Cust cust) throws Exception {
    }

    @Override
    public Cust get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }

    public List<Integer> countall() throws Exception {
        return mapper.countall();
    }
}
