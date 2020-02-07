package com.cafe24.sosang.service;

import java.util.Map;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.MemberDAO;
import com.cafe24.sosang.dto.MemberDTO;
import com.cafe24.sosang.dto.MylogDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;

	@Override // 중복 아이디 체크
	public int userIdCheck(String id) throws Exception {
		return memberDao.checkOverId(id);
	}

	@Override // 이메일 중복확인
	public int check_email(String email) throws Exception {
		return memberDao.checkOverEmail(email);
	}
	
	@Override // 이메일 중복확인
	public int check_email2(MemberDTO dto) throws Exception {
		return memberDao.checkOverEmail2(dto);
	}

	@Override // 회원가입
	public void insertMember(MemberDTO dto) throws Exception {
		memberDao.insertMember(dto);
	}

	@Override // 로그인확인
	public MemberDTO login(MemberDTO dto, HttpSession session) throws Exception {
		MemberDTO member_info = memberDao.login(dto);
		if (member_info != null) {// 아이디와 비밀번호가 맞은 경우
			// 세션변수 등록
			session.setAttribute("id", dto.getId());
			// session.setAttribute("password", dto.getPassword());
		}
		return member_info;
	}

	@Override // 로그인확인 및 정보불러오기
	public MemberDTO loginCheck(MemberDTO dto, HttpSession session) throws Exception {
		MemberDTO member_info = memberDao.loginCheck(dto);
		return member_info;
	}

	@Override // 로그아웃
	public void logout(HttpSession session) throws Exception {
		// 세션을 초기화 한다.
		session.invalidate();
	}

	@Override // 회원탈퇴
	public void deleteMember(MemberDTO dto) throws Exception {
		memberDao.deleteMember(dto);

	}

	@Override // 업데이트 멤버
	public void updateMember(MemberDTO dto) {
		String pw = dto.getPassword();
		if(pw == "") {
			memberDao.updateMember(dto);
		} else {
			memberDao.updateMemberWithPassword(dto);
		}
	}

	// 아이디 찾기
	@Override
	public String findUserId(MemberDTO dto) throws Exception {
		return memberDao.findUserId(dto);
	}

	// 비번 찾기
	@Override
	public String findUserPassword(Map<String, Object> paramMap) throws Exception {
		return memberDao.findUserPassword(paramMap);
	}
	
	// 검색 정보 저장
	@Override
	public void reg_mylog(MylogDTO mldto) {
		memberDao.reg_mylog(mldto);
	}
	
	// 회원 검증
	@Override
	public int checkPassword(MemberDTO dto) throws Exception {
		return memberDao.checkPassword(dto);
	}

}
