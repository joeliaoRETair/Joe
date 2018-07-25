public class Factory {
	public static void main(String[] args) {
		Sender sender = SenderFactory.getSender("SmsSender");
		sender.send();
	}
}
