package com.kbstar.mapper;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ContactMapper extends KBMapper<Integer, Contact> {
    public void registerResponse(Contact contact);
    public List contactCheck();
    public Integer contactCnt();
}
