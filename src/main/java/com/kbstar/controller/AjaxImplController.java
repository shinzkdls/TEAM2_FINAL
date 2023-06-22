package com.kbstar.controller;

import com.kbstar.dto.Admin;
import com.kbstar.dto.Contact;
import com.kbstar.dto.Sales;
import com.kbstar.dto.UnTact;
import com.kbstar.service.AdmService;
import com.kbstar.service.ContactService;
import com.kbstar.service.MarkerService;
import com.kbstar.service.SalesService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
public class AjaxImplController {
    @Autowired
    ContactService contactService;
    @Autowired
    MarkerService markerService;
    @Autowired
    AdmService admService;
    @Autowired
    SalesService salesService;
    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;
        Admin adm = null;
        adm = admService.get(id);
        if(adm != null){
            result =1;
        }
        return result;
    };

    @RequestMapping("/saveimg")
    public String saveimg(MultipartFile file){
        String filename = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, imgdir);
        return filename;
    }


    @RequestMapping("/getdatasales")
    public Object getdatasales(String month) throws Exception {
        List<Sales> list = null;
        JSONArray ja = new JSONArray();
        for (Sales obj : list) {
            ja.add(obj.getPrice());
        }
        return ja;
    }


    @RequestMapping("/contactCnt")
    public Integer contactCnt(Model model)  {
        Map result = null;
        int cnt = 0;
        try {
//            result = contactService.contactCheck();
            cnt = contactService.contactCnt();

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
//        model.addAttribute("result", result);
        return cnt;
    }

    @RequestMapping("/contactCheck")
    public List contactCheck(Contact contact) throws Exception {
        List<UnTact> list= null;
        try{
            list = contactService.contactCheck();
        }catch (Exception e){
            e.getStackTrace();
        }
        return list;
    }
}
