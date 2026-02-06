package com.example.JijamataCollegeProject.otp;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.example.JijamataCollegeProject.entity.College;

@Component
public class OtpSend {

    @Autowired
    private JavaMailSender mailSender;

    public String emailesend(College user) {

        String otp = generateOTP(6);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(user.getEmail());
        message.setSubject("OTP Verification - Jijamata Senior College");
        message.setText(
                "Dear Student,\n\n" +
                "Your OTP is: " + otp + "\n\n" +
                "This OTP is valid for limited time.\n" +
                "Do not share it with anyone.\n\n" +
                "Regards,\n" +
                "Jijamata Senior College"
        );

        mailSender.send(message);
        System.out.println("OTP sent successfully to: " + user.getEmail());

        return otp;
    }

    private String generateOTP(int length) {
        String numbers = "0123456789";
        Random random = new Random();
        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < length; i++) {
            otp.append(numbers.charAt(random.nextInt(numbers.length())));
        }
        return otp.toString();
    }
}
