package eStoreProduct.model;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class emailSend {
	public void sendEmail() {
		// TODO Auto-generated method stub
		
		final String user="akshayaakula047@gmail.com"; 
		final String password="drrtoqiwlqgkwrum";
		
		// Get form data from the request
        String name = "Akshaya";
        String email = "akshayavarma39@gmail.com";
        String subject = "Reset Password";
        String message = "reset password";
       
        // Set up email properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Set up email session
       

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
      
        try {
            // Create a new message
            Message emailMessage = new MimeMessage(session);

            // Set the sender and recipient addresses
            emailMessage.setFrom(new InternetAddress(user));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

            // Set the email subject and body
            emailMessage.setSubject(subject);
            emailMessage.setText("Name: " + name + "\n\nMessage: " + message);
            Transport.send(emailMessage);
            
           
            // Return a success message to the user
            
        } catch (MessagingException e) {
            // Return an error message to the user
           System.out.println("error");
        }
		
		
	}

}
