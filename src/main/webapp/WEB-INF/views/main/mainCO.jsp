<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file="../common/comainheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
$(function() {

    $(".first-service").on("click", function(){
 	   window.location.href = "/docrequest/docrequestCO";
    });
    
    $(".second-service").on("click", function(){
 	   window.location.href = "/receipt/receiptco";
    });

    $(".third-service").on("click", function(){
 	   window.location.href = "/bank/bankco";
    });
    
    $(".fourth-service").on("click", function(){
 	   window.location.href = "/info/infoCO"
    });

		
	});
</script>


<style>
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
.service-item {
    position: relative;
    z-index: 1;
    padding: 30px;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
    background-color: #fff;
    border-radius: 10px;
    border-top-right-radius: 50px;
    transition: all .3s;
}
.service-item .icon {
  margin-left: 0px;
  margin-bottom: 30px;
  background-repeat: no-repeat;
  width: 50px;
  height: 50px;
  transition: all .3s;
}

.service-item h4 {
  transition: all .3s;
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 15px;
}

.service-item p {
  transition: all .3s;
  font-size: 15px;
  margin-bottom: 20px;
}

.service-item:hover h4,
.service-item:hover p,
.service-item:hover .text-button a {
  color: #fff;
}

.first-service .icon {
  background-image: url(../resources/assets/img/service-icon-01.png);
}

.first-service:hover .icon {
  background-image: url(../resources/assets/img/service-icon-hover-01.png);
}

.second-service .icon {
  background-image: url(../resources/assets/img/service-icon-02.png);
}

.second-service:hover .icon {
  background-image: url(../resources/assets/img/service-icon-hover-02.png);
}


.third-service .icon {
  background-image: url(../resources/assets/img/service-icon-03.png);
}

.third-service:hover .icon {
  background-image: url(../resources/assets/img/service-icon-hover-03.png);
}

.fourth-service .icon {
  background-image: url(../resources/assets/img/service-icon-04.png);
}

.fourth-service:hover .icon {
  background-image: url(../resources/assets/img/service-icon-hover-04.png);
}

.service-item:hover {
  background-image: url(../resources/assets/img/service-bg.jpg);
  background-position: right top;
  background-repeat: no-repeat;
  background-size: cover;
}

.importantmenu {
  display: flex;
  flex-wrap: nowrap;
  gap: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  max-width: 1050px;
}

