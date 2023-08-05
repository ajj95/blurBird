<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/taheader.jsp"%>



<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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
	table-layout: auto; /* 테이블 열 너비를 고정으로 설정*/
}

th, td {
	text-align: center; /* 글자를 가운데로 정렬 */
	vertical-align: middle; /* 세로 중앙 정렬 */
}

th:first-child, td:first-child {
	/* 첫 번째 열 넓이 */
	width: 350px;
}

th:first-child(2), td:first-child(2) {
	/* 두번째 열 넓이 */
	
}

.tabletop {
	background-color: #F5F5F5 !important;
}

/* 신고현황 그래프 */
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

.barInfo {
	font-weight: 700;
}

.printButton {
	border: 0.5px;
}
</style>




</head>

<body>
	<%@include file="../common/searchbizsidebar.jsp"%>
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
								aria-selected="true">종합소득세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">부가가치세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">사업장현황</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">법인세</button>
						</li>
						<li class="nav-item active" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">원천세</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#bordered-profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">지방소득세</button>
						</li>
						</li>
					</ul>

					<!-- 지급년월/연월선택 캘린더 -->
					<form class="selectYear" action="/info/infoTA" method="post">
						<span>조회 년도</span>
						<!-- 연월 선택 캘린더 -->
						<div class="selectMonth">
							<input type="number" name="year" placeholder="2023"
								value='<c:out value="${year}"/>' min="1900" max="2100"></input>
							<button type="submit" id="submitYear">조회</button>
						</div>
					</form>

					<br>


					<!-- 신고현황 -->
					<div>
						<!-- 신고현황 바 위의 정보 -->
						<div class="barInfo">
							<div>국세청 신고현황</div>
							<div class="percentage">20%</div>
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
											미신고 <em>4</em>건
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
										<th scope="col" class="tabletop">수임처</th>
										<th scope="col" class="tabletop">귀속년월</th>
										<th scope="col" class="tabletop">종합소득금액</th>
										<th scope="col" class="tabletop">결정세액</th>
										<th scope="col" class="tabletop">신고일자</th>
										<th scope="col" class="tabletop">접수증</th>
										<th scope="col" class="tabletop">납부서</th>
										<th scope="col" class="tabletop">전송일자</th>
										<th scope="col" class="tabletop">버튼</th>
									</tr>
								</thead>

								<tbody id="maketd">
										<tr>
											<td><input	type="hidden" name="bizno"/>테스트1</td>
											<td>테스트1-0</td>
											<td>테스트1-1</td>
											<td>테스트1-2</td>
											<td>테스트1-3</td>
											<td>테스트1-4</td>
											<td>테스트1-5</td>
											<td>테스트1-6</td>
											<td><input	class="rptfbtn" type="button" name="bizno" value="신고서 작성"/></td>
										</tr>
										<tr>
											<td><input	type="hidden" name="bizno"/>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td>테스트2</td>
											<td><input	 class="rptfbtn" type="button" name="bizno" value="신고서 작성"/></td>
										</tr>
										<tr>
											<td><input	type="hidden" name="bizno"/>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td>테스트3</td>
											<td><input	class="rptfbtn" type="button" name="bizno" value="신고서 작성"/></td>
										</tr>
										
								</tbody>
							</table>



							<button type="button" class="btn btn-primary">확인</button>
							<button type="button" class="btn btn-secondary">취소</button>

						</div>

						<div class="tab-pane fade" id="bordered-profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<h2>페이지를 제작 중입니다.</h2>
						</div>

						<div class="tab-pane fade" id="bordered-contact" role="tabpanel"
							aria-labelledby="contact-tab"></div>
					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>

		</section>
		<!-- End section dashboard -->

	</main>
	<!-- End #main -->
	<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
	$(document).off("click",'.rptfbtn').on("click",'.rptfbtn',function(){
		let btnLocation = $(this).parent().closest('tr');
		let bcnc = btnLocation.closest('tr').find('td:nth-child(1)');
		let regdate = btnLocation.closest('tr').find('td:nth-child(2)');
		let tax = btnLocation.closest('tr').find('td:nth-child(3)');
		let confirmedtax = btnLocation.closest('tr').find('td:nth-child(4)');
		let action = btnLocation.closest('tr').find('td:nth-child(5)');
		let receipt = btnLocation.closest('tr').find('td:nth-child(6)');
		let receipt2 = btnLocation.closest('tr').find('td:nth-child(7)');
		let senddate = btnLocation.closest('tr').find('td:nth-child(8)');
		console.log(bcnc);
		console.log(regdate);
		console.log(tax);
		console.log(confirmedtax);
		console.log(action);
		console.log(receipt);
		console.log(receipt2);
		console.log(senddate);
		bcnc.text("나는");
		regdate.text("읽기쉬운");
		tax.text("마음이야");
		confirmedtax.text("당신도");
		action.text("스윽");
		receipt.text("훝고");
		receipt2.text("가셔요");
		senddate.text("달랠길없는");
	})
</script>
</body>

</html>