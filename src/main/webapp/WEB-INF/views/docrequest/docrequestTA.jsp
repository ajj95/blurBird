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
		
		// 사이드 바의 동적 생성되는 div 중
		// 선택된 div의 거래처코드 값 가져오기
		//- 이 부분은 import된 sidebar를 다뤄서 그런지 본문 스크립트에 작성해야한다.
		$("#businessList").on("click", ".list-group-item", function(e){
			e.preventDefault();
			let bizno = $(this).find("input[name='biznoInSidebar']").val();
			// body의 검색 조건의 bizno 부분에 값을 넣어 조회하도록 만들기
			$("#bizno").val(bizno);
		});
		
		
		$(".request").on("click", function() {
			
			var buttonValue = $(this).data("value");
			$("#buttonValue").val(buttonValue);
			
			$("#requestmodal").modal('show');
			
			    $.ajax({
			      type: "POST", // 혹은 "GET" 등 HTTP 요청 메서드를 선택
			      url: "/docrequest/modal", // 요청을 처리할 서버의 URL
			      data: { docreqno: buttonValue }, // 서버로 전달할 데이터
			      dataType:"json",
			      success: function(response) {
			        // 요청이 성공적으로 처리되었을 때 실행할 콜백 함수
			        // 서버로부터 받은 응답은 response 매개변수로 접근 가능
			        console.log("서버 응답: ", response);
			        console.log("서버 응답: ", response.userno);
			        $("#bizname").val(response.business.bizname);
			        $("#businesslicense").val(response.business.businesslicense);
			        $("#membername").val(response.member.membername);
			        $("#ssn").val(response.member.ssn);
			        $("#bistel").val(response.business.bistel);
			        $("#industry").val(response.business.industry);
			        $("#bizaddress").val(response.business.bizaddress);
			        $("#doctype").val(response.doctype);
			        $("#count").val(response.count);
			        $("#purpose").val(response.purpose);
			      },
			      error: function(xhr, status, error) {
			        // 요청이 실패했을 때 실행할 콜백 함수
			        console.log("에러 발생: ", error);
			      }
			   });
		});
		
	});
</script>

<style>
.allbtn {
    margin-top: 10px;
    margin-left: 5px;
    width: 250px;
}
.search-biz input {
    width: 250px;
}

.biztype {
    color: #4169E1;
    background-color: #F0F8FF;
}

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

.fade:not(.show) {
    display: none;
}

</style>

</head>

<body>
	<!-- ======= Sidebar ======= -->
<%@include file="../common/searchbizsidebar.jsp"%>
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
												<td scope="row"><c:out
														value="${docreq.member.membername}" /></td>

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
									
									<input type="hidden" id="buttonValue" name="docreqno">
									
									
									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">상호</label>
										<div class="col-sm-10 half">
										
											<input type="text" class="form-control" id="bizname"
												readonly="readonly" >
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">사업자등록<br>번호
										</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="businesslicense"
												readonly="readonly" >
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">성명</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="membername"
												readonly="readonly" >
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">주민(법인)<br>번호
										</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="ssn"
												readonly="readonly" >
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">전화번호</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="bistel"
												readonly="readonly" >
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">업종</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="industry"
												readonly="readonly" >
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">사업장소재지</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="bizaddress"
												readonly="readonly" ">
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">신청서류</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="doctype"
												readonly="readonly" >
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">수량</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="count"
												readonly="readonly" >
										</div>
										<label for="inputText" class="col-sm-2 col-form-label">용도</label>
										<div class="col-sm-10 half">
											<input type="text" class="form-control" id="purpose"
												readonly="readonly" >
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