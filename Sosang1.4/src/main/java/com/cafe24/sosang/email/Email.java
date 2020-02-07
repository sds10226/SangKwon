package com.cafe24.sosang.email;

public class Email {
	private String subject;
	private String text;
	private String receiver;

	public Email() { /* default constructor */ }

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Email [subject=" + subject + ", text=" + text + ", receiver=" + receiver + "]";
	}

}
