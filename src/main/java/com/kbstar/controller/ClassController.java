package com.kbstar.controller;

import com.kbstar.dto.ClassBasic;
import com.kbstar.dto.TableInfo;
import com.kbstar.service.ClassService;
import com.kbstar.service.MapService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/class")
public class ClassController {
    @Autowired
    ClassService classService;
    @Autowired
    MapService mapService;
    String dir = "class/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String imgdir;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<ClassBasic> classList = classService.get();
        List<TableInfo> tableInfos = mapService.tableinfo("CLASS_BASIC");
        List<Map<String, Object>> mapList = mapService.get("CLASS_BASIC");
        log.info(mapList.toString());
        log.info(tableInfos.toString());
        log.info(String.valueOf(mapList.size()));
        log.info(String.valueOf(tableInfos.size()));
        model.addAttribute("mapList", mapList);
        model.addAttribute("tableInfos", tableInfos);
        model.addAttribute("classList", classList);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer classpin) throws Exception {
        classService.remove(classpin);
        return "redirect:/class/all";
    }
}