<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/board/advertise/css/advertiseDetail.css" rel="stylesheet">

  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">

				<div class="col-12 text-center banner">
		            홍보 게시판<br/>
		            <div class="descBox">
		            	우리 학원이 얼마나 멋진 장소인지 자랑하는 <b>홍보 게시판</b>입니다. 
						당신이 찾는 모든 학원 정보가 바로 여기에!<br>
						홍보 게시판에서 마음에 드는 학원을 발견했다면, '찜'을 눌러 보세요! 내가 찜한 학원 목록은 마이페이지에서 확인 가능합니다.
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->



	<!-- ======= 홍보게시판 상세 보기 ======= -->
  <main id="main">
 
    
    <section class="form">
     
      <div class="container">
      
      	<form name="commonNoForm" id="commonNoForm">
      		<input type="hidden" name="commonNo" id="commonNo" value="${detail.commonNo }"/>
      	</form>
      	
      	<!-- ======= 세션을 위한 hidden input ======= -->
        <input type="hidden" id="personalId" name="personalId" value="${personalLoginVO.personalId }"/>
	    <input type="hidden" id="academyId" name="academyId" value="${academyLoginVO.academyId }"/>
      	
      	
		<div class="advDetail">
			<input type="hidden" class="writerId" value="${detail.academyId }" />
			<table>
				<tr>
					<th>글 번호</th>
					<td>${detail.commonNo}&nbsp;&nbsp;&nbsp;&nbsp;[조회수 : ${detail.commonReadcnt }]</td>
				</tr>
				<tr>
					<th>학원명</th>
					<td>${detail.commonNickname}</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td>${detail.commonRegisterDate }</td>
				</tr>
			</table>
			<br>
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${detail.commonTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${detail.commonContent }</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td id="lastTd">
							<c:forEach var="file" items="${detail.fileVO }">
								<img src="/uploadStorage/advertise/${file.fileName}" alt="이미지">
							</c:forEach>
						</td>
					</tr>
				</tbody>	
			</table>
			
			
			<div id="likeButton">
		        <img id="likeImage" src="/uploadStorage/like/likeNo.png">
		        <p id="likeMsg"></p>
		    </div>
			
			
			
		</div>

		
		<div class="detailButtons">
      		<button type="button" id="editPost">수정</button>
      		<button type="button" id="deletePost">삭제</button>
			<button type="button" id="gotoList">목록</button>
      		<button type="button" id="nextPost">다음글</button>
			<button type="button" id="prevPost">이전글</button>
      	</div>
      </div>
    </section><!-- 매칭게시판 상세보기 끝 -->
    
    
    
   
    
	
  
  </main><!-- End #main -->
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />	

 
  <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/js/common.js"></script>
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/board/advertise/js/advertiseDetail.js"></script>
  
 
	
	<script type="text/javascript">
	
		let commonNo = ${detail.commonNo};
		let memberId= "${personalLoginVO.personalId}";
		
		function toggle() {
       		$.ajax({
       			type: "post",
       			url: "/like/toggle",
       			data: JSON.stringify({
           			commonNo: commonNo,
           			likeMemberId : memberId
           		}),
           		contentType: "application/json; charset=utf-8",
                   dataType: "text",
                   success: function(returnVal){
                	   if(returnVal == "좋아요 취소") {
                      		$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                          	alert("찜을 취소했습니다.");
                          	$("#likeMsg").text("이 학원을 찜할까요?");
                          	
                      	} else if(returnVal == "좋아요 등록") {
                      		$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                          	alert("이 학원을 찜했습니다!");
                          	$("#likeMsg").text("찜한 학원입니다.");
                      	}
                   },
           		error: function(){
           			alert("update 실패");
           		}
       		})
		};
		
		
        $(document).ready(function() {
        	
            // 페이지 로딩 시 getLike 실행
            $.ajax({
                type: "POST",
                url: "/like/get",
                data: JSON.stringify({
                			commonNo: commonNo,
                			likeMemberId : memberId
                		}),
             	headers : {"Content-Type" : "application/json"},
                dataType: "text",
                success: function(status) {
                    // 결과값에 따라 이미지 변경
                    if (status == 0) {			//좋아요 이력이 없을 때 => insert
                    	$("#likeMsg").text("이 학원을 찜할까요?");
                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    	$("#likeButton").on("click", function(){
                    		$.ajax({
                    			type: "post",
                    			url: "/like/insert",
                    			data: JSON.stringify({
                        			commonNo: commonNo,
                        			likeMemberId : memberId
                        		}),
                        		contentType: "application/json; charset=utf-8",
                                dataType: "text",
                                success: function(){
                                	$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                                	location.reload();
                                	alert("이 학원을 찜했습니다!");
                                },
                        		error: function(){
                        			alert("insert 실패");
                        		}
                    		})
                    	})
                    } else {			//좋아요 이력이 있을 때 => update(toggle)
                    	if(status == 1) {
                    		$("#likeMsg").text("찜한 학원입니다.");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                    		$("#likeButton").on("click", function(){
                        		toggle();
                        	})
                    	} else {
                    		$("#likeMsg").text("이 학원을 찜할까요?");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    		$("#likeButton").on("click", function(){
                        		toggle();
                        	})
                    	}
                    }
                },
                error: function(){
                	alert("error");
                }
            });
        });

        
        //삭제 시 팝업
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
			
		});
		
    </script>
	
</body>

</html>