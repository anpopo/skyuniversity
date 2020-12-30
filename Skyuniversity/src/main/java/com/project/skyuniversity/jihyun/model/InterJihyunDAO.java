package com.project.skyuniversity.jihyun.model;

import java.util.List;
import java.util.Map;

public interface InterJihyunDAO {

	// 로그인하기
	JihyunMemberVO getLoginMember(Map<String, String> paraMap);
	
	// 비밀번호 변경하기
	int updatePwd(Map<String, String> paraMap);
	
	// 현재 비밀번호 일치여부 확인
	boolean checkPwd(Map<String, String> paraMap);
	
	// 증명서 종류 리스트 가져오기
	public List<Map<String, String>> getCertificateKindList();
	
	// 증명서 신청 리스트 가져오기
	public List<Map<String, String>> getApplicationList(String memberNo);
	
	// 공지사항 리스트 가져오기
	public List<Map<String, String>> getNoticeList();	// 전체
	public List<Map<String, String>> getDeptNoticeList();	// 학과별
	public List<Map<String, String>> getSubjectNoticeList();	// 과목별
}
