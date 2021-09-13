<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/joinlogin/find.css">

</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- 은경 -->

	<!-- Contents -->
	<!-- 혹시 윗간격 이상하면 container div 지우기 -->
	<div class="wrap wd668">
		<div class="container">
			<ul class="tab">
				<li class="active"><a class="sub_tit_txt"
					href="<c:url value="/find/findid"/>">아이디 찾기</a></li>
				<li><a class="sub_tit_txt"
					href="<c:url value="/find/findpassword"/>">비밀번호 찾기</a></li>
			</ul>

			<form action="<c:url value="/find/findId"/>" method="post">
				<div class="form_txtInput">
					<div class="find_form">
						<table>
							<tr>
								<td><input id="regname" type="text" placeholder="가입시 등록하신 이름">
								</td>
							</tr>
							<tr>
								<td><input id="regphonenum" type="text"
									placeholder="가입시 등록하신 휴대폰 번호 "></td>
							</tr>
						</table>
						<div id="btnbox">
							<div class="btn_wrap">
								<!-- <input type="submit" id="findBtn" value="찾기"> -->
									<a href="<c:url value="/find/findid"/>">찾기(공갈)</a>
							</div>
							<div class="btn_wrap2">
								<a onclick="history.go(-1)">취소</a>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>



	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>