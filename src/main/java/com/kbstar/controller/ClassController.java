package com.kbstar.controller;

import com.kbstar.dto.ClassBasic;
import com.kbstar.service.ClassService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/class")
public class ClassController {
    @Autowired
    ClassService classService;
    String dir = "class/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<ClassBasic> classList = classService.get();
        model.addAttribute("classList", classList);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer classpin) throws Exception {
        classService.remove(classpin);
        return "redirect:/class/all";
    }
}