<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= #28. tile2 중 sideinfo 페이지 만들기  ======= --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<<<<<<< HEAD
<script type="text/javascript">

   var weatherTimejugi = 0;  // 단위는 밀리초

   $(document).ready(function() {
      loopshowNowTime();
     /* 
      // 시간이 대략 매 30분 0초가 되면 기상청 날씨정보를 자동 갱신해서 가져오려고 함.
      // (매 정시마다 변경되어지는 날씨정보를 정시에 보내주지 않고 대략 30분이 지난다음에 보내주므로)
      var now = new Date();
      var minute = now.getMinutes();  // 현재시각중 분을 읽어온다.
      
      if(minute < 30) { // 현재시각중 분이 0~29분 이라면
         weatherTimejugi = (30-minute)*60*1000;  // 현재시각의 분이 0분이라면 weatherTimejugi에 30분을 넣어준다.
                                                 // 현재시각의 분이 5분이라면 weatherTimejugi에 25분을 넣어준다.
                                                 // 현재시각의 분이 29분이라면 weatherTimejugi에 1분을 넣어준다.
      }
      else if(minute == 30) {
         weatherTimejugi = 1000;                 // 현재시각의 분이 30분이라면 weatherTimejugi에 1초 넣어준다.
      }
      else {                                      // 현재시각의 분이 31~59분이라면
         weatherTimejugi = ( (60-minute)+30 )*60*1000;  // 현재시각의 분이 31분이라면 weatherTimejugi에 (29+30)분을 넣어준다.
                                                        // 현재시각의 분이 40분이라면 weatherTimejugi에 (20+30)분을 넣어준다.
                                                        // 현재시각의 분이 59분이라면 weatherTimejugi에 (1+30)분을 넣어준다.
      }
      
      loopshowWeather(); // 기상청 날씨정보 공공API XML데이터 호출하기
      */
   }); // end of ready(); ---------------------------------

   function showNowTime() {
      
      var now = new Date();
   
      var month = now.getMonth() + 1;
      if(month < 10) {
         month = "0"+month;
      }
      
      var date = now.getDate();
      if(date < 10) {
         date = "0"+date;
      }
      
      var strNow = now.getFullYear() + "-" + month + "-" + date;
      
      var hour = "";
       if(now.getHours() < 10) {
           hour = "0"+now.getHours();
       } 
       else {
          hour = now.getHours();
       }
      
       
      var minute = "";
      if(now.getMinutes() < 10) {
         minute = "0"+now.getMinutes();
      } else {
         minute = now.getMinutes();
      }
      
      var second = "";
      if(now.getSeconds() < 10) {
         second = "0"+now.getSeconds();
      } else {
         second = now.getSeconds();
      }
      
      strNow += " "+hour + ":" + minute + ":" + second;
      
      $("#clock").html("<span style='color:green; font-weight:bold;'>"+strNow+"</span>");
   
   }// end of function showNowTime() -----------------------------


   function loopshowNowTime() {
      showNowTime();
      
      var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
      
      setTimeout(function() {
                  loopshowNowTime();   
               }, timejugi);
      
   }// end of loopshowNowTime() --------------------------

   
   // ------ 기상청 날씨정보 공공API XML데이터 호출하기 -------- //
  <%--  function showWeather() {

      $.ajax({
            url: "<%= request.getContextPath() %>/opendata/weatherXML.action",
            type: "GET",
            dataType: "XML",
            success: function(xml){
                  var rootElement = $(xml).find(":root");
                   console.log($(rootElement).prop("tagName"));   
                   // ==> current
                                 
                   var weather = $(rootElement).find("weather");
                   console.log( $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시" );        
                  // 2020년 07월 29일 14시
                  
                  var updateTime = $(weather).attr("year") +"년 " + $(weather).attr("month") + "월 " + $(weather).attr("day") + "일 " + $(weather).attr("hour") + "시";
                  
                   var localArr = $(rootElement).find("local");
                  console.log("지역개수: "+localArr.length); 
                  // 지역개수: 95
               
                  var html = "업데이트 : <span style='font-weight:bold;'>"+updateTime+"</span>&nbsp;";
                      html += "<span style='color:blue; cursor:pointer; font-size:9pt;' onClick='javascript:showWeather();'>업데이트</span><br/>";
                      html += "<table class='table table-hover' align='center'>";
                     html += "<tr>";
                     html += "<th>지역</th>";
                     html += "<th>날씨</th>";
                     html += "<th>기온</th>";
                     html += "</tr>";
                  
                   for(var i=0; i<localArr.length; i++) {
                      var local = $(localArr).eq(i);  
                        /* .eq(index) 는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자이다. 
                                 마치 배열의 인덱스(index)로 값(value)를 찾는 것과 같은 효과를 낸다.
                        */
                        console.log($(local).text() + " stn_id:" + $(local).attr("stn_id") + " icon:" + $(local).attr("icon") + " desc:" + $(local).attr("desc") + " ta:" + $(local).attr("ta") );
                          // 속초 stn_id:90 icon:01 desc:맑음 ta:-0.7
                          // 북춘천 stn_id:93 icon:01 desc:맑음 ta:-5.7
                          // .......
                          
                          var icon = $(local).attr("icon");
                          if(icon == "") {
                             icon = "없음";
                          }
                        
                          html += "<tr>";
                          html += "<td>"+$(local).text()+"</td><td><img src='/board/resources/images/weather/"+icon+".png' />"+$(local).attr("desc")+"</td><td>"+$(local).attr("ta")+"</td>";
                          html += "</tr>";
                   }
                  
                   html += "</table>";
                   
                   $("#displayWeather").html(html);
                   
               }, // end of success: function(xml)-----------------------------

               error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
               }   
            }); // end of $.ajax({});-------------------------------------------------
      
   }
   
   
   function loopshowWeather() {
      showWeather();
      
      setTimeout(function() {
            showWeather();   
         }, weatherTimejugi); // 현재시각의 분이 5분이라면 weatherTimejugi가 25분이므로 25분후인 30분에 showWeather();를 실행한다.
      
      setTimeout(function() {
              loopshowWeather();   
         }, weatherTimejugi + (60*60*1000));  // 현재시각의 분이 5분이라면 weatherTimejugi가 25분이므로 25분후인 30분에 1시간을 더한후에 showWeather();를 실행한다.
   }// end of loopshowWeather() --------------------------    --%>

