package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import com.kbstar.service.MarkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxImplController {
    @Autowired
    MarkerService markerService;
    @Autowired
    AdmService admService;

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;
        Adm adm = null;
        adm = admService.get(id);
        if(adm != null){
            result =1;
        }
        return result;
    };


}
