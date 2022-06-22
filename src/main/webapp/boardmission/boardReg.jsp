<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardReg.jsp</h3>

<form action="boardRegProc.jsp" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="bsubj"/>
		</dt>
	</dl>
	<div>
		<textarea name="bmemo" id="txtbmemo" class="txtbmemo">dd</textarea>
	</div>
	<input type="submit" value="save"/>
	<input type="button" value="cancel" class="cencel"/>
</form>
</body>
</html>