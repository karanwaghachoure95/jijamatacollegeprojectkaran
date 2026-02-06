package com.example.JijamataCollegeProject.passwordsend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.example.JijamataCollegeProject.entity.College;

@Component
public class SendPassword {

    @Autowired
    private JavaMailSender mailSender;

    public void sendPassword(String pass, College user) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(user.getEmail());
        message.setSubject("Password Recovery - Jijamata Senior College");
        message.setText(
                "Dear Student,\n\n" +
                "Your password is: " + pass + "\n\n" +
                "Please keep it confidential.\n\n" +
                "Regards,\n" +
                "Jijamata Senior College"
        );

        mailSender.send(message);
        System.out.println("Password sent successfully to: " + user.getEmail());
    }
}
