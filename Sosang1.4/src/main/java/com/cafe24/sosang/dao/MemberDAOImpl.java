package com.cafe24.sosang.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.MemberDTO;
import com.cafe24.sosang.dto.MylogDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;

	private static String namespace = "MemberDAO";

	@Override // 아이디 중복검사
	public int checkOverId(String id) {
		return sqlSession.selectOne(namespace + ".checkOverId", id);
	}

	@Override // 이메일중복검사
	public int checkOverEmail(String email) {
		return sqlSession.selectOne(namespace + ".checkOverEmail", email);
	}

	@Override // 이메일중복검사
	public int checkOverEmail2(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".checkModifyEmail", dto);
	}

	@Override // 회원가입
	public void insertMember(MemberDTO dto) throws Exception {
		sqlSession.insert(namespace + ".insertMember", dto);
	}

	@Override // 로그인
	public MemberDTO login(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login_check", dto);
	}

	@Override // 회원탈퇴
	public void deleteMember(MemberDTO dto) {
		sqlSession.delete(namespace + ".deleteMember", dto);

	}

	@Override // 로그인확인+회원정보 불러오기
	public MemberDTO loginCheck(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".selectMember", dto);
	}

	@Override // 회원정보 업데이트 : 비밀번호 제외
	public void updateMember(MemberDTO dto) {
		sqlSession.update(namespace + ".updateMember", dto);
	}
	
	@Override // 회원정보 업데이트 : 비밀번호 포함
	public void updateMemberWithPassword(MemberDTO dto) {
		sqlSession.update(namespace + ".updateMemberWithPassword", dto);
	}

	@Override // 아이디 찾기
	public String findUserId(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".find_Id", dto);
	}

	@Override // 비번 찾기
	public String findUserPassword(Map<String, Object> paramMap) {
		return sqlSession.selectOne(namespace + ".find_Password", paramMap);
	}

	@Override // 검색 정보 저장
	public void reg_mylog(MylogDTO mldto) {
		sqlSession.insert(namespace + ".reg_mylog", mldto);
	}

	@Override // 회원 검증
	public int checkPassword(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".checkPassword", dto);
	}

	
}
