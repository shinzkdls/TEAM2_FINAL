package com.kbstar.controller;

import com.kbstar.dto.*;
import com.kbstar.service.*;
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
    @Autowired
    Chart1Service chart1Service;
    @Autowired
    Chart2Service chart2Service;
    @Autowired
    Chart3Service chart3Service;
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


    @RequestMapping("/chart1")
    public Object chart1() throws Exception {

        List<Chart1> list = chart1Service.getGoodTotal();
        JSONArray jsonArray = new JSONArray();

        // Male 데이터를 JSONArray에 추가
        JSONArray maleArray = new JSONArray();
        for (Chart1 c : list) {
            if ("M".equalsIgnoreCase(c.getGender())) {
                maleArray.add(c.getTotal());
            }
        }
        jsonArray.add(maleArray);

        // Female 데이터를 JSONArray에 추가
        JSONArray femaleArray = new JSONArray();
        for (Chart1 c : list) {
            if ("F".equalsIgnoreCase(c.getGender())) {
                femaleArray.add(c.getTotal());
            }
        }
        jsonArray.add(femaleArray);


        JSONObject m = new JSONObject();
        JSONObject f = new JSONObject();
        m.put("name", "남성");
        m.put("data", maleArray);

        f.put("name", "여성");
        f.put("data", femaleArray);

        JSONArray data = new JSONArray();

        data.add(m);
        data.add(f);
//        log.info("data={}", data);
        return data;
    }

    @RequestMapping("/chart2")
    public Object chart2() throws Exception {
        List<Chart2> list = chart2Service.getTypeTotal();

        JSONObject korean = new JSONObject();
        JSONObject western = new JSONObject();
        JSONObject chinese = new JSONObject();
        JSONObject japanese = new JSONObject();
        JSONObject asean = new JSONObject();
        JSONObject dessert = new JSONObject();

//        log.info("list={}", list);
        for (Chart2 c : list) {
            if(c.getType().equals("한식")){
                korean.put("name", "한식");
                korean.put("y", c.getTotal());
                korean.put("z", c.getTotal());
            }else if(c.getType().equals("양식")){
                western.put("name", "양식");
                western.put("y", c.getTotal());
                western.put("z", c.getTotal());

            }else if(c.getType().equals("중식")){
                chinese.put("name", "중식");
                chinese.put("y", c.getTotal());
                chinese.put("z", c.getTotal());

            }else if(c.getType().equals("일식")){
                japanese.put("name", "일식");
                japanese.put("y", c.getTotal());
                japanese.put("z", c.getTotal());

            }else if(c.getType().equals("동남아식")){
                asean.put("name", "동남아식");
                asean.put("y", c.getTotal());
                asean.put("z", c.getTotal());

            }else{
                dessert.put("name", "디저트");
                dessert.put("y", c.getTotal());
                dessert.put("z", c.getTotal());
            }
        }

            JSONArray data = new JSONArray();

            data.add(korean);
            data.add(western);
            data.add(chinese);
            data.add(japanese);
            data.add(asean);
            data.add(dessert);

//            log.info("data={}", data);

            return data;
        }

    @RequestMapping("/chart3")
    public Object chart3() throws Exception {

        List<Chart3> list = chart3Service.getTypeTotalPayment();
        JSONObject korean = new JSONObject();
        JSONObject western = new JSONObject();
        JSONObject chinese = new JSONObject();
        JSONObject japanese = new JSONObject();
        JSONObject asean = new JSONObject();
        JSONObject dessert = new JSONObject();

        for (Chart3 c : list) {
            if(c.getType().equals("한식")){
                korean.put("data", c.getType());
                korean.put("data", c.getTotal());
            }else if(c.getType().equals("양식")){
                western.put("data", c.getType());;
                western.put("data", c.getTotal());
            }else if(c.getType().equals("중식")){
                chinese.put("data", c.getType());;
                chinese.put("data", c.getTotal());
            }else if(c.getType().equals("일식")){
                japanese.put("data", c.getType());;
                japanese.put("data", c.getTotal());
            }else if(c.getType().equals("동남아식")){
                asean.put("data", c.getType());;
                asean.put("data", c.getTotal());
            }else{
                dessert.put("data", c.getType());;
                dessert.put("data", c.getTotal());
            }
        }

        JSONArray data = new JSONArray();
        data.add(korean);
        data.add(western);
        data.add(chinese);
        data.add(japanese);
        data.add(asean);
        data.add(dessert);

        log.info("data={}", data);
        return data;
    }
}
