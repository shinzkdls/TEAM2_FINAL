package com.kbstar.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/livechart")
public class LiveChartController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "livechart/"; // 매번, livechart 라는 폴더 경로를 붙이기 귀찮을 때.

    // 상단 - livechart 클릭 시 나오는 기본 페이지
    @RequestMapping("")
    public String livechart(Model model){
        model.addAttribute("center", dir + "center"); // livechart 라는 폴더 내 center로 변환된다.
        model.addAttribute("leftNav", dir + "leftNav");
        return "index";
    }

}