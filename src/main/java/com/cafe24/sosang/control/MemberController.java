package com.cafe24.sosang.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.sosang.dto.MemberDTO;
import com.cafe24.sosang.email.Email;
import com.cafe24.sosang.email.EmailSender;
import com.cafe24.sosang.service.MemberService;

@Controller
@RequestMapping("/member/*") // member/의 이후 주소롤 나오는 모든것은 이 컨트롤러에서 담당한다.
public class MemberController {

	// Logging을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired // Controller->Service Calling
	private MemberService memberService;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	// ____________________________________________________________
	// 페이지 불러오기 함수들

	// 로그인페이지 불러오기
	@RequestMapping(value = "member/loginForm.do", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mav) throws Exception {
		System.out.println("memberControl => 로그인페이지 불러오기");
		mav.setViewName("member/loginForm.jsp");
		return mav;
	}

	// 아이디 중복체크 페이지 불러오기
	@RequestMapping(value = "member/confirmId.do", method = RequestMethod.GET)
	public ModelAndView confirmId(ModelAndView mav) throws Exception {
		System.out.println("아이디 중복체크 페이지 불러오기");
		mav.setViewName("member/confirmId.jsp");
		return mav;
	}

	// 이메일 중복체크 페이지 불러오기
	@RequestMapping(value = "member/confirmEmail.do", method = RequestMethod.GET)
	public ModelAndView confirmEmail(ModelAndView mav) throws Exception {
		System.out.println("이메일 중복체크 페이지 불러오기");
		mav.setViewName("member/confirmEmail1.jsp");
		return mav;
	}

	// 검색기록불러오기 페이지 불러오기
	@RequestMapping(value = "member/history.do")
	public ModelAndView myHistory(ModelAndView mav) throws Exception {
		System.out.println("검색기록 보기 페이지 불러오기");
		mav.setViewName("member/history.jsp");
		return mav;

	}

	// 회원등록 페이지가져오기
	@RequestMapping(value = "memberRegisterForm.do", method = RequestMethod.GET)
	public ModelAndView insertMember(ModelAndView mav) throws Exception {
		System.out.println("회원가입 페이지 불러오기");
		mav.setViewName("member/memberRegisterForm.jsp");
		return mav;
	}

	// 아이디,비번 찾기 페이지가져오기
	@RequestMapping(value = "member/findIdPasswordForm.do", method = RequestMethod.GET)
	public ModelAndView findIdPasswordForm(ModelAndView mav) throws Exception {
		System.out.println("아이디,비번 찾기 페이지가져오기");
		mav.setViewName("member/findIdPasswordForm.jsp");
		return mav;
	}

	// 마이페이지 불러오기
	@RequestMapping(value = "member/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mav) throws Exception {
		System.out.println("마이페이지 불러오기");
		mav.setViewName("member/mypage.jsp");
		return mav;
	}

	// _______________________________________________________________________
	// 회원가입에 필요한 함수들

	// 아이디 중복 체크 컨트롤러
	@ResponseBody // json형식으로 리턴한다.
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> idCheck(String id) throws Exception {
		logger.info("ajax start.......");
		return new ResponseEntity<String>(memberService.userIdCheck(id) + "", HttpStatus.OK);
	}

	// 이메일 중복 체크 컨트롤러
	@ResponseBody
	@RequestMapping(value = "emailCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> emailCheck(String email) throws Exception {
		logger.info("ajax Email start.......");
		return new ResponseEntity<String>(memberService.check_email(email) + "", HttpStatus.OK);
	}

	// 회원 정보 수정 : 이메일 중복 체크 컨트롤러
	@ResponseBody
	@RequestMapping(value = "emailCheck2.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> emailCheck2(String email, HttpSession session) throws Exception {
		logger.info("ajax Email start.......");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setId((String) session.getAttribute("id"));
		return new ResponseEntity<String>(memberService.check_email2(memberDTO) + "", HttpStatus.OK);
	}

	// 회원등록
	@RequestMapping(value = "memberRegisterForm.do", method = RequestMethod.POST)
	public ModelAndView insertMember(MemberDTO dto, ModelAndView mav) throws Exception {
		memberService.insertMember(dto);
		mav.setViewName("member/memberRegisterComplete.jsp");
		return mav;
	}

	// ________________________________________________________________________
	// 로그인
	@RequestMapping(value = "login_check.do", method = RequestMethod.POST)
	public String login_check(MemberDTO dto, Model model, HttpSession session) throws Exception {
		MemberDTO member_info = memberService.login(dto, session);
		if (member_info != null) {
			return "redirect:../home.jsp";
		} else {// 로그인이 실패하면 login폼으로 돌아간다.
			model.addAttribute("message", "로그인에 실패했습니다.");
			return "member/loginForm.jsp";
		}
	}
	
	// _________________________________________________________________________
	// 나의 정보보기

	// 나의 정보 보기 페이지 불러오기
	@RequestMapping(value = "member/myinfo.do", method = RequestMethod.GET)
	public ModelAndView myInfo(MemberDTO dto, ModelAndView mav, HttpSession session) throws Exception {
		System.out.println("controller-myInfo 페이지 불러오기");

		dto.setId((String) session.getAttribute("id"));
		
		if(session.getAttribute("id") != null) {
			MemberDTO member_info = memberService.loginCheck(dto, session);
	
			mav.addObject("name", member_info.getName());
			mav.addObject("tel", member_info.getTel());
			mav.addObject("password", member_info.getPassword());
			mav.addObject("email", member_info.getEmail());
	
			mav.setViewName("member/myInfo.jsp");
		} else {
			System.out.println("controller-myinfo 비회원 접근");
			mav.setViewName("redirect:../home.jsp");
		}
		return mav;
	}
	// __________________________________________________________________________
	// 회원정보 수정에 필요한 함수들

