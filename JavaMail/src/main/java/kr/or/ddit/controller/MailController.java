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
public class MailController {

    @Autowired
    private JavaMailSender mailSender;
    
    @GetMapping("/")
    public String mForm() {
    	return "index";
    }
    
    @ResponseBody
    @PostMapping("/sendMail")
    public String sendMail(@RequestParam String to
    					,@RequestParam String from
    					,@RequestParam String subject
    					,@RequestParam String text
    					,Model model) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to); // 받는 사람
            message.setFrom("haeun1515@gmail.com"); // 보내는 사람
            message.setSubject(subject);
            message.setText(text);

            mailSender.send(message);
//            model.addAttribute("msg", "메일 발송 성공!");
            return "메일 발송 성공!";
            
        } catch (Exception e) {
//            model.addAttribute("msg", "메일 발송 실패: " + e.getMessage());
        	return "메일 발송 실패: " + e.getMessage();
        }
//        return "result"; 
    }
    
}
