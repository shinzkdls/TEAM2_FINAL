package com.kbstar.mapper;

import com.kbstar.dto.Item;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RecipeMapper extends KBMapper<Integer, RecipeBasic> {
    public RecipeBasic selectNew();
}