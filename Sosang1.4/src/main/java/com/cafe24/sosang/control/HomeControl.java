package com.cafe24.sosang.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home/*")
public class HomeControl {

	@RequestMapping(value = "privacyPolicy.do")
	public String privacyPolicy() {
		System.out.println("HomeControl => 개인정보 이용안내 페이지로 이동");
		return "mainFooterPage/privacyPolicy.jsp";
	}

	@RequestMapping(value = "termsOfUse.do")
	public String termsOfUse() {
		System.out.println("HomeControl => 이용 약관 페이지로 이동");
		return "mainFooterPage/termsOfUse.jsp";
	}

	@RequestMapping(value = "rejectEmailCollection.do")
	public String rejectEmailCollection() {
		System.out.println("HomeControl => 이메일 무단 수집 거부 페이지로 이동");
		return "mainFooterPage/rejectEmailCollection.jsp";
	}

	@RequestMapping(value = "advertisPopUp.do")
	public String advertisPopUp() {
		System.out.println("HomeControl => 광고팝업창 띄우기");
		return "advertisPage/advertisPopUp.jsp";
	}
}
