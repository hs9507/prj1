<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>join2</h3>
<form action="joinProc2.jsp" method="post">
	<p style="color:red;">
	<%
	if(request.getAttribute("errors")!=null){
		List<String> errors=(List)request.getAttribute("errors");
		for(int i=0; i<errors.size(); i++){
	%>
		<%=errors.get(i) %> <br />
		<%
		}
	}
	%>
	</p>
	ID : <input type="text" name="tid"/>
	<input type="button" value="중복체크"/> <br />
	PASSWORD : <input type="text" name="tpwd"/> <br /> 
	PASSWORDC : <input type="text" name="tpwd2"/> <br />
	NAME : <input type="text" name="tname"/> <br />
	GENDER : 
	<select name="tgender" id="tgender">
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <br />
	BIRTH : 
	<input type="text" name="tyear" size="5"/>년
	<input type="text" name="tmonth" size="5"/>월
	<input type="text" name="tday" size="5"/>일
	
	<input type="radio" name="tislunar" value="solar" checked/>양력
	<input type="radio" name="tislunar" value="islunar"/>음력 <br />
	PHONE : <input type="tel" name="tphone"/> 예)010-0000-0000 <br />
	EMAIL : <input type="email" name="temail"/> <br />
	HOBBY :
		<input type="checkbox" name="thobby" value="game"/>게임
		<input type="checkbox" name="thobby" value="movie"/>영화
		<input type="checkbox" name="thobby" value="trip"/>여행
		<input type="checkbox" name="thobby" value="coding"/>코딩 <br />
		
		<input type="submit" value="확인"/>
</form>
</body>
</html>