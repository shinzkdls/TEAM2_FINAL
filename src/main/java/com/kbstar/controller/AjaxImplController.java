package com.kbstar.controller;

import com.kbstar.dto.Admin;
import com.kbstar.dto.Sales;
import com.kbstar.service.AdmService;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class AjaxImplController {
    @Autowired
    MarkerService markerService;
    @Autowired
    AdmService admService;
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


//    @RequestMapping("/getdatasales")
//    public Object getdatasales(String month) throws Exception {
//        List<Sales> list = null;
//        list = salesService.getdatasales(month);
//        JSONArray ja = new JSONArray();
//        for (Sales obj : list) {
//            ja.add(obj.getPrice());
//        }
//        return ja;
//    }


}
