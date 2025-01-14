/* 담당자 이름 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const managerNameInput = document.getElementById('academyManagerName');
    const regex = /^[a-zA-Z가-힣]+$/; // 한글과 영문 대소문자만 허용하는 정규표현식
      
    managerNameInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(managerNameInput, '담당자 이름은 한글 또는 영문 대소문자만 입력 가능합니다.');
        } else {
            hideErrorMessage(managerNameInput);
        }
    });
     
    /* 유효성 실패 시 메시지 노출 */
    function showErrorMessage(inputElement, message) {
        const parentElement = inputElement.parentElement;
        let errorMessageElement = parentElement.querySelector('.error-message');
        if (!errorMessageElement) {
            errorMessageElement = document.createElement('span');
            errorMessageElement.className = 'error-message';
            parentElement.appendChild(errorMessageElement);
        }
        errorMessageElement.textContent = message;
    }
    
    /* 유효성 성공 시 메시지 가리기 */
    function hideErrorMessage(inputElement) {
        const parentElement = inputElement.parentElement;
        const errorMessageElement = parentElement.querySelector('.error-message');
        if (errorMessageElement) {
            parentElement.removeChild(errorMessageElement);
        }
    }
}); 

/* 학원전화번호, 담당자전화번호, 사업자등록번호 입력 필드 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const managerPhoneInput = document.getElementById('academyManagerPhone');
    const academyPhoneInput = document.getElementById('academyPhone');
    const regex = /^[0-9]*$/; // 숫자만 허용하는 정규표현식
        
    managerPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(managerPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(managerPhoneInput);
        }
    });
    
    academyPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(academyPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(academyPhoneInput);
        }
    }); 
    
    /* 유효성 실패 시 메시지 노출 */
    function showErrorMessage(inputElement, message) {
        const parentElement = inputElement.parentElement;
        let errorMessageElement = parentElement.querySelector('.error-message');
        if (!errorMessageElement) {
            errorMessageElement = document.createElement('span');
            errorMessageElement.className = 'error-message';
            parentElement.appendChild(errorMessageElement);
        }
        errorMessageElement.textContent = message;
    }
    
    /* 유효성 성공 시 메시지 숨기기 */
    function hideErrorMessage(inputElement) {
        const parentElement = inputElement.parentElement;
        const errorMessageElement = parentElement.querySelector('.error-message');
        if (errorMessageElement) {
            parentElement.removeChild(errorMessageElement);
        }
    }
});

