package com.kbstar.adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    AdmService service;
    @Test
void contextLoads() {

//    try {
//        service.modify(new Adm("id01","pwd05",3));
//        } catch (Exception e) {
//        log.info("업데이트 에러......");
//        e.printStackTrace();
//        }
    }
}

