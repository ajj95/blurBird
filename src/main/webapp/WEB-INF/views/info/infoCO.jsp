<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/coheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>infoco</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
#main {
	margin-left: 0px !important;
}

.pagetitle {
	margin-top: 8px;
}

.detailTitle {
	text-align: right;
	margin-bottom: 10px;
	margin-right: 6.5px;
}

.detailTitle span {
	margin-left: 10px;
}

.details {
	margin-left: auto;
}

.details span {
	margin-left: 10px;
}

.selectMonth {
	margin-left: 15px;
}

#footer {
	margin-left: 0 !important;
}
</style>
<script type="text/javascript">


	</script>
	
</head>

<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>신고/납부 현황</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section dashboard">
			<div class="card">
				<div class="card-body">
					<br>
					<!-- Bordered Tabs -->
					<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab"
						role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#bordered-home"
								type="button" role="tab" aria-controls="home"
								aria-selected="true">종합소득세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">부가가치세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-contact" type="button" role="tab"
								aria-controls="contact" aria-selected="false">사업장현황</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-contact" type="button" role="tab"
								aria-controls="contact" aria-selected="false">법인세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-contact" type="button" role="tab"
								aria-controls="contact" aria-selected="false">원천세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-contact" type="button" role="tab"
								aria-controls="contact" aria-selected="false">지방소득세</button>
						</li>
					</ul>
					<div class="tab-content pt-2" id="borderedTabContent">
						<div class="tab-pane fade show active" id="bordered-home"
							role="tabpanel" aria-labelledby="home-tab">
							<table class="table table-hover table-bordered">

								<!-- 신고서 관리 graph -->
								<div class="card-body">
									<h5 class="card-title">
										신고서 관리 <span>| Today</span>
									</h5>
									<div class="detailTitle">
										<span></span> <span></span> <span></span>
									</div>

									<div class="activity">

										<div class="activity-item d-flex">
											<div class="activite-label">32 min</div>
											<i
												class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
											<div class="activity-content">
												종합소득세 <a href="#" class="fw-bold text-dark">과세표준확정신고 및 납부계산서</a> 
											</div>
											<div class="details">
												<span class="biznincome"></span> <span class="tax"></span> <span class=reportdate></span>
											</div>
										</div>

										<!-- End activity item-->

									</div>

								</div>

							</table>

							<!--신고현황 -->
							<div>
								<!-- 신고연도 선택 -->
								<div class="card-body">
									<h5 class="card-title">
										신고현황
										<!-- 지급년월/연월선택 캘린더 -->
											<form class="selectYear" action="getISdetail" method="get">
												<!-- 연월 선택 캘린더 -->
													<input type="number" name="year" placeholder="2023"
														value='<c:out value="${year}"/>' min="1900" max="2100"></input>
													<button type="submit" id="submitYear">조회</button>
												</div>
											</form>
										<!-- 년도 선택 월력 띄우기-->
