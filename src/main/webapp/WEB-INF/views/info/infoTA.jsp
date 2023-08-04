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
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#businessList").on(
								"click",
								".list-group-item",
								function(e) {
									e.preventDefault();
									let bizno = $(this).find(
											"input[name='biznoInSidebar']")
											.val();
									// body의 검색 조건의 bizno 부분에 값을 넣어 조회하도록 만들기
									$("#bizno").val(bizno);
								});

						$("#submitYear").on(
								"click",
								function(e) {
									e.preventDefault(); // 폼 제출 방지

									var year = $("input[name='year']").val(); // 선택된 년도 값을 가져옴
									var biznoList = $("input[name='bizno']")
											.map(function() {
												return $(this).val();
											}).get(); // bizno 값을 배열로 가져옴
									//             console.log(biznoList);
									$('#maketd').empty();
									processBizno(biznoList, 0, year);
								});

						function processBizno(biznoList, index, year) {
							if (index >= biznoList.length) {
								// 처리가 끝났을 때
								console.log("Processing completed.");
								return;
							}

							var biznoValue = biznoList[index];
							console.log("Processing bizno: " + biznoValue);

							$.ajax({
										type : "post",
										url : "/info/infoTA",
										data : {
											"bizno" : biznoValue,
											"year" : year
										},

										dataType : 'json',
										success : function(data) {
											// 받은 데이터에 대한 추가 처리 또는 페이지 업데이트를 여기에서 수행합니다.
											// 다음 bizno 처리를 위해 재귀 호출

											var arr = data;
											
// 											$("#maketd").on("click", "input[class^='rptfbtn']", function(e) {
// 											    e.preventDefault();
// 											    var year = $("input[name='year']").val();
// 											    var bizno = $(this).siblings("input[name='bizno']").val(); // 해당 버튼의 형제 요소인 input에서 bizno 값을 가져옵니다.
// 											    $.ajax({
// 											      type: "post",
// 											      url: "/info/infoTA/report",
// 											      contentType: "application/json; charset=utf-8",
// 											      data: {
// 											        "bizno": bizno,
// 											        "year": year
// 											      },
// 											      dataType: 'json',
// 											      success: function(data) {
// 											        console.log(bizno);
// 											        console.log(data);
// 											        // 받은 데이터를 처리하거나 페이지를 업데이트하면 됩니다.
// 											      },
// 											      error: function(xhr, status, error) {
// 											        console.error("에러여유");
// 											      }
// 											    });
// 											  });


											$('#maketd')
													.each(
															function(index) {
																let html = '<tr>';
																html += '<td>'
																		+ arr[index].bizname
																		+ '<input type="hidden" name="bizno" value="' + arr[index].bizno + '"></td>';
																html += '<td>'
																		+ arr[index].year
																		+ '</td>';
																html += '<td>'
																		+ arr[index].bizincome
																		+ '</td>';
																html += '<td>'
																		+ arr[index].tax
																		+ '</td>';
																		
																html += '<td>'
																		+ arr[index].tax
																		+ '</td>';
																html += '<td>'
																		+ arr[index].tax
																		+ '</td>';
																html += '<td>'
																		+ arr[index].tax
																		+ '</td>';
																html += '<td>'
																		+ arr[index].tax
																		+ '</td>';
																html += '<td >'
																		+ '<input type="button" class="rptfbtn" value="신고서작성"/>'
																		+ '</td>';
																html += '</tr>';
																$(this).append(
																		html);
															});


											processBizno(biznoList, index + 1,
													year);
										},
										error : function(xhr, status, error) {
											console.error(error);
											// 다음 bizno 처리를 위해 재귀 호출
											processBizno(biznoList, index + 1,
													year);
										}
									});

							
							  var rptfbtnSelector = ".rptfbtn";
							  $("#maketd").off("click", rptfbtnSelector);
							  $("#maketd").on("click", rptfbtnSelector, function(e) {
								  
								  console.log($(this).closest('tr').find("td:first-child").text().trim());
								  console.log($(this).closest('tr').find("td").eq(2).text().trim());
								  
								  	var biznumber = $(this).closest('tr').find("input[name='bizno']").val();
								  	var bizname = $(this).closest('tr').find("td:first-child").text().trim();
							  		var year = $("input[name='year']").val();
							  		 var bizincome = $(this).closest('tr').find("td").eq(2).text().trim();
								    var tax = $(this).closest('tr').find("td").eq(3).text().trim();
								    
								    $.ajax({
								      type: "post",
								      url: "/info/infoTA/report",
								      data: {
									        "bizno": biznumber,
									        "bizname" : bizname,
									        "year": year,
									        "bizincome": bizincome,
									        "tax": tax
									      },
								      dataType: 'json',
								      success: function(data) {
								        console.log(data);
								        
										  $("#maketd").off("click", rptfbtnSelector);
										  $("#maketd").on("click", rptfbtnSelector, function(e) {
											  
											  $(this).val() = "납부서전송";
											  var transdate = $(this).closest('tr').find("td").eq(7).text.trim();
											  
										  }
								        
								      },
								      error: function(xhr, status, error) {
								        console.error(error);
								      }
								      
								      
								    });
								   
								  });
							  
							

// 							$('.rptfbtn')
// 									.on(
// 											"click",
// 											function(e) {
// 												var year = $(
// 														"input[name='year']")
// 														.val();
// 												var bizno = $(
// 														"input[name='bizno']")
// 														.val();

// 												$
// 														.ajax({
// 															type : "post",
// 															url : "/info/infoTA/report",
// 															contentType : "application/json; charset=utf-8",
// 															data : {
// 																"bizno" : bizno,
// 																"year" : year
// 															},

// 															dataType : 'json',
// 															success : function(
// 																	data) {

// 																console
// 																		.log('data');
// 															},
// 															error : function(
// 																	xhr,
// 																	status,
// 																	error) {
// 																console
// 																		.error("에러여유");
// 															}
// 														});
// 											});
						}

					});
</script>




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
										<th scope="col" class="tabletop"></th>
									</tr>
								</thead>

								<tbody id="maketd">
									<c:forEach items="${listCO}" var="business">
										<tr class='${business.bizno}'>
											<td><c:out value="${business.bizname}" /> <input
												type="hidden" name="bizno"
												value="<c:out value='${business.bizno}' />"></td>
										</tr>
									</c:forEach>
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


</body>

</html>