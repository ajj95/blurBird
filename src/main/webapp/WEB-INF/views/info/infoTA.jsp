<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>infota</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.pagetitle {
	margin-top: 8px;
}

.allbtn {
	margin-top: 10px;
	margin-left: 5px;
	width: 250px;
}

.allbtn:hover {
	background-color: #4169E1;
}

.nav-item-divider {
	border-top: 1px solid #ccc;
}

.search-biz input {
	width: 250px;
}

.biztype {
	color: #4169E1;
	background-color: #F0F8FF;
}

table {
	width: 100%; /* 테이블 전체 넓이를 100%로 설정 */
	table-layout: fixed; /* 테이블 열 너비를 고정으로 설정*/
}

th, td {
	text-align: center; /* 글자를 가운데로 정렬 */
	vertical-align: middle; /* 세로 중앙 정렬 */
}

th:first-child, td:first-child {
	width: 35px; /* 첫 번째 열 넓이 */
}

th:nth-child(2), td:nth-child(2) {
	width: 50px; /* 두 번째 열 넓이 */
}

.tabletop {
	background-color: #F5F5F5 !important;
}

.barInfo {
	display: flex;
	justify-content: space-between;
}

.graph {
	display: flex;
}

.completed {
	width: 20%;
	height: 30px;
	background-color: skyblue;
	font-weight: 600;
	font-size: .8rem;
}

.undeclared {
	width: 100%;
	height: 30px;
	padding: 0;
	text-align: center;
	background-color: lightgrey;
	color: #111;
	font-weight: 600;
	font-size: .8rem;
}

.desc {
	display: flex;
	justify-content: space-between;
}

.barInfo{
	font-weight: 700;
}

.printButton{
	border: 0.5px;
}
</style>
</head>

<body>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item">
				<div class="search-bar bizsearch">
					<form class="search-form d-flex align-items-center search-biz"
						method="POST" action="#">
						<input type="text" name="query" placeholder="수임기업명을 검색하세요"
							title="Enter search keyword">
						<button type="submit" title="Search">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div> <!-- End Search Bar -->

				<nav class="header-nav ms-auto">
					<ul class="d-flex align-items-center">
						<li class="nav-item d-block d-lg-none"><a
							class="nav-link nav-icon search-bar-toggle " href="#"> <i
								class="bi bi-search"></i>
						</a></li>
						<!-- End Search Icon-->
					</ul>
				</nav>
			</li>
			<button type="button" class="btn btn-outline-primary allbtn">
				<i class="ri-building-line"></i> 전체수임기업
			</button>
			<br>
			<br>
			<li class="nav-item-divider"></li>
			<!-- 회색 선 추가 -->
			<br>
			<li class="nav-item">
				<!-- 수임사 리스트 -->
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">엣지상사</h5>
							<i class="bi bi-bell"></i>
						</div> <span class="badge biztype">제조</span> <small class="text-muted">222-3333-5555</small>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">더존</h5>
							<i class="bi bi-bell"></i>
						</div> <span class="badge biztype">IT</span> <small class="text-muted">222-3333-5555</small>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">대한건설</h5>
							<i class="bi bi-bell"></i>
						</div> <span class="badge biztype">건설</span> <small class="text-muted">222-3333-5555</small>
					</a>
				</div> <!-- End List group Advanced Content -->
			</li>

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>신고현황표</h1>
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
						</li>
					</ul>

					<!-- 지급년월/연월선택 캘린더 -->
					<div>
						<br> <span>지급년월</span>
						<!-- 연월 선택 캘린더 -->
						<div class="selectMonth">
							<input type="month" value="2023-01"></input>
						</div>
						<br>
					</div>

					<!-- 신고현황 -->
					<div>
						<!-- 신고현황 바 위의 정보 -->
						<div class="barInfo">
							<div>국세청 신고현황</div>
							<div class="percentage">00%</div>
						</div>

						<!-- 전체 건수 나타내는 신고현황 바(막대기) -->
						<div class="statusBar">

							<div class="graph">
								<div class="bar completed">
									<dl class="desc">
										<dt>
											신고완료 <em>1</em>건
										</dt>
									</dl>
								</div>
								<div class="bar undeclared">
									<dl class="desc">
										<dt>
											미신고 <em>5</em>건
										</dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<div>
						신고리스트
						<button type="button" class="printButton">인쇄</button>
					</div>

					<div class="tab-content pt-2" id="borderedTabContent">
						<div class="tab-pane fade show active" id="bordered-home"
							role="tabpanel" aria-labelledby="home-tab">

							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th scope="col" class="tabletop"><input
											class="form-check-input" type="checkbox"></th>
										<th scope="col" class="tabletop">수임처</th>
										<th scope="col" class="tabletop">귀속년월</th>
										<th scope="col" class="tabletop">총 지급액</th>
										<th scope="col" class="tabletop">납부세액</th>
										<th scope="col" class="tabletop">신고일자</th>
										<th scope="col" class="tabletop">접수증</th>
										<th scope="col" class="tabletop">납부서</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>1</td>
										<td>Brandon Jacob</td>
										<td>Designer</td>
										<td>28</td>
										<td>2016-05-25</td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2</td>
										<td>Bridie Kessler</td>
										<td>Developer</td>
										<td>35</td>
										<td>2014-12-05</td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>3</td>
										<td>Ashleigh Langosh</td>
										<td>Finance</td>
										<td>45</td>
										<td>2011-08-12</td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>4</td>
										<td>Angus Grady</td>
										<td>HR</td>
										<td>34</td>
										<td>2012-06-11</td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>5</td>
										<td>Raheem Lehner</td>
										<td>Dynamic Division Officer</td>
										<td>47</td>
										<td>2011-04-19</td>
									</tr>
								</tbody>
							</table>

							<button type="button" class="btn btn-primary">확인</button>
							<button type="button" class="btn btn-secondary">취소</button>
							<button type="button" class="btn btn-success">Success</button>
							<button type="button" class="btn btn-danger">Danger</button>
							<button type="button" class="btn btn-warning">Warning</button>
							<button type="button" class="btn btn-info">Info</button>
							<button type="button" class="btn btn-dark">Dark</button>
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