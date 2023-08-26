package com.kbstar.mapper;

import com.kbstar.dto.TableInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MapMapper {
    public List<Map<String, Object>> selectall(String table);

    public List<TableInfo> tableinfo(String table);
}
