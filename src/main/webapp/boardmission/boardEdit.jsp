<%@page import="java.sql.ResultSet"%>
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

String sql="select * from board where bno=?";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1,bno);

ResultSet rs=pstmt.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle2.css" />
</head>
<body>
<h3>boardEdit.jsp</h3>
<form action="boardEditProc.jsp" method="post">
<table class="twidth">
	<colgrou>
		<col width=15%/>
		<col width=35%/>
		<col width=5%/>
		<col width=35%/>
	</colgrou>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getString("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("bcnt") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("bdate") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="bsubj">
			<input type="text" name="bsubj" value="<%=rs.getString("bsubj") %>"/>
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="bmemo">
			<textarea name="bmemo" class="txt"><%=rs.getString("bmemo") %></textarea>
			</td>
		</tr>
	</tbody>
</table>
<div>
	<input type="hidden" name="c" value="<%=rs.getString("bno")%>" />
	<input type="submit" value="수정"/>
	<a href="boardDetail.jsp?c=<%=rs.getString("bno")%>">취소</a>
</div>
</form>
</body>
</html>