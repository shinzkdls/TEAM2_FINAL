package com.kbstar.service;

import com.kbstar.dto.Admin;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.AdmMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class AdmService implements KBService<String, Admin> {
    @Autowired
    AdmMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param adm
     **/
    @Override
    public void register(Admin adm) throws Exception {
        mapper.insert(adm);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Admin adm) throws Exception {
        mapper.update(adm);
    }

    @Override
    public Admin get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Admin> get() throws Exception {
        return mapper.selectall();
    }
}
