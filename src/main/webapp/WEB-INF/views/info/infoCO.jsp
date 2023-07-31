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
								aria-selected="true">원천세</button>
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
								aria-controls="contact" aria-selected="false">종합소득세</button>
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
										<span>총 지급액</span> <span>납부세액</span> <span>신고일자</span>
									</div>

									<div class="activity">

										<div class="activity-item d-flex">
											<div class="activite-label">32 min</div>
											<i
												class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
											<div class="activity-content">
												Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
													officiis</a> beatae
											</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
											</div>
										</div>

										<!-- End activity item-->

										<div class="activity-item d-flex">
											<div class="activite-label">56 min</div>
											<i
												class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
											<div class="activity-content">Voluptatem blanditiis
												blanditiis eveniet</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
											</div>
										</div>
										<!-- End activity item-->

										<div class="activity-item d-flex">
											<div class="activite-label">2 hrs</div>
											<i
												class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
											<div class="activity-content">Voluptates corrupti
												molestias voluptatem</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
											</div>
										</div>
										<!-- End activity item-->

										<div class="activity-item d-flex">
											<div class="activite-label">1 day</div>
											<i
												class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
											<div class="activity-content">
												Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
													voluptatem</a> tempore
											</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
											</div>
										</div>
										<!-- End activity item-->

										<div class="activity-item d-flex">
											<div class="activite-label">2 days</div>
											<i
												class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
											<div class="activity-content">Est sit eum reiciendis
												exercitationem</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
											</div>
										</div>
										<!-- End activity item-->

										<div class="activity-item d-flex">
											<div class="activite-label">4 weeks</div>
											<i
												class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
											<div class="activity-content">Dicta dolorem harum nulla
												eius. Ut quidem quidem sit quas</div>
											<div class="details">
												<span>12002103</span> <span>1020301</span> <span>2023.07.31</span>
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
										<!-- 년도 선택 월력 띄우기-->
										<span class="selectMonth"> <input type="month"
											value="2023-07"></input>
										</span>
									</h5>
								</div>
								<!-- 신고 현황 선 그래프 -->
								<div class="card-body">
									<h5 class="card-title">세목별 소득금액 월별 내역</h5>

									<!-- Line Chart -->
									<canvas id="lineChart"
										style="max-height: 400px; display: block; box-sizing: border-box; height: 307px; width: 614px;"
										width="922" height="460"></canvas>
									<script>
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#lineChart'), {
                    type: 'line',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                        label: 'Line Chart',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
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
                });
              </script>
									<!-- End Line CHart -->

								</div>
							</div>

							<!-- 세목월별내역								 -->
							<!--  세목별 조회 -->
							<div class="card-body">
								<h5 class="card-title">세액 월별 내역</h5>

								<!-- Bar Chart -->
								<canvas id="barChart"
									style="max-height: 400px; display: block; box-sizing: border-box; height: 163px; width: 326px;"
									width="490" height="244"></canvas>
								<script>
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#barChart'), {
                    type: 'bar',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                        label: 'Bar Chart',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        backgroundColor: [
                          'rgba(255, 99, 132, 0.2)',
                          'rgba(255, 159, 64, 0.2)',
                          'rgba(255, 205, 86, 0.2)',
                          'rgba(75, 192, 192, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(153, 102, 255, 0.2)',
                          'rgba(201, 203, 207, 0.2)'
                        ],
                        borderColor: [
                          'rgb(255, 99, 132)',
                          'rgb(255, 159, 64)',
                          'rgb(255, 205, 86)',
                          'rgb(75, 192, 192)',
                          'rgb(54, 162, 235)',
                          'rgb(153, 102, 255)',
                          'rgb(201, 203, 207)'
                        ],
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
                });
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