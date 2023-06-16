package com.kbstar.adm;

import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class SelectAllTest {

    @Autowired
    AdmService service;
    @Test
void contextLoads() {
//    List<Admin> list = null;
//    try {
//        list = service.get();
//    } catch (Exception e) {
//        log.info("조회 에러......");
//        e.printStackTrace();
//        }
    }
}