<!-- 										<span class="selectMonth"> <input type="month" -->
<!-- 											value="2023-07"></input> -->
<!-- 										</span> -->
									</h5>
								</div>
								<!-- 신고 현황 선 그래프 -->
								<div class="card-body">
									<h5 class="card-title"></h5>

									<!-- Line Chart -->
									<canvas id="lineChart"
										style="max-height: 400px; display: block; box-sizing: border-box; height: 307px; width: 614px;"
										width="922" height="460"></canvas>
										<script>
										
										document.addEventListener("DOMContentLoaded", () => {
										    function fetchDataAndDrawChart() {
										      $.ajax({
										        type: "GET",
										       
										        dataType: 'json',
										        url: '/info/getIS',
										        success: function(data) {
										        	//console.log(data);
										        	
										        	// const dataValues1 = [65, 59, bizincome, 81]; // 첫 번째 선 그래프에 대한 데이터 배열
										        	 const dataValues1 =[];
										        	 const dataValues2 = [];
										        	 
										        	data.forEach(i => {
										        		dataValues1.push(i.businessIncome);
										        		dataValues2.push(i.tax);
										        		
										        	})
										
										        	
										          //var bizincome = data.businessIncome;
										          //var tax = data.tax;

										          //const dataValues1 = [65, 59, bizincome, 81]; // 첫 번째 선 그래프에 대한 데이터 배열
										         

										          new Chart(document.querySelector('#lineChart'), {
										            type: 'line',
										            data: {
										              labels: ['2021', '2022', '2023'],
										              datasets: [{
										                label: '종합소득금액',
										                data: dataValues1,
										                fill: true,
										                borderColor: 'rgb(75, 192, 192)',
										                tension: 0.5
										              }, {
										                label: '납부세액',
										                data: dataValues2,
										                fill: true,
										                borderColor: 'rgb(255, 99, 132)',
										                tension: 0.5
										              }]
										            },
										            options: {
										              scales: {
										                y: {
										                  beginAtZero: true
										                }
										              }
										            }
										          });
										        },
										        error: function(xhr, status, error) {
										          console.log(error);
										        }
										      });
										    }

										    fetchDataAndDrawChart();
										  });
										</script>
									<!-- End Line CHart -->

								</div>
							</div>

							<!-- 세목월별내역								 -->
							<!--  세목별 조회 -->
							<div class="card-body">
								<h5 class="card-title">소득별 납부세액</h5>

								<!-- Bar Chart -->
								<canvas id="barChart"
									style="max-height: 400px; display: block; box-sizing: border-box; height: 163px; width: 326px;"
									width="490" height="244"></canvas>
								<script>
								document.addEventListener("DOMContentLoaded", () => {
									  let myChart = null; // Chart 객체를 저장할 변수를 추가합니다.

									  function fetchDataAndDrawChart(year) {
									    $.ajax({
									      type: "GET",
									      dataType: 'json',
									      data: {
									        "year": year
									      },
									      url: '/info/getISdetail',
									      success: function(data) {
									          var bizincome = data.businessIncome;
									          var tax = data.tax;

									          const dataValues = [65, 59, bizincome, tax, 0, 0];

									          // Chart 객체가 이미 생성된 경우, 삭제(destroy)합니다.
									          if (myChart) {
									            myChart.destroy();
									          }

									          // 새로운 Chart 객체를 생성하여 변수에 저장합니다.
									          myChart = new Chart(document.querySelector('#barChart'), {
									            type: 'bar',
									            data: {
									              labels: ['이자소득', '배당소득', '사업소득', '근로소득', '연금소득', '기타소득'],
									              datasets: [{
									                label: '사업소득',
									                data: [0, 0, bizincome, 0, 0, 0],
									                backgroundColor: 'rgba(255, 99, 132, 0.2)',
									                borderColor: 'rgb(255, 99, 132)',
									                borderWidth: 1
									              }, {
									                label: '납부세액',
									                data: [0, 0, tax, 0, 0, 0],
									                backgroundColor: 'rgba(153, 102, 255, 0.2)',
									                borderColor: 'rgb(153, 102, 255)',
									                borderWidth: 1
									              }]
									            },
									            options: {
									              scales: {
									                y: {
									                  beginAtZero: true
									                }
									              }
									            }
									          });
									        },
									        // ... (기존 코드는 동일하게 유지합니다)
									      });
									    }

									    $('#submitYear').on("click", function(e) {
									      e.preventDefault();
									      const year = parseInt($('input[name="year"]').val());
									      fetchDataAndDrawChart(year);
									    });

									    fetchDataAndDrawChart(2023);
									  });
								
								
								
								
//                 document.addEventListener("DOMContentLoaded", () => {
//                   new Chart(document.querySelector('#barChart'), {
//                     type: 'bar',
//                     data: {
//                       labels: ['이자소득', '배당소득', '사업소득', '근로소득', '연금소득', '기타소득'],
//                       datasets: [{
//                         label: 'Bar Chart',
//                         data: dataValues,
//                         backgroundColor: [
//                           'rgba(255, 99, 132, 0.2)',
//                           'rgba(255, 159, 64, 0.2)',
//                           'rgba(255, 205, 86, 0.2)',
//                           'rgba(75, 192, 192, 0.2)',
//                           'rgba(54, 162, 235, 0.2)',
//                           'rgba(153, 102, 255, 0.2)',
//                           'rgba(201, 203, 207, 0.2)'
//                         ],
//                         borderColor: [
//                           'rgb(255, 99, 132)',
//                           'rgb(255, 159, 64)',
//                           'rgb(255, 205, 86)',
//                           'rgb(75, 192, 192)',
//                           'rgb(54, 162, 235)',
//                           'rgb(153, 102, 255)',
//                           'rgb(201, 203, 207)'
//                         ],
//                         borderWidth: 1
//                       }]
//                     },
//                     options: {
//                       scales: {
//                         y: {
//                           beginAtZero: true
//                         }
//                       }
//                     }
//                   });
//                 });
              </script>
								<!-- End Bar CHart -->

							</div>



						</div>




						<div class="tab-pane fade" id="bordered-profile" role="tabpanel"
							aria-labelledby="profile-tab">Nesciunt totam et.
							Consequuntur magnam aliquid eos nulla dolor iure eos quia.
							Accusantium distinctio omnis et atque fugiat. Itaque doloremque
							aliquid sint quasi quia distinctio similique. Voluptate nihil
							recusandae mollitia dolores. Ut laboriosam voluptatum dicta.</div>
						<div class="tab-pane fade" id="bordered-contact" role="tabpanel"
							aria-labelledby="contact-tab">Saepe animi et soluta ad odit
							soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium
							quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus
							impedit molestias nostrum veniam. Qui amet ipsum iure.
							Dignissimos fuga tempore dolor.</div>
					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>
		</section>
		<!-- End section dashboard -->

	</main>
	<!-- End #main -->
	<%@include file="../common/footer.jsp"%>
</body>
</html>