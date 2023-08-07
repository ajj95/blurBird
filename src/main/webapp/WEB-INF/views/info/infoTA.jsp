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
	width: 250px;
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

/* :root { */
/*   --completed-width: newValue; */
/* } */

.completed {
width: 50%;
	height: 30px;
	padding: 0;
	text-align: center;
	background-color: #4169E1;
	color: #fff;
	font-weight: 600;
	font-size: .8rem;
}

.undeclared {
	width: 50%;
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

/* .printButton { */
/* 	border: 0.5px; */
/* } */
</style>
<script type="text/javascript">
	$(document).ready(
			
			
			
					function() {$("#businessList").on("click",".list-group-item",function(e) {
									e.preventDefault();
									let bizno = $(this).find("input[name='biznoInSidebar']").val();
									// body의 검색 조건의 bizno 부분에 값을 넣어 조회하도록 만들기
									$("#bizno").val(bizno);
								});
					
					var statuscount = "";
					var totalcount = "";
					
					 function getStatusCount() {
				         
				           $.ajax({
				               type: "GET",
				               dataType:'json',
				               url: "/info/getReportStatusCount",
				               
				               success: function(response) {
				            	   
// 				            	   console.log(response);
// 				            	   console.log("!!!!!!" + response.statuscount);
// 				            	   console.log(statuscount);
				                   statuscount = response.statuscount;
				         			totalcount = response.totalcount;
// 				         			console.log("statuscount: " + statuscount);
				         			
				         			 // 비율 계산
            var percentage = ((statuscount / totalcount) * 100).toFixed(1);
            console.log("Percentage: " + percentage + "%");
            
         // .percentage 클래스가 지정된 div에 비율 값을 넣기
            $(".percentage").text(percentage + "%");
				         			
				         			let start = $(".statusBar");
							           
							           start.empty();
							           let str = '';
							           str += '<div class="graph">';
							           str += '<div class="bar completed">';
							           str += '<dl class="desc">';
							           str += '<dt>신고완료 <em>';
							           str += statuscount;
							           str += '</em>건';
							           str += '</dt>';
							           str += '</dl>';
							           str += '</div>';
							           str += '<div class="bar undeclared">';
							           str += '<dl class="desc">';
							           str += '<dt>미신고<em>';
							      str += totalcount-statuscount;
							           str += '</em>건';
							           str += '</dt>';
							           str += '</div>';
							           str += '</div>';
							           
							           start.html(str);
				               },
				               error: function(xhr, status, error) {
				                   console.error(error);
				               }
				           });
				           
				           
				       }
					
					  function formatNumberWithCommas(number) {
					        return number.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					   };
					   
					   
					   
					  
					var submitbtn ="#submitYear" 
						
					$(".selectYear").off("click", submitbtn);
					
					
						$("#submitYear").on("click",function(e) {
							
							
							
									e.preventDefault(); // 폼 제출 방지
									
									// 예시로 외부에서 값을 받아오는 함수
									function getValueFromExternalSource() {
									  // 여기에서 외부에서 값을 받아오는 로직을 구현
									  
									  
									  
									  return "40%"; // 외부에서 받아온 값
									}
									
									const completedElement = document.querySelector(".completed");
									const newValue = getValueFromExternalSource();
									completedElement.style.setProperty("--completed-width", newValue);
									
// 									var pct = ".percentage";
// 									var graph = ".graph";
									
// 									console.log("what is pct: " + $('pct').val);
									
									

									var year = $("input[name='year']").val(); // 선택된 년도 값을 가져옴
									
									var biznoList = $("input[name='bizno']").map(function() {
												return $(this).val();
											}).get(); // name이 bizno인 input요소의 값들을 배열로 가져옴 -> 여기서 버튼을 한번 눌렀던 행의 bizno를 못가져온다.
											
// 											console.log("this is " + this);
// 											console.log("첫번째: " + $("input[name='bizno']").map(function() {
// 												return $(this).val();
// 											}).get()); 
// 											console.log("두번째: " + $(this).val());
// 									            console.log(biznoList);
									
									
											$('#maketd').empty();
											getStatusCount();
									processBizno(biznoList, 0 , year); // biznoList의 인덱스 0번부터 1씩 더해가면서 가져온다. -> 값이 잘 들어왔으면 잘 출력돼야 한다.
									
								}); // $("#submitYear").on("click",function(e) 종료
										
								
								
								
						function processBizno(biznoList, index, year) {
// 							console.log(biznoList);
// 							console.log(index);
							
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
											
											// 납부서 전송한 개수 가져오기
     
											console.log("dataaaaaaaaaaaaaaaa : " + data);
											
											
											
											
											// 다음 bizno 처리를 위해 재귀 호출
											
											
											

											var arr = data;
// 											console.log("aaa");

// 											data.forEach(function(item, index){
// 												console.log("인덱스: " + index);
// 												console.log("항목: " + item);
// 											});
											
											
											
											$('#maketd').each(function(index, item) {
																let html = '<tr>';
																html += '<td>'+ arr[index].bizname+ '<input type="hidden" name="bizno" value="' + arr[index].bizno + '"></td>';
																html += '<td>'+ arr[index].year+ '</td>';
																 if (arr[index].bizincome) {
																        html += '<td>'+ formatNumberWithCommas(arr[index].bizincome) + '<input type="hidden" name="bizincome" value="' + arr[index].bizincome + '"></td>';
																    } else {
																        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
																    }
// 																html += '<td>'+ arr[index].bizincome+ '</td>';
															    if (arr[index].tax) {
															        html += '<td>'+ formatNumberWithCommas(arr[index].tax) + '<input type="hidden" name="tax" value="' + arr[index].tax + '"></td>';
															    } else {
															        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
															    }

// 																html += '<td>'+ arr[index].tax+ '</td>';

																  // 값이 있는 경우 해당 값을 셀에 추가
															    if (arr[index].reportdate) {
															        html += '<td>'+ arr[index].reportdate + '<input type="hidden" name="reportdate" value="' + arr[index].reportdate + '"></td>';
															    } else {
															        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
															    }

															    if (arr[index].reportdoc) {
															        html += '<td>'+ arr[index].reportdoc + '<input type="hidden" name="reportdoc" value="' + arr[index].reportdoc + '"></td>';
															    } else {
															        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
															    }

															    if (arr[index].paymentslip) {
															        html += '<td>'+ arr[index].paymentslip + '<input type="hidden" name="paymentslip" value="' + arr[index].paymentslip + '"></td>';
															    } else {
															        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
															    }

															    if (arr[index].transdate) {
															        html += '<td>'+ arr[index].transdate + '<input type="hidden" name="transdate" value="' + arr[index].transdate + '"></td>';
															    } else {
															        html += '<td></td>'; // 값이 없는 경우 빈 셀 추가
															    }
																html += '<td >'+ '<input type="button" class="rptfbtn btn btn-primary" value="신고서작성"/>'+ '</td>';
																html += '</tr>';
																$(this).append(html);
																
															});
											getStatusCount();
											processBizno(biznoList, index + 1,year);
										}
									});

							var rptfbtnSelector = ".rptfbtn";
							$("#maketd").off("click", rptfbtnSelector);
							$("#maketd").on("click",rptfbtnSelector,function(e) {
								
					

												// 								  console.log($(this).closest('tr').find("td:first-child").text().trim());
												// 								  console.log($(this).closest('tr').find("td").eq(2).text().trim());

// 												console.log("this는 이것입니다: " + $(this).closest('tr').find("input[name='bizno']").val());
										
												
												var biznumber = $(this).closest('tr').find("input[name='bizno']").val();
												var bizname = $(this).closest('tr').find("td:first-child").text().trim();
												var year = $("input[name='year']").val();
												var bizincome = $(this).closest('tr').find("td").eq(2).text().trim();
												var tax = $(this).closest('tr').find("td").eq(3).text().trim();
												var reportdate = $(this).closest('tr').find("td").eq(4).text().trim();
												var reportdoc = $(this).closest('tr').find("td").eq(5).text().trim();
												var paymentslip = $(this).closest('tr').find("td").eq(6).text().trim();
												var transdate = $(this).closest('tr').find("td").eq(7).text().trim();
												var status = $(this).val();

												
													var loc = $(this).parent().closest('tr').find("td")
												
												$.ajax({
															type : "post",
															url : "/info/infoTA/report",
															data : {
																"bizno" : biznumber,
																"bizname" : bizname,
																"year" : year,
																"bizincome" : bizincome,
																"tax" : tax,
																"reportdate": reportdate,
																"reportdoc": reportdoc,
																"paymentslip": paymentslip,
																"transdate" : transdate,
																"status":status
															},
															dataType : 'json',
															success : function(data) {
																
																
																
// 																console.log(data);
// 																console.log($('.rptfbtn')	.closest('tr');
// 																console.log($('.rptfbtn')	.closest('tr').find("td").eq(0));
// 																console.log($('.rptfbtn').closest('tr').find("td").eq(0).text());
// 																console.log($('.rptfbtn').closest('tr').find("td").eq(0).text().val);


																loc.eq(0).text(data.bizname);
																loc.eq(1).text(data.year);
																loc.eq(2).text(formatNumberWithCommas(data.bizincome));
																loc.eq(3).text(formatNumberWithCommas(data.tax));

																var date = new Date(data.reportdate);
																var formattedDate = date.toLocaleDateString('ko-KR');
																loc.eq(4).text(formattedDate);
																loc.eq(5).text(data.reportdoc);
																loc.eq(6).text(data.paymentslip);
																loc.eq(8).html('<input type="button" class="transferbtn btn btn-primary" value="'+data.status+'"/>');
																
																getStatusCount();

										var trbtn = ".transferbtn";
					$("#maketd").off("click", trbtn);
					$("#maketd").on("click",trbtn,function(e) {
						var loc = $(this).parent().closest('tr').find("td")
						console.log(loc);
					$.ajax({
				type : "post",
				url : "/info/infoTA/transfer",
				data : {
					"bizno" : biznumber,
				},
				dataType : 'json',
				success : function(data) {
					
					
// 					console.log(data);
					
					var date = new Date(data.reportdate);
					var formattedDate = date.toLocaleDateString('ko-KR');
					loc.eq(7).text(formattedDate);
					loc.eq(8).html('<input type="button" class="btn btn-primary" disabled value="'+data.status+'"/>');
					
					
					getStatusCount();
				},
				error : function(xhr,status,error) {
					console.error(error);
				}

			}); // trbtn 클릭 ajax
					
				}); // trbtn 클릭
																
																
															} // success 끝
						})// ajax 끝

					}); // $("#maketd").on("click",rptfbtnSelector,function(e) 끝
							
					
						} // function processBizno(biznoList, index, year)  종료(연도 선택 후 조회버튼 눌렀을 때 실행되는 함수)
					})
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
					<br>
						<div><h4>조회 년도</h4>
						<!-- 연월 선택 캘린더 -->
						<div class="selectMonth">
							<input type="number" name="year" placeholder="2023"
								value='<c:out value="${year}"/>' min="1900" max="2100"></input>
							<button type="submit" class="btn btn-outline-secondary" id="submitYear">조회</button>
						</div></div>
					</form>

					<br>


					<!-- 신고현황 -->
					<div>
						<!-- 신고현황 바 위의 정보 -->
						<div class="barInfo">
							<div>국세청 신고현황</div>
							<div class="percentage"></div>
						</div>

						<!-- 전체 건수 나타내는 신고현황 바(막대기) -->
						<div class="statusBar">

							<div class="graph">
								<div class="bar completed">
									<dl class="desc">
										<dt>
											신고완료 <em></em>
										</dt>
									</dl>
								</div>
								<div class="bar undeclared">
									<dl class="desc">
										<dt>
											 <em>미신고</em>
										</dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div>
						<h4>신고리스트
						<span><button type="button" id="print" class="printButton btn btn-outline-secondary"  onclick="window.print()">인쇄</button></span></h4>
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
										<th scope="col" class="tabletop">신고현황</th>
									</tr>
								</thead>

								<tbody id="maketd">
									<c:forEach items="${listCO}" var="business">
										<tr class='${business.bizno}'>
											<td><c:out value="${business.bizname}" /> <input
												type="hidden" name="bizno"
												value="<c:out value='${business.bizno}' />"></td>

											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>



<!-- 							<button type="button" class="btn btn-primary">확인</button> -->
<!-- 							<button type="button" class="btn btn-secondary">취소</button> -->

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