<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf"%><!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/include/admin/image/admin.png" rel="icon">
<link href="/resources/include/admin/image/admin.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/include/admin/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/admin/admin/assets/css/style.css" rel="stylesheet">

<style>
.table {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}
</style>

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<section>
	<jsp:include page="/WEB-INF/views/admin/common/section.jsp" />
	</section>

	<main id="main" class="main">
		<form id="detailForm">
			<input type="hidden" id="matchingCommentNo" name="matchingCommentNo" />
		</form>
		<form id="commentForm" name="commentForm">
			<input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

			<div class="pagetitle">
				<h1>Matching Comment Board</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
						<li class="breadcrumb-item active">matching comment board</li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->

			<section class="section">

				<div class="row">
					<div class="col-lg-12">

						<div class="card">
							<div class="card-body">
								<div class="row g-2 align-items-center">
									<div class="col-auto">
										<label for="search" class="card-title">search</label>
									</div>
									<div class="col-auto">
										<select id="search" name="search" class="form-select form-select-sm">
											<option value="all">All</option>
											<option value="matching_comment_content">Content</option>
											<option value="academy_id">Academy Id</option>
										</select>
									</div>
									<div class="col-auto">
										<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요" class="form-control form-control-sm" />
									</div>
									<div class="col-auto">
										<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
									</div>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">Comment No</th>
											<th scope="col">Academy Id</th>
											<th scope="col">Name</th>
											<th scope="col">Content</th>
											<th scope="col">RegDate</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty commentList}">
												<c:forEach var="comment" items="${commentList}" varStatus="statusNumber">
														<tr data-num="${comment.matchingCommentNo}">
															<th scope="row">${comment.matchingCommentNo}</th>
															<th class="goDelete text-start">${comment.academyId}</th>
															<td class="goDelete text-start">${comment.matchingCommentNickname}</td>
															<td class="goDelete text-start">${comment.matchingCommentContent}</td>
															<td class="goDelete text-start">${comment.matchingCommentDate}</td>
														</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">조건에 맞는 공지가 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<%-- ======================== 페이징 출력 시작 ========================--%>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a href="${pageMaker.startPage - 1}" class="page-link">Previous</a> <!-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> --></li>
									</c:if>

									<!-- 바로가기 번호 출력 -->
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}"><a href="${num}" class="page-link">${num}</a></li>
									</c:forEach>
									<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
									<c:if test="${pageMaker.next}">
										<li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link">Next</a></li>
									</c:if>

								</ul>

							</nav>

						</div>
					</div>
				</div>
			</section>
		</form>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
	</footer>
	<!-- End Footer -->
	<script>
      	$(function() {
      		/* 검색 후 검색 대상과 검색 단어 출력 */
      		let word="<c:out value='${matchingReplyAdminVO.keyword}' />";
      		let value ="";
      		if (word != "") {
      			$("#keyword").val("<c:out value='${matchingReplyAdminVO.keyword}' />");
      			$("#search").val("<c:out value='${matchingReplyAdminVO.search}' />");
      			
      			if ($("#search").val() != 'matching_comment_content') {
      				//:contains() 는 특정 텍스트를 포함한 요소 반환
      				if($("#search").val() == 'academy_id') value = "#list tr td.goDetail";
      				console.log($(value + ":contains('" + word + "')").html());
      				// $("#list tr td.goDetail:contains('노력')").html();
      				// => <span class='required'>노력</span>에 대한 명언
      				$(value + ":contains('" + word +"')").each(function() {
      					let regex = new RegExp(word, 'gi');
      					$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
      				});
      			}
      		}
      	});
      </script>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/resources/include/admin/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/quill/quill.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/php-email-form/validate.js"></script>
	<script src="http://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<!-- Template Main JS File -->
	<!-- <script src="/resources/include/admin/admin/assets/js/main.js"></script> -->
	<script src="/resources/include/admin/js/matchingCommentListView.js"></script>
</body>
</html>