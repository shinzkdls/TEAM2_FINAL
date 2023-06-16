package com.kbstar;

import com.kbstar.dto.Cust;
import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
@SpringBootTest
@Slf4j
class LombokTest {
	@Autowired
	ChatgptService chatgptService;
	@Test
	void contextLoads() throws ParseException {
		String str = chatgptService.sendMessage("한국에서 가장 유명한것이 뭐니");
		log.info("------------------------------------");
		log.info(str);
		String imageUrl = chatgptService.imageGenerate("boy");
		log.info(imageUrl);  // image url

	}

}
