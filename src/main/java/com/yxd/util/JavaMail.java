package com.yxd.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class JavaMail {
	// 发件人的 邮箱 和 密码
    public static String myEmailAccount = "m17859909018@163.com";
    public static String myEmailPassword = "6600689559Aa";

    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    public static String myEmailSMTPHost = "smtp.163.com";

    // 收件人邮箱
    public static String receiveMailAccount ;
	public static boolean send(String code,String uemail) throws Exception {
		
			receiveMailAccount = uemail;
	        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
	        Properties props = new Properties();                    // 参数配置
	        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
	        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
	        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
	        
	        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
	        Session session = Session.getInstance(props);
	        
	        //session.setDebug(true);   // 设置为debug模式, 可以查看详细的发送 log
	        
	        // 3. 创建一封邮件
	        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount,code);
	        
	        // 4. 根据 Session 获取邮件传输对象
	        Transport transport = session.getTransport();
	        
	        // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
	        transport.connect(myEmailAccount, myEmailPassword);
	        
	        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
	        transport.sendMessage(message, message.getAllRecipients());
	        
	        // 7. 关闭连接
	        transport.close();
	   
		return true;
	}
	 /**
     * 创建一封只包含文本的简单邮件
     * @param session 和服务器交互的会话
     * @param sendMail 发件人邮箱
     * @param receiveMail 收件人邮箱
     */
	public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String code) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);
        
        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "闽师社区", "UTF-8"));
        
        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "闽师社区用户", "UTF-8"));
        
        // 4. Subject: 邮件主题
        message.setSubject("闽师社区验证码", "UTF-8");
        
        // 5. Content: 邮件正文（可以使用html标签）
        if(code.length() == 4)
        	message.setContent("验证码："+code, "text/html;charset=UTF-8");
        else
        	message.setContent("您的密码为："+code, "text/html;charset=UTF-8");
        
        // 6. 设置发件时间
        message.setSentDate(new Date());
        
        // 7. 保存设置
        message.saveChanges();
        return message;
    }
	/**
	 * 测试
	 */
	/*public static void main(String[] args) throws Exception {
		JavaMail javaMail = new JavaMail();
		if(javaMail.send(6666)) {
			System.out.println("邮箱验证码发送成功");
		}else {
			System.out.println("邮箱验证码发送失败");
		}
	}*/
}
