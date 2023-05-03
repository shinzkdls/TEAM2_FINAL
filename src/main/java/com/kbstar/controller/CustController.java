package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Slf4j /*로그 찍는 골뱅이 이거 넣으면 log.info 사용가능 */
@Controller
@RequestMapping("/cust") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class CustController {
    @Autowired
    CustService custService;
    @Autowired
    private BCryptPasswordEncoder encoder; /*패스워드를 암호화해서 저장한다*/
    String dir = "cust/";
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e:es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "<h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.register(cust);
        return "redirect:/cust/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        model.addAttribute("clist",list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model,String id) throws Exception {
        Cust cust = null;
        cust = custService.get(id);
        model.addAttribute("gcust",cust);
        model.addAttribute("center",dir+"detail");
        return "index";
    }

    @RequestMapping("/deleteimpl")
    public String delete(Model model,String id) throws Exception {
        custService.remove(id);
        model.addAttribute("center",dir+"detail");
        return "redirect:/cust/all";
    }
    @RequestMapping("/updateimpl")
        public String updateimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
            if(errors.hasErrors()){
                List<ObjectError> es = errors.getAllErrors();
                String msg = "";
                for(ObjectError e:es){
                    msg += "<h4>";
                    msg += e.getDefaultMessage();
                    msg += "<h4>";
                }
                throw new Exception(msg);
            }
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.modify(cust);
            return "redirect:/cust/detail?id="+cust.getId();
        }

}
