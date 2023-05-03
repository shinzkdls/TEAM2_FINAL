package com.kbstar.controller;

import com.kbstar.dto.EmpDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/tables") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class TableController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "tables/"; //폴더명을 변수로 넣기

    //127.0.0.1/tables
    @RequestMapping("")
    public String index(Model model) {
        List<EmpDTO> list = new ArrayList<>();


        model.addAttribute("allemp",list);
        model.addAttribute("center",dir+"tables");
        return "index";

    };

}
