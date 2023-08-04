<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>수임사header</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../resources/assets/img/favicon.png" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">

  <style>
  .navbar{
  	margin-right: 70px;
  }
  .navbar ul {
    margin: 0;
    padding: 0;
    display: flex;
    list-style: none;
    align-items: center;
  }

  .navbar li {
    position: relative;
  }

  .navbar>ul>li {
    white-space: nowrap;
  }

  .navbar a,
  .navbar a:focus {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 14px 20px;
    font-family: sans-serif;
    font-size: 16px;
    color: #3A4753B3;
    font-weight: 400;
    white-space: nowrap;
    transition: 0.3s;
    position: relative;
  }

  .navbar a i,
  .navbar a:focus i {
    font-size: 12px;
    line-height: 0;
    margin-left: 5px;
  }
  

  .navbar>ul>li>a:before {
    content: "";
    position: absolute;
    width: 100%;
    height: 2px;
    bottom: 0;
    left: 0;
    background-color: var(--color-primary);
    visibility: hidden;
    transition: all 0.3s ease-in-out 0s;
    transform: scaleX(0);
    transition: all 0.3s ease-in-out 0s;
  }

  .navbar a:hover:before,
  .navbar li:hover>a:before,
  .navbar .active:before {
    visibility: visible;
    transform: scaleX(0.7);
  }
  
  .navbar .active,
  .navbar .active:focus,
  .navbar li:hover>a{
  
  }

  .navbar .dropdown a:hover:before,
  .navbar .dropdown:hover>a:before,
  .navbar .dropdown .active:before {
    visibility: hidden;
  }

  .navbar .dropdown a:hover,
  .navbar .dropdown .active,
  .navbar .dropdown .active:focus,
  .navbar .dropdown:hover>a {
    color: #4169E1;      /* 드롭다운 hover 시 색상 */
    font-weight: 600;
    background: white;
    transform: scale(1.1);
	transition: transform 1s;
  }

  .navbar .dropdown ul {
    display: block;
    position: absolute;
    left: 0;
    top: 100%;
    margin: 0;
    padding: 0 0 10px 0;
    z-index: 99;
    opacity: 0;
    visibility: hidden;
    background: white;
    transition: 0.3s;
  }

  .navbar .dropdown ul li {
    min-width: 200px;
  }

  .navbar .dropdown ul a {
    padding: 10px 20px;
    font-size: 15px;
    text-transform: none;
    color: #3A4753B3;
  }

  .navbar .dropdown ul a i {
    font-size: 12px;
  }

  .navbar .dropdown ul a:hover,
  .navbar .dropdown ul .active,
  .navbar .dropdown ul .active:hover,
  .navbar .dropdown ul li:hover>a {
    color: #4169E1;
    background: #f6f9ff;
  }

  .navbar .dropdown:hover>ul {
    opacity: 1;
    visibility: visible;
  }

  .navbar .dropdown .dropdown ul {
    top: 0;
    left: calc(100% - 30px);
    visibility: hidden;
  }

  .navbar .dropdown .dropdown:hover>ul {
    opacity: 1;
    top: 0;
    left: 100%;
    visibility: visible;
  }
  
  .header .toggle-sidebar-btn {
     padding-right: 100px;        /* 토글버튼과 메뉴 사이 */
  }
  
  .edge{
	 color: #87CEEB !important;
	 font-size: 18px !important;
	 font-weight: bold;
	 margin-top: 8px;
	 margin-left: 5px;
  }
  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(function(){
		
		// 로그인한 사용자의 메시지 요청
		function fetchMessageList() {
			// 로그인한 사용자의 userno
			let receiver = '4';
			
	        $.ajax({
	            type: "GET",
	            url: "/bank/getMessageList",
	            dataType: "json",
	            data: { receiver: receiver },
	            success: function(response) {
	                let list = response.messageList;
	                let count = response.unreadMessageCount; 
	                createMessageList(list, count);
	            },
	            error: function(xhr, status, error) {
	                console.error(error);
	            }
	        });
	    }

	    // 페이지 로드 시, 메시지 목록 가져오기
	    fetchMessageList();
		
});

	function formatNumberWithCommas(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function createMessageList(list, count){
			
		let start = $('#makeMessage');
	  	start.empty();
		  	
		let str = '';
		str += '<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">';
		str += '<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">';
		str += '<i class="bi bi-chat-left-text"></i>';
		if(count==0){
			str += '<span class="badge bg-success badge-number"></span>';
		}else{
			str += '<span class="badge bg-success badge-number">';
			str += count;
			str += '</span>';
		}
		str += '</a>'; // end messages icon
		
		str += '<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">';
		str += '<li class="dropdown-header">';
		str += count;
		str += '개의 새로운 메시지가 있습니다.';
		str += '<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">모두 보기</span></a>';
		str += '</li>';
		str += '<li>';
		str += '<hr class="dropdown-divider">';
		str += '</li>';
		
		if(list && list.length >0){
			for (let i = 0; i < list.length; i++) {
				str += '<li class="message-item">';
				str += '<a href="#">';
				str += '<div>';
				str += '<input type="hidden" class="messageno" value="';
				str += list[i].messageno;
				str += '">';
				str += '<h4>';
				str += list[i].sendername;
				str += '</h4>';
				str += '<p>';
				str += list[i].message;
				str += '</p>';
				str += '<p>';
				str += list[i].bhmdate.split(".")[0];   //소수점 이하 숫자 제거
				str += '</p>';
				str += '</div>';
				str += '</a>';
				str += '</li>';
				str += '<li>';
				str += '<hr class="dropdown-divider">';
				str += '</li>';
			}//end for
			
			str += '<li class="dropdown-footer">';
			str += '<a href="#">모두 보기</a>';
			str += '</li>';
		}//end if

		str += '</ul>';
		
		start.html(str);
	}// 메시지 출력


$(function(){
	
	// 메시지 부분 클릭시
	$("#makeMessage").on("click", ".message-item", function(){
		
		// 클릭한 li의 messageno 가져오기
		let messageno = $(this).find(".messageno").val();
		
		// 메시지 상태변경(확인) + 통장내역 가져와서 모달에 넣기
		 $.ajax({
	            type: "GET",
	            url: "/bank/getBHfromMessageno",
	            dataType: "json",
	            data: { messageno: messageno },
	            success: function(response) {
	                let bh = response.bankhistory;
	                
	                // 모달 내용 채우기
	                $('#msg_bhno').val(bh.bhno);
	                $('#msg_bankname').val(bh.bankname);
	                $('#msg_accountnumber').val(bh.accountnumber);
	                $('#msg_bhdate').val(bh.bhdate);
	                $('#msg_source').val(bh.source);
	                $('#msg_amount').val(formatNumberWithCommas(bh.amount));
	                
	            },
	            error: function(xhr, status, error) {
	                console.error(error);
	            }
	     });
		
         // 모달 열기
         $('#readMessage').modal('show');
	});
	
	// 모달에서 메모 입력 후 저장시
	$("#sendbhmemobtn").on("click", function(){
		// hidden으로 되어있는 bhno 가져오기
		let msg_bhno = $("#msg_bhno").val();
		// 금액 가져오기
		let msg_amount = $("#msg_amount").val();
		// 입력한 메모 가져오기
		let memo = $("#insert_bhmessage").val();
		
        let datas = {
                bhno: msg_bhno,
                amount: msg_amount,
                memo: memo,
       };
		
		// 통장내역번호, 메모로 해야하는 일들
		$.ajax({
	            type: "GET",
	            url: "/bank/sendMemo",
	            dataType: "json",
	            data: datas,
	            success: function(response) {
	               alert(response);
	            },
	            error: function(xhr, status, error) {
	                console.error(error);
	            }
	     });
		
		alert("메모가 저장되었습니다.");
		
		// 모달 닫기
        $('#readMessage').modal('hide');
		
     	// 페이지 로드 시, 메시지 목록 다시 가져오기
	    fetchMessageList();
		
	});//end click sendbhmemobtn
	
});

	
</script>
</head>
    <!-- 메시지 클릭 시 모달 -->
    <div class="modal fade" id="readMessage" tabindex="-1">
       <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title"><strong>메시지 확인</strong></h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           	<div class="modal-body">
           		<div class="modaltable">
           			<div class="tabletitle">통장내역</div>
           			<input type="hidden" id="msg_bhno">
            		<table>
               		<tr>
               			<td class="modalintitle">은행</td>
               			<td><input type="text" id="msg_bankname" class="intable" readonly></td>
               		</tr>
               		<tr>
               			<td class="modalintitle">계좌</td>
               			<td><input type="text" id="msg_accountnumber" class="intable" readonly></td>
               		</tr>
               		<tr>
               			<td class="modalintitle">일자</td>
               			<td><input type="text" id="msg_bhdate" class="intable" readonly></td>
               		</tr>
               		<tr>
               			<td class="modalintitle">적요</td>
               			<td><input type="text" id="msg_source" class="intable" readonly></td>
               		</tr>
               		<tr>
               			<td class="modalintitle">금액</td>
               			<td><input type="text" id="msg_amount" class="intable" readonly></td>
               		</tr>
               	</table>
           		</div>
              <div>
              	<label class="labeltitle2">메모입력</label>
              	<input type="text" id="insert_bhmessage" class="modaltext" placeholder="메모를 입력해주세요."/>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" id="sendbhmemobtn">확인</button>
            </div>
         </div>
       </div>
      </div><!-- End 모달-->
<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">BlurTax</span>
        <span class="edge">edge</span>
      </a>
    </div><!-- End Logo -->
	<nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="#"><span>매입/매출거래현황</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul class="dropnavs">
              <li><a href="#">통장입출금현황</a></li>
              <li><a href="#">카드매출현황</a></li>
              <li><a href="#">매출/매입현황</a></li>
              <li><a href="#">경영현황</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>증빙기장관리</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul class="dropnavs">
              <li><a href="#">통장정리</a></li>
              <li><a href="#">증빙/영수증관리</a></li>
              <li><a href="#">전자세금계산서</a></li>
              <li><a href="#">청구서조회</a></li>
            </ul>
          </li>
		  <li class="dropdown"><a href="#"><span>세무서비스관리</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
          	<ul class="dropnavs">
              <li><a href="#">신고/납부현황</a></li>
              <li><a href="#">문서보관함</a></li>
              <li><a href="#">민원서류</a></li>
              <li><a href="#">세무대리공유폴더</a></li>
            </ul>
          </li>
		  <li class="dropdown"><a href="#"><span>법인통장관리</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
          	<ul class="dropnavs">
              <li><a href="#">통장기본설정</a></li>
              <li><a href="#">카드기본설정</a></li>
              <li><a href="#">출금동의관리</a></li>
            </ul>
          </li>
	      <li class="dropdown"><a href="#"><span>설정관리</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
          	<ul class="dropnavs">
              <li><a href="#">개인정보설정</a></li>
              <li><a href="#">회사관리</a></li>
              <li><a href="#">홈택스인증서관리</a></li>
              <li><a href="#">청구/수금설정</a></li>
            </ul>
          </li>
      </ul>
   </nav><!-- .navbar -->
      
    <!-- Saerch Bar -->
    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number"></span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

		<!-- ajax 동적 생성 부분 -->
        <li class="nav-item dropdown" id="makeMessage">
        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="../resources/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->
  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../resources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

</body>

</html>