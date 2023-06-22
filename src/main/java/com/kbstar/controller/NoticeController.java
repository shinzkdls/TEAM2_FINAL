package com.kbstar.controller;

import com.kbstar.dto.Contact;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Notice;
import com.kbstar.service.CustService;
import com.kbstar.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j /*로그 찍는 골뱅이 이거 넣으면 log.info 사용가능 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;
    String dir = "notice/";

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Integer adminpin, String noticetitle, String noticecontent) throws Exception {
        System.out.println(adminpin+noticecontent+noticetitle+"<<<<<");
        Notice notice =new Notice(adminpin, noticetitle, noticecontent);
        try{
            noticeService.register(notice);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Notice> noticeList = noticeService.get();
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("center",dir + "all");
        return "index";
    }

}
