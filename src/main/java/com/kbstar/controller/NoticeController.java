package com.kbstar.controller;

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
    public String addImpl(Notice notice) throws Exception {
        noticeService.register(notice);
        return "redirect:/";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Notice> noticeList = noticeService.get();
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("center",dir + "all");
        return "index";
    }


//    @RequestMapping("/detail")
//    public String detail(Model model,String id) throws Exception {
//        Cust cust = null;
//        cust = custService.get(id);
//        model.addAttribute("gcust",cust);
//        model.addAttribute("center",dir+"detail");
//        return "index";
//    }
//
//    @RequestMapping("/deleteimpl")
//    public String delete(Model model,String id) throws Exception {
//        custService.remove(id);
//        model.addAttribute("center",dir+"detail");
//        return "redirect:/cust/all";
//    }
//    @RequestMapping("/updateimpl")
//        public String updateimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
//            if(errors.hasErrors()){
//                List<ObjectError> es = errors.getAllErrors();
//                String msg = "";
//                for(ObjectError e:es){
//                    msg += "<h4>";
//                    msg += e.getDefaultMessage();
//                    msg += "<h4>";
//                }
//                throw new Exception(msg);
//            }
//            cust.setPwd(encoder.encode(cust.getPwd()));
//            custService.modify(cust);
//            return "redirect:/cust/detail?id="+cust.getId();
//        }
}
