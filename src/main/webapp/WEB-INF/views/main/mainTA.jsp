<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file="../common/tamainheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>companylist</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// 모달출력: 나중엔 동적 생성시 생기는 버튼이므로 변경
	$(function() {
		
		
		
		// 사이드 바의 동적 생성되는 div 중
		// 선택된 div의 거래처코드 값 가져오기
		//- 이 부분은 import된 sidebar를 다뤄서 그런지 본문 스크립트에 작성해야한다.
		$(".menu2").on("click", function(e){
			e.preventDefault();
			
		    console.log(this);
		    var buttonId = this.id;
			
			
		    // 클릭한 요소를 구분하여 처리합니다.
		    if (buttonId == "button1") {
		        // 버튼 1을 클릭했을 때 실행할 동작
		        console.log("버튼 1을 클릭했습니다.");
		        window.location.href = "/docrequest/docrequestTA"
		    } else if (buttonId == "button2") {
		        // 버튼 2를 클릭했을 때 실행할 동작
		        console.log("버튼 2를 클릭했습니다.");
		        window.location.href = "/receipt/receiptta"
		    } else if (buttonId == "button3") {
		        // 버튼 3를 클릭했을 때 실행할 동작
		        console.log("버튼 3를 클릭했습니다.");
		        window.location.href = "/bank/bankta"
		    }else if (buttonId == "button4") {
		        // 버튼 4를 클릭했을 때 실행할 동작
		        console.log("버튼 4를 클릭했습니다.");
		        window.location.href = "/info/infoTA"
		    }else {
		        // 다른 버튼을 클릭했을 때 실행할 동작
		        console.log("다른 버튼을 클릭했습니다.");
		    }

			
		});
		
		
	});
</script>


<style>

.card-title2 {
    padding: 20px 0 0px 0;
    font-size: 22px;
}

.bi-search2{
	font-size: 30px;
	vertical-align: -0.9em;
}

/* 추가한 CSS 스타일 */
  .nav-item-title {
    display: flex;
    align-items: center;
  }

  .search-bar {
    flex-grow: 1;
    display: flex;
    align-items: center;
  }

  .search-form {
    display: flex;
    align-items: center;
    flex-grow: 1;
  }

  .allbtn {
    margin-left: auto;
  }

.nav-item-title{
	display: flex;
}

.allbtn {
    margin-top: 10px;
    width: 30%;
    height: 50px;
}
.search-biz input {
    margin-top: 10px;
    margin-left: 5px;
    margin-right: -15px;
    width: 97%;
    height: 50px;
}

.biztype {
    color: #4169E1;
    background-color: #F0F8FF;
}

#main{
	margin-left: 0px !important;
} 

#footer{
	margin-left: 0px !important;
}

.login {
    max-width: 30%;
}
.menu {
    max-width: 70%;
    width: 100%;
}
.menu2 {
    max-width: 25%;
    width: 100%;
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 클릭 가능함을 나타냄 */
}

.col-lg-6 {
    width: 98%;
}

.menu-icon{
	font-size: 50px;
	padding: 20px 15px 15px 30px;
}

.menu-icon .iconfont{
	font-size: 20px;
	font-family: "Poppins", sans-serif;
	padding: 20px 15px 15px 0px;
}

.row2 {
    width: 100%;
    max-width: 66.66%;
}

.row3 {
    width: 100%;
    max-width: 33.33%;
}

.cardf {
    margin-bottom: 0px;
}

.dashboard .info-card {
	padding: 10px 10px 10px 10px;
}


</style>

</head>

<body>

<main id="main" class="main">

