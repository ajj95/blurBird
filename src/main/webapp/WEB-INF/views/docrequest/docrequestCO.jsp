<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file="../common/coheader.jsp"%>
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
		
		$("#request").on("click", function() {
			$("#requestmodal").modal('show');
		});
		
		
		$(".request").on("click", function() {
			var buttonValue2 = $(this).data("value");
			$("#buttonValue2").val(buttonValue2);
			$("#requestmodal2").modal('show');
		});
		
		$(".request2").on("click", function() {
			$("#requestmodal3").modal('show');
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

.modal2 { 
	--bs-modal-footer-border-width: none;
}

.card-title2 {
    font-size: 24px;
}

.fade:not(.show) {
    display: none;
}

</style>

</head>

<body>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<button type="button" id="request"
				class="btn btn-outline-primary docbtn">민원서류 신청하기</button>

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
									<c:if test="${docreq.drstate.drstatename eq '발급신청' || docreq.drstate.drstatename eq '발급대기'}">
										<tr>
											<td scope="row"><c:out
													value="${docreq.member.membername}" /></td>

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
									<c:if test="${docreq.drstate.drstatename eq '발급완료' || docreq.drstate.drstatename eq '수신완료'}">
										<tr>
											<td scope="row"><c:out
													value="${docreq.member.membername}" /></td>
	
											<td><b><c:out value="${docreq.doctype}" /></b>[<c:out
													value="${docreq.count}" />]</td>
	
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${docreq.wishdate}" /></td>
	
											<td><c:out value="${docreq.purpose}" /></td>
											
											<c:if test="${docreq.drstate.drstatename eq '발급완료'}">
												<td><button type="button" class="btn btn-outline-primary request" data-value="<c:out value='${docreq.docreqno}' />" >수신하기</button></td>
											</c:if>
											
											<c:if test="${docreq.drstate.drstatename eq '수신완료'}">
												<td><button type="button" class="btn btn-primary request2" >수신완료</button></td>
											</c:if>
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

		<!-- 민원서류신청 요청 시 등장하는 모달 -->
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
					<form role="form" action="/docrequest/create" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="modal-body">
							<div class="modaltable">
								<div class="card-body">
									<h5 class="card-title">민원서류 신청서</h5>

									<!-- General Form Elements -->
									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">회사담당자</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" value="박길동" readonly="readonly" name="member.membername">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">신청서류</label>
										<div class="col-sm-10">
											<select class="form-select" aria-label="Default select example"  name="doctype">
												<option value="">신청 서류 선택</option>
												<option value="사업자등록신청서">사업자등록신청서</option>
												<option value="사업자등록증재교부신청서">사업자등록증재교부신청서</option>
												<option value="사업자등록정정신고서">사업자등록정정신고서</option>
												<option value="휴폐업신고서">휴폐업신고서</option>
												<option value="총괄납부승인">총괄납부승인.변경.포기신청</option>
												<option value="간이과세적용신청.포기신고서">간이과세적용신청.포기신고서</option>
												<option value="면세적용신청.포기신고서">면세적용신청.포기신고서</option>
												<option value="부가세과표.면세수입금액 확인">부가세과표.면세수입금액 확인</option>
												<option value="제무재표등 확인">제무재표등 확인</option>
												<option value="납세증명서">납세증명서</option>
												<option value="원천징수이행상황신고서 확인">원천징수이행상황신고서 확인</option>
												<option value="소득금액확인">소득금액확인</option>
												<option value="사실증명">사실증명</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">신청 서류 기간</label>
										<div class="col-sm-10">
											<select class="form-select"
												aria-label="Default select example" name="doctagetdate"><!-- name="doctagetdate" -->
												<option value="">신청 서류 기간 선택</option>
												<option value="2018-01-01">2018-01-01 ~ 2018-12-31</option>
												<option value="2019-01-01">2019-01-01 ~ 2019-12-31</option>
												<option value="2020-01-01">2020-01-01 ~ 2020-12-31</option>
												<option value="2021-01-01">2021-01-01 ~ 2021-12-31</option>
												<option value="2022-01-01">2022-01-01 ~ 2022-12-31</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">부수</label>
										<div class="col-sm-10">
											<select class="form-select"
												aria-label="Default select example" name="count">
												<option value="">부수 선택</option>
												<option value="1부">1부</option>
												<option value="2부">2부</option>
												<option value="3부">3부</option>
												<option value="4부">4부</option>
												<option value="5부">5부</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">용도</label>
										<div class="col-sm-10">
											<select class="form-select"
												aria-label="Default select example" name="purpose">
												<option value="">용도 선택</option>
												<option value="금융기관 제출용">금융기관 제출용</option>
												<option value="공공기관 제출용">공공기관 제출용</option>
												<option value="기타">기타</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputDate" class="col-sm-2 col-form-label">발급
											희망일자</label>
										<div class="col-sm-10">
											<input type="date" class="form-control" name="wishdate"><!-- name="wishdate" -->
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">발급방법</label>
										<div class="col-sm-10">
											<select class="form-select"
												aria-label="Default select example" name="way">
												<option value="">발급방법 선택</option>
												<option value="온라인발급(PDF)">온라인발급(PDF)</option>
												<option value="온라인발급(전자문서지갑)">온라인발급(전자문서지갑)</option>
												<option value="오프라인발급(FAX)">오프라인발급(FAX)</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"></label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="발급완료 시, 발급내역에서 PDF파일로 확인 가능합니다." disabled="">
										</div>
									</div>

									<fieldset class="row mb-3">
										<legend class="col-form-label col-sm-2 pt-0">
											주민(법인)<br>등록번호<br>공개 여부
										</legend>
										<div class="col-sm-10">
											<div class="col-sm-10">
											  <div class="form-check">
											    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked=""> 
											    <label class="form-check-label" for="gridRadios1"> 공개 </label>
											  </div>
											  <div class="form-check">
											    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
											    <label class="form-check-label" for="gridRadios2"> 비공개 </label>
											  </div>
											</div>
											<div>
												<strong style="color: #4154f1;">(비공개시 출력 예 :
													950101-1******)</strong>
											</div>
										</div>
									</fieldset>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">확인</button>
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
		
				<!-- 수신하기 동작 시 등장하는 모달 -->
		<div class="modal fade modal2" id="requestmodal2" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							<strong>민원서류 수신확인</strong>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form role="form" action="/docrequest/received" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="modal-body">
							<div class="modaltable">
								<div class="card-body">
									<h5 class="card-title card-title2">요청하신 민원서류를 수신하시겠습니까?</h5>

									<!-- General Form Elements -->
									
									<input type="hidden" id="buttonValue2" name="docreqno">
									
			
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">확인</button>
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
		
		<!-- 수신하기 동작 시 등장하는 모달 -->
		<div class="modal fade modal2" id="requestmodal3" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							<strong>민원서류 수신확인</strong>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
						<div class="modal-body">
							<div class="modaltable">
								<div class="card-body">
									<h5 class="card-title card-title2">요청서류</h5>
									
									<div style="display: flex; justify-content: center;">
										<img src="/resources/upload/localtax.PNG" style="max-width: 100%; height: auto;">
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-primary request2"
											data-bs-dismiss="modal">닫기</button>
									</div>
									

								</div>
							</div>
						</div>
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