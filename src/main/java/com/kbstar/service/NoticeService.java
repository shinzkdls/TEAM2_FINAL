package com.kbstar.service;

import com.kbstar.dto.Notice;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.NoticeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
public class NoticeService implements KBService<Integer, Notice> {

    @Autowired
    NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception {
        mapper.insert(notice);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Notice notice) throws Exception {
        mapper.update(notice);
    }

    @Override
    public Notice get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Notice> get() throws Exception {
        return mapper.selectall();
    }
}
