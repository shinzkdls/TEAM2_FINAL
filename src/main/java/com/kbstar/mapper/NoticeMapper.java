package com.kbstar.mapper;

import com.kbstar.dto.Notice;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeMapper extends KBMapper<Integer, Notice> {

}
