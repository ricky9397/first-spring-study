<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>캐리 상세페이지</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/carry/carryDetail.css">
<script src="/gym/js/carryDetail.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<!-- Contents -->
	<div class="container">
		<div class="carry_image swiper-container mySwiper">
			<ul class="swiper-wrapper">
				<li class="swiper-slide"><img
					src="<c:url value="/images/review1.jpg"/>"></li>
				<li class="swiper-slide"><img
					src="<c:url value="/images/review2.jpg"/>"></li>
				<li class="swiper-slide"><img
					src="<c:url value="/images/review3.jpg"/>"></li>
				<li class="swiper-slide"><img
					src="<c:url value="/images/review4.jpg"/>"></li>
				<li class="swiper-slide"><img
					src="<c:url value="/images/review1.jpg"/>"></li>
				<li class="swiper-slide"><img
					src="<c:url value="/images/review2.jpg"/>"></li>
			</ul>
			<div class="swiper-pagination"></div>
		</div>



		<!-- quickmenu section START -->
		<div class="quickmenu_section">
			<nav class="quickmenu">
				<ul>
					<li><a href="#introduce" id="introducte_btn">소개</a></li>
					<li><a href="#review">후기</a></li>
					<li><a href="#place">소속 플레이스</a></li>
					<li><a href="#location">위치</a></li>
					<li><a href="#" id="carrer_btn">자격/경력</a></li>
				</ul>
			</nav>
		</div>
		<!-- quickmenu section END -->


		<hr>

		<div class="place_info container_fix">

			<div class="place_info_content">
				<!-- carry info section START -->

				<div class="carryinfo_section">

					<div id="c1"></div>


					<table class="carry_info_message" id="introduce">

						<tr>
							<td><span class="carry_name">${carryDetail.crname}</span></td>
						</tr>

						<tr>
							<td><span class="carry_introduce">"${carryDetail.crintro}"</span></td>
						</tr>

						<tr>
							<td>
								<div class="carry_procategory">
									<span style="color: #AAA">전문분야</span> <br> <span>${carryDetail.crdepart}</span>
								</div>
							</td>
						</tr>

					</table>
				</div>
				<!-- carry info section END -->


				<div class="carry_carrer" id="carrer">
					<h3>자격 및 경력</h3>
					<ul>
						<li>${carryCerti.crcerti1}</li>
						<li>${carryCerti.crcerti2}</li>
						<li>${carryCerti.crcerti3}</li>
						<li>${carryCerti.crcerti4}</li>
						<li>${carryCerti.crcerti5}</li>
					</ul>
				</div>



				<!-- carry review section all wrap START -->
				<div class="carry_review_wrap" id="review">
					<div class="carry_review_title">
						<h2>캐리 후기</h2>
						<input type="button" value="후기작성" id="write_review_btn">
					</div>

					<!-- 리뷰 작성 입력폼 -->
					<form id="reviewForm" name="reviewForm" method="post">
						<div id="review_write" class="review_write display_none">
							<textarea class="review_input" rows="2" cols="30"
								name="reviewcontent" id="review" placeholder="리뷰를 입력해주세요."></textarea>
							<input type="button" value="등록" class="write_btn" id="write_btn"
								onClick="fn_review('${result.code}')"> <input
								type="hidden" id="cridx" name="cridx" value="1"> <input
								type="hidden" id="memidx" name="memidx" value="1">
						</div>
					</form>

					<c:forEach items="${carryReviewList}" var="carryReviewList">
						<div class="review_list_section">
							<div class="member_profile_image">
								<img src="<c:url value="/images/icon/profile.png"/>"
									style="width: 50px">
							</div>

							<div class="review_content">
								<span class="review_name">${carryReviewList.memnick}</span> <span
									class="review_date">${carryReviewList.reviewdate}</span> <br>
								<span>${carryReviewList.reviewcontent}</span>
							</div>

						</div>
					</c:forEach>
				</div>
				<!-- carry review section all wrap END -->



				<!-- 소속 플레이스 section all wrap START -->
				<div class="carry_place_title" id="place">
					<h2>소속 플레이스</h2>
					<div class="carry_place_content">
						<img src="http://placehold.it/570x300"> <span><a
							href="#">${carryPlaceInfo.placename}</a></span>
					</div>
				</div>
				<!-- 소속 플레이스 section all wrap END -->



				<div class="place_map" id="location">
					<h3>지도</h3>
					<div class="place_address">
						<p>${carryPlaceInfo.placeaddress}</p>
						<p>${carryPlaceInfo.placephone}</p>
					</div>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.3482559449353!2d126.98313801564814!3d37.57041633166289!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e88bffbb25%3A0x47dbc264f2cc5695!2z67mE7Yq47Lqg7ZSE!5e0!3m2!1sko!2skr!4v1629288115032!5m2!1sko!2skr"
						width="100%" height="300px" style="border: 0;" allowfullscreen=""
						loading="lazy"> </iframe>
				</div>
			</div>


			<!-- 우측 배너 START -->
			<div class="right_banner">

				<div id="c2" class="circle"></div>
				<h2>${crname}</h2>

				<div class="program_all">

					<form action="<c:url value='/payment/pay'/>" method="post">
						<div class="program">
							<div class="program_info">
								<span>수업 1회 이용권</span> <br>
								<h4>
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${carryPrice.proprice1}" />
									원
								</h4>
							</div>

							<div id="purchase_btn">
								<input type="submit" value="구매하기" class="button">
							</div>
						</div>
					<input type="hidden" name="cridx" value="${carryPrice.cridx}">
					<input type="hidden" name="crname" value="${carryDetail.crname}">
					<input type="hidden" name="paynum" value="1">
					<input type="hidden" name="payprice" value="${carryPrice.proprice1}">
					</form>


					<form action="<c:url value='/payment/pay'/>" method="post">
					<div class="program">
						<div class="program_info">
							<span>수업 5회 이용권</span> <br>
							<h4>
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${carryPrice.proprice5}" />
								원
							</h4>
						</div>
						<div id="purchase_btn">
							<input type="submit" value="구매하기" class="button">
						</div>
					</div>
					<input type="hidden" name="cridx" value="${carryPrice.cridx}">
					<input type="hidden" name="crname" value="${carryDetail.crname}">
					<input type="hidden" name="paynum" value="5">
					<input type="hidden" name="payprice" value="${carryPrice.proprice5}">
					</form>


					<form action="<c:url value='/payment/pay'/>" method="post">
					<div class="program">
						<div class="program_info">
							<span>수업 10회 이용권</span> <br>
							<h4>
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${carryPrice.proprice10}" />
								원
							</h4>
						</div>
						<div id="purchase_btn">
							<input type="submit" value="구매하기" class="button">
						</div>
					</div>
					<input type="hidden" name="cridx" value="${carryPrice.cridx}">
					<input type="hidden" name="crname" value="${carryDetail.crname}">
					<input type="hidden" name="paynum" value="10">
					<input type="hidden" name="payprice" value="${carryPrice.proprice10}">
					</form>
					
					
					<form action="<c:url value='/payment/pay'/>" method="post">
					<div class="program">
						<div class="program_info">
							<span>수업 20회 이용권</span> <br>
							<h4>
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${carryPrice.proprice20}" />
								원
							</h4>
						</div>
						<div id="purchase_btn">
							<input type="submit" value="구매하기" class="button">
						</div>
					</div>
					<input type="hidden" name="cridx" value="${carryPrice.cridx}">
					<input type="hidden" name="crname" value="${carryDetail.crname}">
					<input type="hidden" name="paynum" value="20">
					<input type="hidden" name="payprice" value="${carryPrice.proprice20}">
					</form>
					
				</div>
			</div>
			<!-- 우측 배너 END -->

		</div>

	</div>
	<!-- Contents END -->


	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>


	<script>
		// place 이미지 슬라이드
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 0,
			slidesPerView : 4,
			centeredSlides : false,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
		});
	</script>


	<script>
		// 리뷰 등록하기(Ajax)
		function fn_review(code) {

			$.ajax({
				type : 'POST',
				url : "<c:url value='/carry/detail'/>",
				data : $("#reviewForm").serialize(),
				success : function() {
					$(".review_input").val("");
					alert('리뷰가 정상적으로 등록되었습니다.');

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}

			});
		}
	</script>