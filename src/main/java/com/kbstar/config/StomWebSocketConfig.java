package com.kbstar.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import javax.annotation.PostConstruct;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer{

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
                .setAllowedOrigins("http://127.0.0.1")
                .setAllowedOriginPatterns("*")
                .withSockJS();
        registry.addEndpoint("/chbot")
                .setAllowedOrigins("http://127.0.0.1")
                .setAllowedOriginPatterns("*")
                .withSockJS();
        registry.addEndpoint("/wss")
                .setAllowedOrigins("http://127.0.0.1")
                .setAllowedOriginPatterns("*")
                .withSockJS();
    }

    /* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/broadcast");
    }

    @Configuration
    static
    class FcmConfig {
        public String firebaseConfig = "fcm_admin.json";

        @PostConstruct
        public void init(){
            try{
                FirebaseOptions options = new FirebaseOptions.Builder()
                        .setCredentials( GoogleCredentials
                                .fromStream(new ClassPathResource(firebaseConfig).getInputStream()))
                        .build();
                FirebaseApp.initializeApp(options);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}