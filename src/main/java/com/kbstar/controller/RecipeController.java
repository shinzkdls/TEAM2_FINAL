package com.kbstar.controller;

import com.kbstar.dto.RecipeBasic;
import com.kbstar.service.RecipeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {
    @Autowired
    RecipeService recipeService;
    String dir = "recipe/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<RecipeBasic> recipeList = recipeService.get();
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer recipepin) throws Exception {
        recipeService.remove(recipepin);
        return "redirect:/recipe/all";
    }
}