<section class="section dashboard">
      

        <!-- Left side columns -->
          <div class="row">
          <div class="row row2">




            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12 login">

              <div class="card info-card customers-card cardf">

                <div class="card-body ">
                  <h5 class="card-title">채원 세무회계<span> | 세무사</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>박채원</h6>
                      <span class="text-danger small pt-1 fw-bold">담당자</span> <span class="text-muted small pt-2 ps-1">sky@naver.com</span>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->
            
            <!-- menu Card -->
            <div class="col-xxl-4 col-xl-12 menu">

              <div class="card info-card customers-card cardf">

                <div class="card-body2">

              <!-- Slides with indicators -->
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4" class="active" aria-current="true"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item">
                    <img src="/resources/upload/mainbn1.jpg" class="d-block w-100" style="height: 150px;">
                  </div>
                  <div class="carousel-item">
                    <img src="/resources/upload/mainbn2.jpg" class="d-block w-100" style="height: 150px;">
                  </div>
                  <div class="carousel-item">
                    <img src="/resources/upload/mainbn3.jpg" class="d-block w-100" style="height: 150px;">
                  </div>
                  <div class="carousel-item active">
                    <img src="/resources/upload/mainbn4.jpg" class="d-block w-100" style="height: 150px;">
                  </div>
                </div>

                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>

              </div><!-- End Slides with indicators -->

            </div>
              </div>
            </div><!-- End menu Card -->
            
            
            
            
            
            
            
            
            <div class="menu2" id="button1">
              <div class="info-box card cardf">
                <i class="ri-file-edit-line menu-icon"> <span class="iconfont">민원 서류</span> </i>
                <p></p>
              </div>
            </div>
            
            
            <div class="menu2" id="button2">
              <div class="info-box card cardf">
                <i class="ri-clipboard-line menu-icon"> <span class="iconfont">전표증빙</span> </i>
                <p></p>
              </div>
            </div>
            
            
            <div class="menu2" id="button3">
              <div class="info-box card cardf">
                <i class="ri-bank-card-line menu-icon"> <span class="iconfont">통장 관리</span> </i>
                <p></p>
              </div>
            </div>
            
            
            <div class="menu2" id="button4">
              <div class="info-box card cardf">
                <i class="ri-file-chart-line menu-icon"><span class="iconfont">  신고 현황</span></i>
                <p></p>
              </div>
            </div>
            </div>

            
            
            
            
            
            <div class="row row3">
            <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">기업 활동 내역 <span>| Activity</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">32 min</div>
                  <i class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
                  <div class="activity-content">
                    그린테크 회사의 부가세과표.면세수입금액 확인 <a href="/docrequest/docrequestTA" class="fw-bold text-dark">민원 서류 신청</a>
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">56 min</div>
                  <i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
                  <div class="activity-content">
                    그린테크 회사의 영수증 <a href="/receipt/receiptta" class="fw-bold text-dark">증빙 전표 신청</a>
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 hrs</div>
                  <i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
                  <div class="activity-content">
                    그린테크 재무 데이터 수집 및 검토
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 day</div>
                  <i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>
                  <div class="activity-content">
                    그린테크 회사의 <a href="/info/infoTA" class="fw-bold text-dark">종합소득세 신고</a> 가 완료
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
                  <div class="activity-content">
                    그린테크 회사의 자산 관리를 위해 고정자산 목록 작성 및 갱신
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">4 weeks</div>
                  <i class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
                  <div class="activity-content">
                    그린테크 기업 BlurTax 가입
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div>
          </div>






				<div class="col-lg-6">
					<div class="card recent-sales overflow-auto">
					

						<div class="card-body">
					<h5 class="card-title card-title2">담당 수임사 리스트</h5>
						
						
							<ul class="sidebar-nav" id="sidebar-nav">
							
							
							
							
								<li class="nav-item nav-item-title">
									<div class="search-bar bizsearch">
										<form class="search-form d-flex align-items-center search-biz"
											action="#">
											<!-- blur처리 -->
											<input type="text" name="bizname" id="searchbusiness"
												placeholder="수임기업명을 검색하세요" title="Enter search keyword"
												class="ui-autocomplete-input" autocomplete="off"> <input
												type="hidden" id="searchhidden">
											<button type="button" title="Search" id="searchbizAction">
												<i class="bi bi-search bi-search2"></i>
											</button>
										</form>
									</div> <!-- End Search Bar -->

									<button type="button" class="btn btn-outline-primary allbtn"
										id="searchAllbusiness">
										<i class="ri-building-line"></i> 전체수임기업
									</button> <br> <br>
								</li>
								
								
								
								
								
								<li class="nav-item-divider"></li>
								<!-- 회색 선 추가 -->
								<br>
								<!-- 수임사 리스트 동적 생성 부분 -->
								<li class="nav-item" id="businessList"><div
										class="list-group">
										<a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10001">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">그린테크소프트</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">IT</span><small
											class="text-muted">654-98-71234</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10002">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">산들산들서점</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">판매</span><small
											class="text-muted">476-21-52319</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10003">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">착한식품농장</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">유통</span><small
											class="text-muted">327-45-61892</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10004">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">바른공사</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">건설</span><small
											class="text-muted">215-97-63482</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10005">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">다정약국</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">판매</span><small
											class="text-muted">671-34-52981</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10006">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">프렘뷰티</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">서비스</span><small
											class="text-muted">348-92-51617</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10007">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">달콤베이커리</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">제과</span><small
											class="text-muted">923-16-47528</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10008">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">더숲서점</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">판매</span><small
											class="text-muted">756-41-23859</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10009">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">작은연극단</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">공연</span><small
											class="text-muted">562-39-87124</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10010">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">영진철강</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">제조</span><small
											class="text-muted">891-27-43651</small></a><a href="#"
											class="list-group-item list-group-item-action"><input
											type="hidden" name="biznoInSidebar" value="10011">
										<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">한영테크</h5>
												<i class="bi bi-bell"></i>
											</div>
											<span class="badge biztype">IT</span><small
											class="text-muted">375-03-36685</small></a>
									</div></li>
							</ul>

						</div>

					</div>
				</div>












			</div><!-- End Left side columns -->

    </section>
        

</main>
  
  
	<!-- End #main -->
	<%@include file="../common/footer.jsp"%>
</body>

</html>