.customers-card{
	height: 170px;
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
                  <h5 class="card-title">그린테크소프트<span> | 수임사</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>김성민</h6>
                      <span class="text-danger small pt-1 fw-bold">대표님</span> <span class="text-muted small pt-2 ps-1">sungmin@naver.com</span>

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
            
			<div class="importantmenu">
            	<div class="col-lg-3">
					<div class="service-item first-service">
						<div class="icon"></div>
						<h4>민원 서류</h4>
						<p>원하는 서류 실시간 확인 발급</p>
					</div>
				</div>
            
              <div class="col-lg-3">
					<div class="service-item second-service">
						<div class="icon"></div>
						<h4>전표증빙</h4>
						<p>영수증 촬영으로 편리한 전표처리</p>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="service-item third-service">
						<div class="icon"></div>
						<h4>통장 관리</h4>
						<p>편리한 자동분개와 내용 확인</p>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="service-item fourth-service">
						<div class="icon"></div>
						<h4>신고현황</h4>
						<p>즉시 확인 가능한 신고서, 납부서</p>
					</div>
				</div>
            </div>
            </div><!-- end row2 -->

            
            
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
                    회사의 부가세과표.면세수입금액 확인 <a href="/docrequest/docrequestCO" class="fw-bold text-dark">민원 서류 신청</a>
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">56 min</div>
                  <i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
                  <div class="activity-content">
                    회사의 영수증 <a href="/receipt/receiptco" class="fw-bold text-dark">증빙 전표 신청</a>
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 hrs</div>
                  <i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
                  <div class="activity-content">
                    법인세 신고서 작성을 위한 재무 데이터 수집 및 검토
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 day</div>
                  <i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>
                  <div class="activity-content">
                    회사의 <a href="/info/infoCO" class="fw-bold text-dark">종합소득세 신고</a> 완료 
                  </div>
                </div><!-- End activity item-->
                
                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>
                  <div class="activity-content">
                    국민 은행<a href="/bank/bankco" class="fw-bold text-dark"> 통장내역 전표처리</a> 완료 
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
                  <div class="activity-content">
                    회사의 자산 관리를 위해 고정자산 목록 작성 및 갱신
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 week</div>
                  <i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
                  <div class="activity-content">
                    기존 전표 업로드 완료
                  </div>
                </div><!-- End activity item-->
                
                <div class="activity-item d-flex">
                  <div class="activite-label">4 weeks</div>
                  <i class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
                  <div class="activity-content">
                    기본 통장, 카드 인증서 등록 완료
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

          <!-- Vertical Bar Chart -->
          <div class="col-lg-6">
  
                  <h5 class="card-title">이익률 분석 <span>/ 상반기</span></h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: '매출액',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: '영업이익률',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: '순이익률',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2023-01-01", "2023-02-01", "2023-03-01", "2023-04-01", "2023-05-01", "2023-06-01", "2023-07-01"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

            </div><!-- End Reports -->
              <h5 class="card-title">기업 매출 & 세금 현황</h5>
              <div id="verticalBarChart" style="min-height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;" class="echart" _echarts_instance_="ec_1691131085676"><div style="position: relative; width: 361px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="541" height="600" style="position: absolute; left: 0px; top: 0px; width: 361px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class="" style="position: absolute; display: block; border-style: solid; white-space: nowrap; z-index: 9999999; box-shadow: rgba(0, 0, 0, 0.2) 1px 2px 10px; transition: opacity 0.2s cubic-bezier(0.23, 1, 0.32, 1) 0s, visibility 0.2s cubic-bezier(0.23, 1, 0.32, 1) 0s, transform 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgb(255, 255, 255); border-width: 1px; border-radius: 4px; color: rgb(102, 102, 102); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 10px; top: 0px; left: 0px; transform: translate3d(102px, 175px, 0px); border-color: rgb(255, 255, 255); pointer-events: none; visibility: hidden; opacity: 0;"><div style="margin: 0px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><div style="font-size:14px;color:#666;font-weight:400;line-height:1;">China</div><div style="margin: 10px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><span style="display:inline-block;margin-right:4px;border-radius:10px;width:10px;height:10px;background-color:#5470c6;"></span><span style="font-size:14px;color:#666;font-weight:400;margin-left:2px">2011</span><span style="float:right;margin-left:20px;font-size:14px;color:#666;font-weight:900">131,744</span><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="margin: 10px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><span style="display:inline-block;margin-right:4px;border-radius:10px;width:10px;height:10px;background-color:#91cc75;"></span><span style="font-size:14px;color:#666;font-weight:400;margin-left:2px">2012</span><span style="float:right;margin-left:20px;font-size:14px;color:#666;font-weight:900">134,141</span><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="clear:both"></div></div></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#verticalBarChart")).setOption({
                    tooltip: {
                      trigger: 'axis',
                      axisPointer: {
                        type: 'shadow'
                      }
                    },
                    legend: {},
                    grid: {
                      left: '3%',
                      right: '4%',
                      bottom: '3%',
                      containLabel: true
                    },
                    xAxis: {
                      type: 'value',
                      boundaryGap: [0, 0.01]
                    },
                    yAxis: {
                      type: 'category',
                      data: ['세금', '매출량']
                    },
                    series: [{
                        name: '2022',
                        type: 'bar',
                        data: [131744, 630230]
                      },
                      {
                        name: '2023',
                        type: 'bar',
                        data: [134141, 681807]
                      }
                    ]
                  });
                });
              </script>
              <!-- End Vertical Bar Chart -->
        
        </div><!-- End Left side columns -->
    </section>

</main>
 	<!-- Scripts -->
	<script src="../resources/assets/js/owl-carousel.js"></script>
	<script src="../resources/assets/js/animation.js"></script>
	<script src="../resources/assets/js/imagesloaded.js"></script>
	<script src="../resources/assets/js/popup.js"></script>
	<script src="../resources/assets/js/custom.js"></script>   
  
	<!-- End #main -->
	<%@include file="../common/footer.jsp"%>
</body>

</html>