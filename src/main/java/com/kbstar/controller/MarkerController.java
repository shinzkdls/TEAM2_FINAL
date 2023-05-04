package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j /*로그 찍는 골뱅이 이거 넣으면 log.info 사용가능 */
@Controller
@RequestMapping("/marker") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class MarkerController {
    @Autowired
    MarkerService markerService;
    String dir = "marker/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;
    @RequestMapping("/all")
    public Object all(Model model) throws Exception {
        List<Marker> list = null;
        list = markerService.get();
        model.addAttribute("mlist",list);
        model.addAttribute("center",dir+"all");
        return "index";
    };

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);
        model.addAttribute("gmarker",marker);
        model.addAttribute("center",dir+"detail");
        return "index";
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) throws Exception {
        markerService.remove(id);
        model.addAttribute("center",dir+"detail");
        return "redirect:/marker/all";
    }
    @RequestMapping("/updateimpl")
    public Object updateimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getSendimg();
        String new_img = mf.getOriginalFilename();

        if(new_img.equals("") || new_img == null){
            markerService.modify(marker);
        }else{
            marker.setImg(new_img);
            markerService.modify(marker);
            FileUploadUtil.saveFile(mf,imgdir);
        }
        return "redirect:/marker/detail?id="+marker.getId();
    };

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public Object addimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getSendimg();
        String img = mf.getOriginalFilename();
        marker.setImg(img);

        markerService.register(marker);
        FileUploadUtil.saveFile(mf,imgdir);
        return "redirect:/marker/all";
    };
    @RequestMapping("/search")
    public Object search(Model model, MarkerSearch ms) throws Exception {
        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms",ms);
        model.addAttribute("mlist",list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
}

