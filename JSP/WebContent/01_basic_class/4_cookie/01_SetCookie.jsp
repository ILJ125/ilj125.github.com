<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		


<%	
	// 1. Cookie 객체 생성
	Cookie c = new Cookie("knh","은주야나는오늘아침은안먹구어제저녘에육회비빔밥먹었쪄");
	// 2. 속성 부여
	c.setMaxAge(1*60*5); //쿠키 남겨놓는 시간  초단위
	// 3. 클라이언트에 쿠키 전송
	response.addCookie(c);
%>

<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>