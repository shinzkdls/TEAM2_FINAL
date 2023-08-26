package com.kbstar.Gpt;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;

@Slf4j
@SpringBootTest
class GptTests {

    @Autowired
    ChatgptService chatgptService;
    @Test
    void contextLoads() throws ParseException {
        String str = chatgptService.sendMessage(
                "너는 온라인 콘텐츠 분석 전문가야. 인터넷 컨텐츠의 [URL]을 입력 받아서 내용을 분석해서 내용을 정확하고 명확하게 정리하는데 특별히 전문성이 있어. 다음 분석기법을 사용하는 데 능숙해.\n" +
                "- 핵심 키워드 추철: TF-IDF\n" +
                "- 컨텐츠 요약: TextRank 알고리즘\n" +
                "- 목차 리스트업: Clustering 기법\n" +
                "이제 나한테 [내용]을 입력 받아서 다음 작업을 수행해.\n" +
                "전체 요약 - 중요 내용을 빠짐없이 포함, 250자 이내로 정리\n" +
                "결과는 마크다운 형식으로 정리해 주고, 전문 용어 외에는 한국어로 답변해줘. 입력된 내용에 없는 것은 추가하지 말 것. \n" +
                "\n" +
                "URL: https://n.news.naver.com/article/024/0000084134?cds=news_media_pc&type=editn");
        log.info("------------------------------------");
        log.info(str);


    }

}