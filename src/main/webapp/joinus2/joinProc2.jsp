<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String tid=request.getParameter("tid");
String tpwd=request.getParameter("tpwd");
String tpwd2=request.getParameter("tpwd2");
String tname=request.getParameter("tname");
String tgender=request.getParameter("tgender");
String tyear=request.getParameter("tyear");
String tmonth=request.getParameter("tmonth");
String tday=request.getParameter("tday");
String tbirth=String.format("%s-%s-%s",tyear,tmonth,tday);

String tislunar=request.getParameter("tislunar");
String tphone=request.getParameter("tphone");
String temail=request.getParameter("temail");
String[] thobbys=request.getParameterValues("thobby");
String thobby="";
if(thobbys!=null){
	for(int i=0; i<thobbys.length; i++){
		thobby+=thobbys[i];
		if(thobbys.length>i+1)
			thobby+=",";
	}
}

List<String> errors=new ArrayList();
if(tid==null || tid.equals(""))
	errors.add("NO ID");
if(!tpwd.equals(tpwd2))
	errors.add("CHECK PASSWORD");
if(errors.size()>0){
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("join2.jsp").forward(request, response);
}else{
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";
	
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	//접속성공
	String sql="insert into nmember2(tid,tpwd,tname,tgender,tbirth,tis_lunar,tcphone,temail,thobby,tregdate)"
	+ "values(?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, tid);
	pstmt.setString(2, tpwd);
	pstmt.setString(3, tname);
	pstmt.setString(4, tgender);
	pstmt.setString(5, tbirth);
	pstmt.setString(6, tislunar);
	pstmt.setString(7, tphone);
	pstmt.setString(8, temail);
	pstmt.setString(9, thobby);
	pstmt.executeUpdate();
	response.sendRedirect("../index.jsp");
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>joinProc2.jsp</h3>
<%=tid %> <br />
<%=tpwd %> <br />
<%=tname %> <br />
<%=tgender %> <br />
<%=tbirth %> <br />
<%=tislunar %> <br />
<%=tphone %> <br />
<%=temail %> <br />
<%=thobby %> <br />
</body>
</html>