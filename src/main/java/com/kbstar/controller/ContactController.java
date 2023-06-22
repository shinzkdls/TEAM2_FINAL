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
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
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
    @RequestMapping("/detail")
    public String detail(Model model, Integer contactpin) throws Exception {
        Contact obj = contactService.get(contactpin);
        model.addAttribute("obj", obj);
        model.addAttribute("center",dir + "detail");
        return "index";
    }
    @RequestMapping("/update")
    public String update(Contact contact) throws Exception {
        try{
            contactService.registerResponse(contact);
        }catch (Exception e){
            e.getStackTrace();
        }
        return "redirect:/contact/detail?contactpin="+contact.getContactpin();
        //return "redirect:/contact/all";
    }
}
