<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String bno=request.getParameter("c");
String bsubj=request.getParameter("bsubj");
String bmemo=request.getParameter("bmemo");
%>    
<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);

String sql="update board set bsubj=?,bmemo=? where bno=?";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1,bsubj);
pstmt.setString(2,bmemo);
pstmt.setString(3,bno);

int be=pstmt.executeUpdate();
response.sendRedirect("boardDetail.jsp?c="+bno);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardEditProc.jsp</h3>
</body>
</html>