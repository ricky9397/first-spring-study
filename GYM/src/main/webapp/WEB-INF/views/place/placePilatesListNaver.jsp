<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Community</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<link rel="stylesheet" href="/gym/css/place/placeList.css">
<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ql9vcy7uun&submodules=geocoder">
</script>

</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>


<!-- Contents -->
<div class="container container_fix place_list_section">
    <h1 class="page_title">
        내 주변 운동시설 찾아보기
    </h1>
    <ul class="place_menu">
        <li class="on">
            <a href="<c:url value="/place/list"/>">전체</a>
        </li>
        <li>
            헬스
        </li>
        <li>
            <a href="<c:url value="/place/pilates"/>">필라테스</a>
        </li>
        <li>
            요가
        </li>
    </ul>
    <div class="place_search_bar">
        <input type="text" name="search" id="search" placeholder="센터명을 검색해보세요.">
        <button type="submit">
            <img src="<c:url value="/images/icon/search_icon.png"/>" alt="search">
        </button>
    </div>


    <!-- 지도[s] -->

    <div id="map" style="width:100%;height:500px; margin-top: 50px"></div>

    <script>

        var position = new naver.maps.LatLng(37.55528086061827, 126.93683578593966); //lat 위도, lng 경도

        //지도 생성
        var map = new naver.maps.Map('map', {
            center: position,      //x,y 값 설정
            scaleControl: false,  // 우측 하단 scale 표시
            zoom: 16
        });
        
        var marker = new naver.maps.Marker({
            position: position,
            map: map,
            title: '정보',
            icon: {
                content: [
                    '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;">' +
                    '<div> <img src="/gym/images/icon/muscles.png" style="width:60px; height:60px;"></div>' +
                    '</div>'
                ].join(''),
                size: new naver.maps.Size(38, 58),
                anchor: new naver.maps.Point(19, 58),
            },
            draggable: false

        });


    </script>


    <!-- 지도[e] -->


    <div class="place_list">
        <div class="place_content">
            <div class="place_info">
                <h3>킹짐</h3>
                <p>안산시 단원구 선부동</p>
                <a href="<c:url value="/place/detail"/>">더 알아보기</a>
            </div>
            <div class="place_img">
                <img src="<c:url value="/images/review1.jpg"/>">
            </div>
        </div>
        <div class="place_content">
            <div class="place_info">
                <h3>어쩌고짐</h3>
                <p>안산시 단원구 초지동</p>
                <a href="#">더 알아보기</a>
            </div>
            <div class="place_img">
                <img src="<c:url value="/images/review2.jpg"/>">
            </div>
        </div>
        <div class="place_content">
            <div class="place_info">
                <h3>핏플리짐</h3>
                <p>안산시 단원구 원곡동</p>
                <a href="#">더 알아보기</a>
            </div>
            <div class="place_img">
                <img src="<c:url value="/images/review3.jpg"/>">
            </div>
        </div>
        <div class="place_content">
            <div class="place_info">
                <h3>베스트휘트니스</h3>
                <p>안산시 단원구 선부동</p>
                <a href="#">더 알아보기</a>
            </div>
            <div class="place_img">
                <img src="<c:url value="/images/review4.jpg"/>">
            </div>
        </div>
    </div>
</div>

<!-- Contents end -->

<!-- footer -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