	// 로그인확인+ 정보불러오기+ 회원정보변경 페이지 불러오기
	@RequestMapping(value = "member/memberChangeInfoForm.do", method = RequestMethod.POST)
	public ModelAndView changeInfo(MemberDTO dto, HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("Controller-회원정보변경 페이지 불러오기");

		dto.setId((String) session.getAttribute("id"));
		MemberDTO member_info = memberService.loginCheck(dto, session);
		if (member_info != null) {
			mav.addObject("name", member_info.getName());
			mav.addObject("tel", member_info.getTel());
			mav.addObject("password", member_info.getPassword());
			mav.addObject("email", member_info.getEmail());
		} else {
			mav.addObject("message", "정보회원에 실패했습니다. 다시 시도해주세요.");
		}
		mav.setViewName("member/memberChangeInfoForm.jsp");
		return mav;
	}

	// 이메일 중복체크 페이지 불러오기
	@RequestMapping(value = "member/confirmEmail2.do", method = RequestMethod.GET)
	public ModelAndView confirmEmail2(ModelAndView mav) throws Exception {
		System.out.println("이메일 중복체크 페이지 불러오기");
		mav.setViewName("member/confirmEmail2.jsp");
		return mav;
	}
	
	// 정보수정 : 비밀번호 제외
	@RequestMapping(value = "update_member.do", method = RequestMethod.POST)
	public ModelAndView update_member(MemberDTO dto, ModelAndView mav) throws Exception {
		System.out.println("controller-업데이트멤버 : 비밀번호 제외");
		memberService.updateMember(dto);
		mav.setViewName("member/memberUpdateComplete.jsp");
		return mav;
	}
	
	// 정보수정 : 비밀번호 포함
	@RequestMapping(value = "update_memberWithPassword.do", method = RequestMethod.POST)
	public ModelAndView update_memberWithPassword(MemberDTO dto, ModelAndView mav) throws Exception {
		System.out.println("controller-업데이트멤버 : 비밀번호 포함");
		memberService.updateMember(dto);
		mav.setViewName("member/memberUpdateComplete.jsp");
		return mav;
	}
	
	// _____________________________________________________________________________
	// 로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("controller-logout!!!");
		memberService.logout(session);

		mav.setViewName("member/logout.jsp");
		mav.addObject("message", "로그아웃 되셧습니다");
		return mav;// 페이지로 이동
	}

	// ____________________________________________________________________________
	// 회원탈퇴
	@RequestMapping(value = "deleteMember.do")
	public ModelAndView deleteMember(MemberDTO dto, ModelAndView mav, HttpSession session) throws Exception {

		logger.info("controller-deleteMember연결");

		dto.setId((String) session.getAttribute("id"));
		memberService.deleteMember(dto);
		memberService.logout(session);

		mav.addObject("message", "다음에 또 만나요!");
		mav.setViewName("member/memberDeleteComplete.jsp");
		return mav;
	}

	// ____________________________________________________________________________
	// 아이디, 비밀번호 찾기
	@RequestMapping(value = "find_Id.do")
	public ModelAndView find_id(MemberDTO dto, HttpServletRequest req, ModelAndView mav) throws Exception {
		dto.setName((String) req.getParameter("name"));
		dto.setEmail((String) req.getParameter("email"));

		// ModelAndView map구조
		mav.addObject("findId", memberService.findUserId(dto));
		mav.setViewName("member/find_Id.jsp");
		return mav;
	}

	@RequestMapping(value = "find_Password.do")
	public ModelAndView find_Password(@RequestParam Map<String, Object> paramMap, ModelAndView mav) throws Exception {
		String id = (String) paramMap.get("id");
		String customer_mail = (String) paramMap.get("email");
		
		String pw = memberService.findUserPassword(paramMap);
		if(pw != null) {
			email.setText("[내 손안의 강남상권]입니다. " + id + "님의 비밀번호는" + pw + " 입니다.");
			email.setReceiver(customer_mail);
			email.setSubject("[내 손안의 강남상권] "+ id +"님의 비밀번호 찾기 결과입니다.");
			emailSender.SendEmail(email);
			mav.addObject("findPassword", memberService.findUserPassword(paramMap));
			mav.setViewName("member/find_Password.jsp"); 
		} 
		mav.setViewName("member/find_Password.jsp"); 
		return mav;
	}
	
	@RequestMapping(value = "checkPassword.do")
	public String advertisPopUp() {
		System.out.println("정보수정 페이지 들어가기 전 비밀번호 검증 페이지");
		return "member/checkPassword.jsp";
	}

	// 회원 정보 수정 들어가기 전에 비밀번호 검증
	@ResponseBody
	@RequestMapping(value = "member/passwordCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> passwordCheck(MemberDTO dto, HttpServletRequest req, HttpSession session) throws Exception {
		logger.info("ajax Email start.......");
		dto.setId((String) session.getAttribute("id"));
		dto.setPassword((String) req.getParameter("password"));
		return new ResponseEntity<String>(memberService.checkPassword(dto) + "", HttpStatus.OK);
	}
	
}
