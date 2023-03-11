package Treer.dto;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class SendEmail {

    private final String senderEmail = "bhduc264@gmail.com";
    private final String senderPassword = "sgyzstlrdsokzlsn";

    public void sendEmail(String recipientEmail, String mailTilte, String mailContent) throws MessagingException, UnsupportedEncodingException {

        // Cấu hình mail server
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Đăng nhập vào tài khoản email của người gửi
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Tạo email
            MimeMessage message = new MimeMessage(session);

            //Thiết lập thông tin người gửi và người nhận
            message.setFrom(new InternetAddress(senderEmail)); // Địa chỉ email người gửi
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Địa chỉ email người nhận

            // Mã hóa tiêu đề email bằng UTF-8
            String subject = mailTilte;
            String encodedSubject = MimeUtility.encodeText(subject, "UTF-8", "B");
            message.setSubject(encodedSubject);

            // Thiết lập nội dung email
            message.setContent(mailContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
