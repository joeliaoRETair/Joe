
public class SenderFactory {
	public static Sender getSender(String type) {
//		if (type == "mail") {
//		sender = new MailSender();
//		}
//		else if (type == "sms"){
//			sender = new SmsSender();
//		}
//		return sender;
		try {
			return (Sender)Class.forName(type).newInstance();
		}
		catch(Exception e) {
			e.getMessage();
		}
		return null;		
	}
}
