package com.kbstar.controller;

import com.kbstar.dto.Contact;
import com.kbstar.dto.Notice;
import com.kbstar.mapper.ContactMapper;
import com.kbstar.service.ContactService;
import com.kbstar.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j /*로그 찍는 골뱅이 이거 넣으면 log.info 사용가능 */
@Controller
@RequestMapping("/contact")
public class ContactController {
    @Autowired
    ContactService contactService;
    String dir = "contact/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Contact> contactList = contactService.get();
        model.addAttribute("contactList", contactList);
        model.addAttribute("center",dir + "all");
        return "index";
    }
}
