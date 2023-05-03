package com.kbstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Random;

@Controller
@RequestMapping("/charts") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨

public class ChartController {
    String dir = "charts/"; //폴더명을 변수로 넣기
    @RequestMapping("")
    public String index(Model model) {

        model.addAttribute("center", dir + "charts");
        return "index";
    }
}