$(document).ready(function() {
   
    //홍보게시판 내가 쓴 글 목록 이동
    $("#advertiseBtn").on("click", function(){
       window.location.href = "/academy/advertiseList";
    })
    
    //매칭게시판 내가 쓴 댓글 목록 이동
    $("#matchingBtn").on("click", function(){
       window.location.href = "/academy/matchingBoardList";
    })
    
    //결제하기 이동
    $("#payBtn").on("click", function(){
       window.location.href = "/payment/payMain";
    })
    
    $('#emailCheckBtn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지
        // 입력된 이메일 유효성 검사
        const emailAddress = $('#academyManagerEmail').val();
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(emailAddress)) {
            alert("이메일을 올바른 형식으로 입력 후 다시 중복체크 버튼을 눌러주세요");
            return;
        }
        // 이메일 중복 체크 함수 호출
        checkEmailDuplication(emailAddress);
    });

    // 이메일 중복 체크 함수
    function checkEmailDuplication(emailAddress) {
        // AJAX를 이용하여 서버로 중복 체크 요청
        $.ajax({
            url: "/checkEmail", // 중복 체크를 수행하는 컨트롤러의 URL
            type: "POST",
            data: {academyManagerEmail: emailAddress}, // 서버로 전송할 데이터
            success: function(response) {
                // 서버로부터의 응답에 따라 중복 메시지 표시
                if (response == 0) {
                    $('#email-check-message').text('사용 가능한 이메일 주소입니다.');
                    // 이메일 주소를 입력 필드에 채우고 readonly 처리
                    $('#academyManagerEmail').val(emailAddress).prop('readonly', true);
                    console.log("이메일 입력 성공!");
                } else {
                    $('#email-check-message').text('이미 사용 중인 이메일 주소입니다, 다시 입력해주세요.');
                }
            },
            error: function(xhr, textStatus, errorThrown) {
				alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
            }
        });
    }
    
    //교습과목 변경 버튼 클릭 시
    $("#subjectChange").on("click", function(){
      $("#subjectGroup").css("display", "block");
      $("#prevSubject").val("");
      });
    
    //수강료 변경 버튼 클릭 시
    $("#feeChange").on("click", function(){
      $("#feeGroup").css("display", "block");
      $("#prevFee").val("");
      });
   
      // 학년 변경 버튼 클릭 시
    $("#ageChange").on("click", function(){
      $("#ageGroup").css("display", "block");
      $("#prevAge").val("");
      });
   
      // 키워드 변경 버튼 클릭 시
    $("#keywordChange").on("click", function(){
      $("#keywordGroup").css("display", "block");
      $("#prevKeyword1").val("");
      $("#prevKeyword2").val("");
      $("#prevKeyword3").val("");
      $("#prevKeyword4").val("");
      $("#prevKeyword5").val("");
      });
   
      // 수정하기 버튼 클릭 시
      $("#updateBtn").on("click", function(event) {
       event.preventDefault(); // 기본 제출 동작 방지
       
       // 기존 값
       var academyManagerName = $("#academyManagerName").val();       
       var academyManagerEmail = $("#academyManagerEmail").val();
       var academyPhone = $("#academyPhone").val();
       var academyManagerPhone = $("#academyManagerPhone").val();              
       var academyTargetSubject = $("#prevSubject").val();  
       var academyFee = $("#prevFee").val();
       var academyTargetGrade = $("#prevAge").val();
      
       var keyword = [];
       keyword[0] = $("#prevKeyword1").val();
       keyword[1] = $("#prevKeyword2").val();
       keyword[2] = $("#prevKeyword3").val();
       keyword[3] = $("#prevKeyword4").val();
       keyword[4] = $("#prevKeyword5").val();
       
       // 새롭게 설정한 값
       var selectedSubject = $("input[name='academyTargetSubject']:checked").val();
       var selectedFee = $("input[name='academyFee']:checked").val();
       var selectedAge = $("input[name='academyTargetGrade']:checked").val();
       var checkedCount = $("input[name='academyKeyword']:checked").length;
       var selectedKeyword = [];
       
       // 빈 칸 확인(한 줄로 합침)
       if(academyManagerName=="" || academyManagerEmail=="" || academyPhone=="" || academyManagerPhone=="" || (academyFee=="" && selectedFee===undefined) || (academyTargetGrade=="" && selectedAge===undefined) || (academyTargetSubject=="" && selectedSubject===undefined) || (keyword[0]=="" && checkedCount==0)) {
        alert("빈 칸 없이 입력해 주세요.");
        return;
      }

       
       // 정보 수정 시 변경
       if(academyFee=="") {      //만약 수강료를 새롭게 선택했다면            
          academyFee = selectedFee;
       }  
       if(academyTargetGrade=="") {      //만약 대상 학년을 새롭게 선택했다면 
          academyTargetGrade = selectedAge;
       }  
       if(academyTargetSubject=="") {      //만약 대상 학년을 새롭게 선택했다면 
          academyTargetSubject = selectedSubject;
       }
       
       // 새롭게 선택한 키워드를 우선 배열에 담기
       var selectedKeyword = [];
       $("input[name='academyKeyword']:checked").each(function() {
          selectedKeyword.push($(this).val());
       })
      
       // 만약 키워드를 새로 선택했다면
       if(selectedKeyword.length!=0) {      //만약 대상 키워드를 새롭게 선택했다면 
          for(let i=0; i<keyword.length; i++) {
             keyword[i] = selectedKeyword[i];
          }
       }
      
       //수정한 정보를 담은 객체
       let value = {
          academyManagerName : academyManagerName,
          academyManagerEmail : academyManagerEmail,
          academyManagerPhone : academyManagerPhone,
          academyPhone : academyPhone,
          academyTargetSubject : academyTargetSubject,
          academyFee : academyFee,
          academyTargetGrade : academyTargetGrade,
          academyKeyword1 : keyword[0],
          academyKeyword2 : keyword[1],
          academyKeyword3 : keyword[2],
          academyKeyword4 : keyword[3],
          academyKeyword5 : keyword[4]
       }
        
       /* 수정 여부를 사용자에게 확인하기 위해 알림창을 표시합니다.*/ 
       if (confirm("회원 정보를 수정하시겠습니까?")) {
           // 사용자가 확인을 누른 경우, AJAX를 통해 서버로 업데이트 요청을 전송합니다.
           $.ajax({
               url: "/updateAcademy",
               type: "POST",
               data: value,
               success: function() {
                   // 서버에서 성공적인 응답을 받았을 때 실행되는 부분
                   alert("회원 정보가 성공적으로 업데이트되었습니다.");
                   // 성공한 경우 페이지를 새로고침하여 변경된 정보를 반영할 수 있도록 한다.
                   location.reload();
               },
               error: function(xhr, textStatus, errorThrown) {
				   alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
	           }
           });
       } else {
           return false;
       }
    });

    $("#changePasswdBtn").on("click", function() {
        // 사용자에게 비밀번호를 수정할 것인지 묻는 알림
        if (confirm("비밀번호 변경 페이지로 이동하시겠습니까?")) {
            window.location.href = "/passwdChangePage";
        } 
    });    
});