package com.kbstar.service;

import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RecipeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class RecipeService implements KBService<Integer, RecipeBasic> {

    @Autowired
    RecipeMapper mapper;

    public RecipeService(RecipeMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(RecipeBasic recipeBasic) throws Exception {

    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(RecipeBasic recipeBasic) throws Exception {

    }

    @Override
    public RecipeBasic get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<RecipeBasic> get() throws Exception {
        return mapper.selectall();
    }

    public RecipeBasic getNew() throws Exception {
        return mapper.selectNew();
    }

    public Integer countall() throws Exception {
        return mapper.countall();
    }

}
