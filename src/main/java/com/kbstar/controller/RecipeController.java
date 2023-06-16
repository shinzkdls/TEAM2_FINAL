package com.kbstar.controller;

import com.kbstar.dto.RecipeBasic;
import com.kbstar.service.RecipeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {
    @Autowired
    RecipeService recipeService;
    String dir = "recipe/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<RecipeBasic> recipeList = recipeService.get();
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("center",dir + "all");
        return "index";
    }

//    @RequestMapping("/add")
//    public String add(Model model){
//        model.addAttribute("center",dir+"add");
//        return "index";
//    }
//    @RequestMapping("/addimpl")
//    public String addimpl(Model model, Item item) throws Exception {
//        MultipartFile mf = item.getImg();
//        String imgname = mf.getOriginalFilename();
////        log.info("---------------------------------------------------------------------");
////        log.info(imgname);
////        log.info("---------------------------------------------------------------------"); 확인용 로그.인포
//        item.setImgname(imgname);
//        itemService.register(item);
//        FileUploadUtil.saveFile(mf,imgdir);
//        return "redirect:/item/all";
//    }
//    @RequestMapping("/detail")
//    public String detail(Model model, int id) throws Exception {
//        Item item = null;
//        item = itemService.get(id);
//        model.addAttribute("gitem",item);
//        model.addAttribute("center",dir+"detail");
//        return "index";
//    }
//
//    @RequestMapping("/updateimpl")
//    public String updateimpl(Model model, Item item) throws Exception {
//        MultipartFile mf = item.getImg();
//        String new_imgname = mf.getOriginalFilename();
//
//      if(new_imgname.equals("") || new_imgname == null){
//           itemService.modify(item);
//        }else{
//            item.setImgname(new_imgname);
//            itemService.modify(item);
//            FileUploadUtil.saveFile(mf,imgdir);
//        }
///*        if(!imgname.equals("") || imgname != null){
//            item.setImgname(imgname);
//            FileUploadUtil.saveFile(mf,imgdir);
//        }
//        itemService.modify(item);*/
//        return "redirect:/item/detail?id="+item.getId();
//    }
//    @RequestMapping("/deleteimpl")
//    public String delete(Model model,int id) throws Exception {
//        itemService.remove(id);
//        model.addAttribute("center",dir+"detail");
//        return "redirect:/item/all";
//    }
}