package com.cafe24.sosang.dao;

import java.util.Map;

import com.cafe24.sosang.dto.MemberDTO;
import com.cafe24.sosang.dto.MylogDTO;

public interface MemberDAO {

	// 아이디중복검사
	int checkOverId(String id);

	// 이메일중복검사
	int checkOverEmail(String email);
	
	// 회원 정보 수정 : 이메일중복검사
	int checkOverEmail2(MemberDTO dto);

	// 회원가입
	void insertMember(MemberDTO dto) throws Exception;

	// 로그인
	public MemberDTO login(MemberDTO dto) throws Exception;

	// 회원탈퇴
	void deleteMember(MemberDTO dto);

	// 로그인확인+회원정보 불러오기
	public MemberDTO loginCheck(MemberDTO dto) throws Exception;

	// 회원정보 업데이트 : 비밀번호 제외
	void updateMember(MemberDTO dto);
	
	// 회원정보 업데이트 : 비밀번호 포함
	void updateMemberWithPassword(MemberDTO dto);

	// 아이디 찾기
	public String findUserId(MemberDTO dto);

	// 비밀번호 찾기
	public String findUserPassword(Map<String, Object> paramMap);

	// 검색 정보 저장
	public void reg_mylog(MylogDTO mldto);

	public int checkPassword(MemberDTO dto) throws Exception;

}
