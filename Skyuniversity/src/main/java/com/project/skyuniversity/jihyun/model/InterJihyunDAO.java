package com.project.skyuniversity.jihyun.model;

import java.util.Map;

public interface InterJihyunDAO {

	// 로그인하기
	JihyunMemberVO getLoginMember(Map<String, String> paraMap);
	
}
