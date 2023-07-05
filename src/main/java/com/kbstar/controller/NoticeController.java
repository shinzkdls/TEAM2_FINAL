package com.kbstar.controller;

import com.kbstar.dto.Contact;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Notice;
import com.kbstar.service.CustService;
import com.kbstar.service.NoticeService;
import com.kbstar.util.PushNotificationUtil;
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
    @Autowired
    PushNotificationUtil pushNotificationUtil;
    String dir = "notice/";

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Integer adminpin, String noticetitle, String noticecontent, String checkboxName) throws Exception {
        String userToken = "eJqBEpgeRYey1KxcQ5d88W:APA91bFb566XCq2SThdatny14tx4iyJfbsjxE5dBjR1cQJ8we0H2lvzYWWFAW2d2WL98A_ycCiFIjVV94Dkdr1_GrqvLxvV1Hpi0jgSHoPcjrToJPhd1zX-l48QJIMBVu1sEOWN3d_Yg";
        String imgUrl = "https://www.w3schools.com/css/img_5terre.jpg";
        Notice notice = new Notice(adminpin, noticetitle, noticecontent);

        if(checkboxName == null){
            noticeService.register(notice);
        }else {
            noticeService.register(notice);
            pushNotificationUtil.sendTargetMessage(notice.getNoticetitle(), notice.getNoticecontent(), "/", userToken);
        }
        return "redirect:/notice/all";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer noticepin) throws Exception {
        noticeService.remove(noticepin);
        return "redirect:/notice/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Notice> noticeList = noticeService.get();
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Integer noticepin) throws Exception {
        Notice obj = noticeService.get(noticepin);
        model.addAttribute("obj", obj);
        model.addAttribute("center",dir + "detail");
        return "index";
    }
}
