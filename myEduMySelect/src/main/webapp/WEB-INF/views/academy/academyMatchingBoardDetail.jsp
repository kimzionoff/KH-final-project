<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	
<%@ include file="/WEB-INF/views/common/common.jspf" %>										
<!DOCTYPE html>
<html lang="kr">
 
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
 
  <title>MyEduMySelect </title>
  <meta content="" name="description">
  <meta content="" name="keywords"> 
   
  <!-- Favicons -->
  <link href="/resources/include/assets/img/favicon.png" rel="icon">
  <link href="/resources/include/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/include/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/include/assets/css/style.css" rel="stylesheet">
  <link href="/resources/include/matching/css/matchingBoard.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
	
	
	<!-- <script>
		window.onload = function(){
			let confirmMsg = "${confirmMsg}";
			if(confirmMsg) {
				let result = confirm(comfirmMsg);
				if(result) {
					window.location.href= "/useraccount/login";
				} else {
					window.location.href= "/matching/boardList";
				}
			}
		}
	</script> -->

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo me-auto"><a href="/">MyEdu<br />MySelect</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto active" href="#hero">홈</a></li>
	          <li><a class="nav-link scrollto" href="#about">About</a></li>
	          <li><a class="nav-link scrollto" href="#team">Team</a></li>
	          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	              <li><a href="/free/freeList">자유게시판</a></li>
	            <li><a href="#">홍보게시판</a></li>
	            <li><a href="/matching/">매칭게시판</a></li>
	            <li><a href="/notice/boardList">공지게시판</a></li>
	            <c:if test="${personalLogin.memberTypeId == 1}">
	               <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">개인회원 마이페이지</a></li>
	            </c:if>
	            <c:if test="${academyLogin.memberTypeId == 2}">
	               <li><a href="${pageContext.request.contextPath}/academy/mypage" id="mypageBtn">학원회원 마이페이지</a></li>
	            </c:if>
	            </ul>
	          </li>
	          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
	          <c:choose>
	          <c:when test="${not empty personalLogin}">
	              <li><a class="nav-link scrollto">[개인]&nbsp&nbsp${personalLogin.personalName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:when test="${not empty academyLogin}">
	              <li><a class="nav-link scrollto">[학원]&nbsp&nbsp${academyLogin.academyName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/academy/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:otherwise>
	              <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
	          </c:otherwise>
	        </c:choose>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
  	</header><!-- End Header -->

  <!-- ======= 설명 영역 ======= -->
  <section class="mcHero d-flex align-items-center">

    <div class="container">
      <div class="row" >
		<div class="col-12 text-center mcBanner">
            매칭 게시판<br/>
            <div class="mcDescBox">
            	여러분을 기다리고 있는 회원들의 게시물을 볼 수 있는 <b>매칭 게시판</b>입니다.<br>
            </div>
        </div>  
      </div>
    </div>
   </section><!-- 설명영역 끝 -->


  <main id="main">
 
    <!-- ======= 매칭게시판 상세 보기 ======= -->
    <section class="mcBoard">
     
      <div class="container">
      
      	<form name="formData" id="formData">
      		<input type="hidden" name="matchingNo" id="matchingNo" value="${detail.matchingNo }"/>
      	</form>
      
      	<div class="userId">${userId }</div>
      	
		<div class="mcBoardDetail">
			<table>
				<tr>
					<th>글 번호</th>
					<td>${detail.matchingNo}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="writerId">${detail.personalId}</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td>${detail.matchingRegisterDate }</td>
				</tr>
				<tr>
					<th>댓글 수</th>
					<td class="comment_count">${matchingBoard.commentCnt }</td>
				</tr>
			</table>
			<br>
			<table>
				<tbody>
					<tr>
						<th>지역</th>
						<td>${detail.matchingGuAddress }&nbsp ${detail.matchingDongAddress}</td>
					</tr>
					<tr>
						<th>과목</th>
						<td>${detail.matchingTargetSubject }</td>
					</tr>
					<tr>
						<th>학년</th>
						<td>${detail.matchingTargetGrade }</td>
					</tr>
					<tr>
						<th>희망 수강료</th>
						<td>${detail.matchingFee }</td>
					</tr>
					<tr>
						<th>키워드</th>
						<td>
							${detail.matchingKeyword1 }&nbsp&nbsp&nbsp ${detail.matchingKeyword2 }&nbsp&nbsp&nbsp ${detail.matchingKeyword3 }
						</td>
					</tr>
					<tr>
						<th>덧붙이는 말</th>
						<td>${detail.matchingComment }</td>
					</tr>
				</tbody>	
			</table>
		</div>

		
		<div class="detailButtons">
      		<!-- <button type="button" id="editPost">수정</button>
      		<button type="button" id="deletePost">삭제</button> -->
      		<button type="button" id="prevPost">이전글</button>
      		<button type="button" id="nextPost">다음글</button>
      		<button type="button" id="gotoList">목록</button>
      	</div>
      </div>
    </section><!-- 매칭게시판 상세보기 끝 -->
    
    
    <!-- 매칭게시판 댓글 -->
	<section>
		<%-- 댓글 보여주기 --%>
		<jsp:include page="matchingComment.jsp" />
	</section>
	
  
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>MyEduMySelect</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>MyEduMySelect</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/matching/js/matchingDetail.js"></script>
  
 
	<script>
		$(function() {
			let errorMsg = "${errorMsg}";
			if (errorMsg != "") {
				alert(errorMsg);
			}
		});
	</script>
	
</body>

</html>