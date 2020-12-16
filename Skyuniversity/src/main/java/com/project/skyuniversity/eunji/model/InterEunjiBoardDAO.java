package com.project.skyuniversity.eunji.model;

import java.util.List;
import java.util.Map;

public interface InterEunjiBoardDAO {

	MemberVO selectMemberInfo(Map<String, String> paraMap);// 수강신청시, 해당 학번의 정보를 불러오는 메소드

	List<String> selectAllDept();	// 전체 학과를 불러오는 메소드

	List<String> selectAllSubject();	// 전체 과목을 불러오는 메소드
	
	List<String> selectDeptClass(Map<String, String> paraMap);	// 학과를 select 했을 때 과목을 불러오는 메소드

	List<Map<String, String>> getSubjectList(Map<String, String> paraMap);

	String selectDeptOneSub(String subjectno);

	int insertCourse(Map<String, String> paraMap);

	int recourseInfo(Map<String, String> paraMap);

	int insertReCourse(Map<String, String> paraMap);

	int recourseInfo2(Map<String, String> paraMap);

	int updatePlusCnt(String string);

	List<Map<String, String>> selectRegList(Map<String, String> paraMap2);

	int deleteCourse(String no);

	int updateDelCnt(String subno);

	int selectSumCredit(Map<String, String> paraMap2);

	int dayInfo(Map<String, String> paraMap);

	int uniqueInfo(Map<String, String> paraMap);

}
