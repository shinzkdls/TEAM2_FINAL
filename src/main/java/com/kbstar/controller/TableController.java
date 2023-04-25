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
        list.add(new EmpDTO("가파쿠1","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠2","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠3","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠4","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠5","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠6","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠7","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠8","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠9","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠10","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠11","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠12","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠13","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠14","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠15","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠16","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠17","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠18","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠19","사장","서울",250,new Date(),1000000));
        list.add(new EmpDTO("가파쿠20","사장","서울",250,new Date(),1000000));

        model.addAttribute("allemp",list);
        model.addAttribute("center",dir+"tables");
        return "index";

    };

}
