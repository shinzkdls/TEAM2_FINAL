package com.kbstar.mapper;

import com.kbstar.dto.Admin;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdmMapper extends KBMapper<String, Admin> {
}
