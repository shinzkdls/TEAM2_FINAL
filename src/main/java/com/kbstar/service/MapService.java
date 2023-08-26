package com.kbstar.service;

import com.kbstar.dto.TableInfo;
import com.kbstar.mapper.MapMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class MapService {

    @Autowired
    MapMapper mapper;

    public List<Map<String, Object>> get(String table) throws Exception {
        return mapper.selectall(table);
    }

    public List<TableInfo> tableinfo(String table) throws Exception {
        return mapper.tableinfo(table);
    }
}
