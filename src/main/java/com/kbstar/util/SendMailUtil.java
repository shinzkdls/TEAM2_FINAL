package com.kbstar.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Component
public class SendMailUtil {
    @Autowired
    JavaMailSender emailSender;
    @Value("${adminmail.id}")
    private String id;
    private MimeMessage createMessage(String to, String msg)throws Exception{

        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(Message.RecipientType.TO, to);//보내는 대상
        message.setSubject("Kolly On the Table의 회원이 되신 것을 축하드립니다!");//제목

        String msgg="";
        msgg+= "<div style='margin:10px;'>";
        msgg+= "<img src=\"https://postfiles.pstatic.net/MjAyMzA2MTlfOTYg/MDAxNjg3MTU4MTM0NjQ0.X1dvra7Q30SHitO1BarUpbOQp-bkw8SMZ6f3yrx1bgYg.QCIO7VZGgk7B1UxRyzsAIi7lvSVbB2pbTzyEp6sX7hkg.PNG.jhs4132/1.png?type=w773\"/>";
        msgg+= "<img src=\"https://postfiles.pstatic.net/MjAyMzA2MTlfMjMg/MDAxNjg3MTU4MTM0Njgw.UDtauccYKT4xNc4pnr5uOGqsrfzyC8bnEgUsrAUmhHMg.MTdpAYMZ7xeII6i4DwDW7j1QFgW23lJ6QQx2OdvWTBsg.PNG.jhs4132/2.png?type=w773\"/><br/>";
        msgg+= "<img src=\"https://postfiles.pstatic.net/MjAyMzA2MTlfMTIg/MDAxNjg3MTYwMzQ5NjA0.pkCY3yDY6LXCEQPc1Vw4pUW8FX03EHt8hyEMt60O60kg.CB7pav2c0vD1MfRvfuq2z08q8HOXQtONkkv3LhYFqAcg.PNG.jhs4132/3.png?type=w773\"/><br/>";
//        msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
//        msgg+= "<h3 style='color:blue;'>"+msg+"</h3>";
//        msgg+= "</div>";

                message.setText(msgg, "utf-8", "html");//내용
        message.setFrom(new InternetAddress(id,"Kolly On the Table"));//보내는 사람

        return message;
    }
    public void sendSimpleMessage(String to, String msg)throws Exception {
        // TODO Auto-generated method stub
        MimeMessage message = createMessage(to,msg);
        try{//예외처리
            emailSender.send(message);
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
    }

    private MimeMessage createAuthMessage(String to, String msg)throws Exception{
        String ePw = createKey();
        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(Message.RecipientType.TO, to);//보내는 대상
        message.setSubject("Kolly On the Table입니다.");//제목

        String msgg="";
        msgg+= "<div style='margin:100px;'>";
        msgg+= "<h1> 안녕하세요, Kolly On the Table입니다! </h1>";
        msgg+= "<br>";
        msgg+= "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
        msgg+= "<br>";
        msgg+= "<p>감사합니다!<p>";
        msgg+= "<br>";
        msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
        msgg+= "<h3 style='color:blue;'>회원가입 코드입니다.</h3>";
        msgg+= "<div style='font-size:130%'>";
        msgg+= "CODE : <strong>";
        msgg+= ePw+"</strong><div><br/> ";
        msgg+= "</div>";
        message.setText(msgg, "utf-8", "html");//내용
        message.setFrom(new InternetAddress(id,"Kolly On the Table"));//보내는 사람

        return message;
    }

    public static String createKey() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 8; i++) { // 인증코드 8자리
            int index = rnd.nextInt(3); // 0~2 까지 랜덤

            switch (index) {
                case 0:
                    key.append((char) ((int) (rnd.nextInt(26)) + 97));
                    //  a~z  (ex. 1+97=98 => (char)98 = 'b')
                    break;
                case 1:
                    key.append((char) ((int) (rnd.nextInt(26)) + 65));
                    //  A~Z
                    break;
                case 2:
                    key.append((rnd.nextInt(10)));
                    // 0~9
                    break;
            }
        }

        return key.toString();
    }

    public void sendAuthMessage(String to, String msg)throws Exception {
        // TODO Auto-generated method stub
        MimeMessage message = createAuthMessage(to,msg);
        try{//예외처리
            emailSender.send(message);
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
    }
}
