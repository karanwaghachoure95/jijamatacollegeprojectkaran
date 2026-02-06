package com.example.JijamataCollegeProject.admissionotp;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class AdmissionOtp {
    public static String emailesend(String email) {
        final String to = email;
        final String from = "karanwaghachoure95@gmail.com";  // Apna Gmail
        final String password = "jldarwszchovamzf";          // App Password (16-char)

        String otp = generateOTP(6);
        String subject = "Your OTP Code";
        String body = "Your OTP is: " + otp;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // 🔹 TLS Fix - Gmail certificate trust
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.checkserveridentity", "false");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        session.setDebug(true); // Debug logs

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("OTP sent successfully: " + otp);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return otp;
    }

    private static String generateOTP(int length) {
        String numbers = "0123456789";
        Random rand = new Random();
        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < length; i++) {
            otp.append(numbers.charAt(rand.nextInt(numbers.length())));
        }

        return otp.toString();
    }
}
