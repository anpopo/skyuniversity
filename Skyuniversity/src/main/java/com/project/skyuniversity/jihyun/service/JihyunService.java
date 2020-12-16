package com.project.skyuniversity.jihyun.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.jihyun.model.JihyunDAO;
import com.project.skyuniversity.jihyun.model.JihyunMemberVO;

@Service
public class JihyunService implements InterJihyunService {

	@Autowired
	private JihyunDAO dao;
	
	@Override
	public JihyunMemberVO getLoginMember(Map<String, String> paraMap) {
		JihyunMemberVO getLoginMember = dao.getLoginMember(paraMap);
		return getLoginMember;
	}

}
