package com.kbstar.marker;

import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@Slf4j // 로그 찍을거야
@SpringBootTest
class SearchTest {
    @Autowired
    MarkerService service;
    @Test
    void contextLoads() {
        try {
            MarkerSearch ms = new MarkerSearch("","s");
            service.search(ms);
        } catch (Exception e) { // 오류 예외처리(자동)
           log.info("--------------------------  Marker(맛집추천) 전체조회 에러 발생 --------------------------------------------");
        }
    }
}
