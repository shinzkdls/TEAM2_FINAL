package com.kbstar.service;

import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ClassMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Slf4j
public class ClassService implements KBService<Integer, ClassBasic> {

    @Autowired
    ClassMapper mapper;

    public ClassService(ClassMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(ClassBasic classBasic) throws Exception {

    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(ClassBasic classBasic) throws Exception {

    }

    @Override
    public ClassBasic get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<ClassBasic> get() throws Exception {
        return mapper.selectall();
    }
}
