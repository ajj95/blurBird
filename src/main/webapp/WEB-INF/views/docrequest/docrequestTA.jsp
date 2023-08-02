<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taheader.jsp"%>
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
	// 모달출력: 나중엔 동적 생성시 생기는 버튼이므로 변경
	$(function() {
		$(".request").on("click", function() {
			$("#requestmodal").modal('show');
		});
	});
</script>

<style>
.docbtn {
	margin-left: 5px;
	width: 250px;
}

.nav-item-divider {
	border-top: 1px solid #ccc;
	margin: 8px 0;
}

.pagetitle {
	margin-top: 8px;
}

table.total {
	background-color: #f6f9ff !important;
}

.tabletop {
	background-color: #F5F5F5 !important;
}

.modal { 
	--bs-modal-width: 750px;
}

#request.btn { 
--bs-btn-line-height: 1;
}

.half {
	flex: 0 0 auto;
	width: 33.333333%;
}
</style>

</head>

<body>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<button type="button" class="btn btn-outline-primary docbtn">민원서류
				신청하기</button>

			<br>
			<br>
			<li class="nav-item-divider"></li>
			<!-- 회색 선 추가 -->
			<br>
			<li class="nav-item"><a class="nav-link " href="#"> <i
					class="bi bi-grid"></i> <span>전체민원서류</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>사업자등록신청서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>사업자등록증재교부신청서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>사업자등록정정신고서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>휴폐업신고서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>총괄납부승인/변경/포기신청</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>간이과세적용신청/포기신고서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>면세적용신청/포기신고서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>재무재표등 확인</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>원천징수이행상황신고서 확인</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>소득금액확인</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>납세증명서</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#">
					<i class="bi bi-journal-text"></i> <span>사실증명</span>
			</a></li>
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>민원서류 신청</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section dashboard">
			<div class="card">
				<div class="card-body">
					<br>
					<!-- Default Tabs -->
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home" type="button"
								role="tab" aria-controls="home" aria-selected="true">발급신청</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">발급완료</button>
						</li>
					</ul>
					<div class="tab-content pt-2" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col" class="tabletop">발급신청자</th>
										<th scope="col" class="tabletop">신청서류</th>
										<th scope="col" class="tabletop">발급희망일</th>
										<th scope="col" class="tabletop">용도 및 제출처</th>
										<th scope="col" class="tabletop">발급상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="docreq">
										<c:if test="${docreq.drstate.drstatename eq '발급신청'}">
											<tr>
												<th scope="row"><c:out
														value="${docreq.member.membername}" /></th>

												<td><b><c:out value="${docreq.doctype}" /></b>[<c:out
														value="${docreq.count}" />]</td>

												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${docreq.wishdate}" /></td>

												<td><c:out value="${docreq.purpose}" /></td>

												<td><button type="button" class="btn btn-outline-primary request" data-value="<c:out value='${docreq.docreqno}' />" >발급하기</button></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with hoverable rows -->
						</div>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<!-- Table with hoverable rows -->
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col" class="tabletop">발급신청자</th>
									<th scope="col" class="tabletop">신청서류</th>
									<th scope="col" class="tabletop">발급희망일</th>
									<th scope="col" class="tabletop">용도 및 제출처</th>
									<th scope="col" class="tabletop">발급상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="docreq">
									<c:if
										test="${docreq.drstate.drstatename eq '발급완료' || docreq.drstate.drstatename eq '수신완료' || docreq.drstate.drstatename eq '발급대기'}">
										<tr>
											<th scope="row"><c:out
													value="${docreq.member.membername}" /></th>

											<td><b><c:out value="${docreq.doctype}" /></b>[<c:out
													value="${docreq.count}" />]</td>

											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${docreq.wishdate}" /></td>

											<td><c:out value="${docreq.purpose}" /></td>

											<td><c:out value="${docreq.drstate.drstatename}" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
					</div>
				</div>
				<!-- End Default Tabs -->

			</div>
			</div>
		</section>
		<!-- End section dashboard -->

		<!-- 민원서류신청 발급 시 등장하는 모달 -->
		<div class="modal fade" id="requestmodal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							<strong>민원서류 발급신청</strong>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form role="form" action="/docrequest/issuance" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="modal-body">
							<div class="modaltable">
								<div class="card-body">
									<h5 class="card-title">신청내역 상세조회</h5>

									<!-- General Form Elements -->
									<input type="hidden" value="1" name="docreqno">
									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">상호</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="그린테크소프트"
												readonly="readonly" name="bizname">
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">사업자등록<br>번호
										</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="654-98-71234"
												readonly="readonly" name="businesslicense">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">성명</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="박길동"
												readonly="readonly" name="membername">
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">주민(법인)<br>번호
										</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="박길동"
												readonly="readonly" name="member.membername">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">전화번호</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="02-945-2324"
												readonly="readonly" name="bistel">
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">업종</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="IT"
												readonly="readonly" name="industry">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">사업장소재지</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" value="서울특별시 강남구 역삼동 123-45번지"
												readonly="readonly" name="bizaddress">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">신청서류</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" value="납세증명서"
												readonly="readonly" name="doctype">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">수량</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="1부"
												readonly="readonly" name="count">
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">용도</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" value="공공기관 제출용"
												readonly="readonly" name="purpose">
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">발급</button>
									</div>

								</div>
							</div>
						</div>
					</form>
					<!-- End General Form Elements -->
				</div>
			</div>
		</div>
		<!-- End Vertically centered Modal-->

	</main>
	<!-- End #main -->
	<%@include file="../common/footer.jsp"%>
</body>

</html>