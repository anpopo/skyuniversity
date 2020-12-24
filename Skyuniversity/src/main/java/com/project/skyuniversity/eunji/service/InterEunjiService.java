package com.project.skyuniversity.eunji.service;

import java.util.List;
import java.util.Map;

import com.project.skyuniversity.eunji.model.ClassCheckVO;
import com.project.skyuniversity.eunji.model.GirlOfficialLeaveVO;
import com.project.skyuniversity.eunji.model.MemberVO;
import com.project.skyuniversity.eunji.model.OfficialLeaveVO;
import com.project.skyuniversity.eunji.model.SchoolLeaveVO;

public interface InterEunjiService {

	MemberVO selectMemberInfo(Map<String, String> paraMap);	// 수강신청시, 해당 학번의 정보를 불러오는 메소드

	List<String> selectAllDept();	// 전체 학과를 불러오는 메소드
	
	List<String> selectAllSubject();	// 전체 과목을 불러오는 메소드

	List<String> selectDeptClass(Map<String, String> paraMap);	// 학과를 select 했을 때 과목을 불러오는 메소드

	List<Map<String, String>> getSubjectList(Map<String, String> paraMap);	// 검색 클릭시, 과목 출력

	String selectDeptOneSub(String subjectno);	// 해당 과목에 대한 과 얻어오기

	int insertCourse(Map<String, String> paraMap);	// 수강테이블에 수강신청한 정보 insert 하기

	int recourseInfo(Map<String, String> paraMap);	// 재수강 여부 판단 

	int insertReCourse(Map<String, String> paraMap);	// 재수강 수강신청

	int recourseInfo2(Map<String, String> paraMap);

	int updatePlusCnt(String string);

	List<Map<String, String>> selectRegList(Map<String, String> paraMap2);

	int deleteCourse(String no);

	int updateDelCnt(String subno);

	int selectSumCredit(Map<String, String> paraMap2);

	int dayInfo(Map<String, String> paraMap);

	int uniqueInfo(Map<String, String> paraMap);

	int add(OfficialLeaveVO ocvo);

	int addNonTime(OfficialLeaveVO ocvo);

	int add_withFile(OfficialLeaveVO ocvo);

	int add_withFileNonTime(OfficialLeaveVO ocvo);

	List<OfficialLeaveVO> selectOfficial(String string);

	int delOfficialLeave(String seq);

	List<Map<String, String>> selectLeaveInfo(Map<String, String> hashmap);

	OfficialLeaveVO getLeaveVO(String seq);

	int checkDate(Map<String, String> timemap);

	int insertGirlLeave(GirlOfficialLeaveVO golvo);

	int insertGirlLeaveTime(GirlOfficialLeaveVO golvo);

	List<GirlOfficialLeaveVO> selectGirlList(int memberNo);

	int checkGirlDate(Map<String, String> checkmap);

	int delGirlOfficialLeave(String seq);

	List<Map<String, String>> selectCheckList(Map<String, String> hashmap);

	int insertClassCheck(ClassCheckVO ccvo);

	int updateCourseCk(int fk_courseno);

	Map<String, String> allMembeInfo(int memberNo);

	int insertArmyLeave(SchoolLeaveVO slvo);

	int insertLeave(Map<String, String> paraMap);

	List<SchoolLeaveVO> selectSchoolLeave(int memberNo);

	SchoolLeaveVO getSchoolLeaveVO(String seq);

	int deleteSchoolInfo(String no);

	

	
}
