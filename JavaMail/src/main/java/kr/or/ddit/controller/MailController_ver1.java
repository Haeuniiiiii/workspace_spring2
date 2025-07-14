package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailController_ver1 {

    @Autowired
    private JavaMailSender mailSender;
    
    @GetMapping("/")
    public String mForm() {
    	return "index";
    }
    
    @ResponseBody
    @PostMapping("/sendMail")
    public String sendMail(@RequestParam String to,
                           @RequestParam String from,
                           @RequestParam String subject,
                           @RequestParam String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setFrom("haeun1515@gmail.com"); // Gmail은 이 값 무시됨. 다른 SMTP를 사용해야겠음.. 보안정책ㅡㅡ
            message.setSubject(subject);
            message.setText(text);

            mailSender.send(message);

            return "메일 발송 성공!";
        } catch (Exception e) {
            return "메일 발송 실패: " + e.getMessage();
        }
    }
    
}