</script>


<div style="margin: 0 auto;" align="center">
   현재시각 :&nbsp; 
   <div id="clock" style="display:inline;"></div>
=======
<%
   String ctxPath = request.getContextPath();
%>

<style>
/*   .sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  top: 100px;
  left: 0;
  background-color: #ffff;
  padding-top: 60px;
} */

 li.menu1 {
 	border: 1px solid lightgray;
 	height: 30px;
 	margin: 2px;
 	border-radius: 5px;
 	cursor: pointer;
 }
 
 li.menu2 {
  	height: 30px;
 	margin: 2px;
 	cursor: pointer;
 	background-color: rgb(234,234,234, 0.8);
 	margin:0;
 }
 
 ul {
 	list-style-type: none;
 	width: 225px;
 	margin: 0;
 	padding: 0;
 	
 }
 
 div#search {
 	margin: 50px auto;
 }
 
 input#searchInput {
 	border: 0px;
 }
 
 .choice {
 	font-weight: bold;
 }
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("li.menu2").hide();
		
		$("li").hover(function(){
			$(this).addClass("choice");
		}, function(){
			$(this).removeClass("choice");
		});
		
		$("li#stuentInfo").click(function(){
			$("li.stuentInfo").toggle();
		});
		
		
		$("li#clases").click(function(){
			$("li.clases").toggle();
		});
		
		
		$("li#resister").click(function(){
			$("li.resister").toggle();
		});
		
		
		$("li#grade").click(function(){
			$("li.grade").toggle();
		});
		
		
		$("li#graduate").click(function(){
			$("li.graduate").toggle();
		});
		
		
		
	});
 


 
</script>

<div align="center">

	<div id="search">
		<input id="searchInput"/>
		<span><img src="<%= ctxPath %>/resources/images/searchicon_jh.png" style="width: 20px; height: 20px;"/></span>
	</div>
	
	<div id="menu">
		<ul>
			<li id="stuentInfo" class="menu1">학생정보</li>
				<li class="stuentInfo menu2">학생정보조회</li>
				<li class="stuentInfo menu2" >비밀번호변경</li>
				<li class="stuentInfo menu2">학사일정</li>
				<li class="stuentInfo menu2">증명서발급</li>
			<li id="clases" class="menu1">수업</li>
				<li class="clases menu2">수강신청</li>
				<li class="clases menu2">수강과목</li>
				<li class="clases menu2">강의평가</li>
				<li class="clases menu2">공결신청 및 공결신청내역 조회</li>
			<li id="resister" class="menu1">학적관리</li>
				<li class="resister menu2">학적변동</li>
				<li class="resister menu2">전과신청</li>
				<li class="resister menu2">복수정공,부전공신청</li>
				<li class="resister menu2">학적변동내역조회</li>
			<li id="grade" class="menu1">성적</li>
				<li class="grade menu2">기이수성적조회</li>
				<li class="grade menu2">당학기성적조회</li>
				<li class="grade menu2">성적표출력</li>
				<li class="grade menu2">교양 및 전공필수 이수현황</li>
			<li id="graduate" class="menu1">졸업</li>
				<li class="graduate menu2">졸업연기</li>
				<li class="graduate menu2">졸업적부심사</li>
				<li class="graduate menu2">조기졸업신청 및 결과조회</li>
		</ul>
	</div>

>>>>>>> parent of cca8490 (학사행정 tiles(header, side) 변경)
</div>

<div id="displayWeather" style="min-width: 90%; max-height: 500px; overflow-y: scroll; margin-top: 20px; margin-bottom: 70px; padding-left: 10px; padding-right: 10px;"></div>
