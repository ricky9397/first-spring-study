<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원가입</h1>
	<form action="<c:url value="/member/join"/>" method="post">
	아이디 : <input type="text" name="id">
	비밀번호 : <input type="password" name="pw">
	비밀번호 확인 : <input type="password" name="pw2">
	이름 : <input type="text" name="name">
	<input type="submit" value="회원가입">
	</form>
</body>
</html>