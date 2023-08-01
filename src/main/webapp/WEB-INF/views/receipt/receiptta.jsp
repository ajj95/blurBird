<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../common/taheader.jsp" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta content="width=device-width, initial-scale=1.0" name="viewport">

				<title>infota</title>
				<meta content="" name="description">
				<meta content="" name="keywords">
				<style>
					.listcondition {
						display: flex;
						align-items: center;
						gap: 10px;
						position: relative;
						margin-bottom: 15px;
						border: 1px solid #ccc;
						padding: 13px;
					}

					.listconditionbtn {
						position: absolute;
						right: 10px;
					}

					.line {
						display: flex;
						align-items: center;
					}

					.line>* {
						margin-right: 10px;
						/* 각 요소 사이의 간격을 조절 */
					}

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
						width: 100%;
						/* 테이블 전체 넓이를 100%로 설정 */
						table-layout: fixed;
						/* 테이블 열 너비를 고정으로 설정*/
					}

					th,
					td {
						text-align: center;
						/* 글자를 가운데로 정렬 */
						vertical-align: middle;
						/* 세로 중앙 정렬 */
					}

					th:first-child,
					td:first-child {
						width: 50px;
						/* 첫 번째 열 넓이 */
					}

					.tabletop {
						background-color: #F5F5F5 !important;
					}

					.left {
						padding-top: 15px;
						float: left;
						width: 25%;
						box-sizing: border-box;
						height: 900px;
						overflow: auto;
					}

					.right {
						padding-left: 15px;
						float: right;
						box-sizing: border-box;
						flex-wrap: wrap;
						height: 900px;
						overflow: auto;
						width: 75%;
					}

					.bottom {
						clear: both;
						width: 100%;
						box-sizing: border-box;
						width: 100%;
					}

					.custom-image {
						width: 100%;
						height: auto;
						/* 높이를 자동으로 조절 */
					}

					.modal-footer .form-control {
						display: inline-block;
						width: 80%;
						vertical-align: middle;
						margin-right: 5px;
					}
				</style>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			</head>

			<body>
				<!-- ======= Sidebar ======= -->
				<aside id="sidebar" class="sidebar">
					<ul class="sidebar-nav" id="sidebar-nav">
						<li class="nav-item">
							<div class="search-bar bizsearch">
								<form class="search-form d-flex align-items-center search-biz" method="POST" action="#">
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
									</div> <span class="badge biztype">제조</span> <small
										class="text-muted">222-3333-5555</small>
								</a> <a href="#" class="list-group-item list-group-item-action">
									<div class="d-flex w-100 justify-content-between">
										<h5 class="mb-1">더존</h5>
										<i class="bi bi-bell"></i>
									</div> <span class="badge biztype">IT</span> <small
										class="text-muted">222-3333-5555</small>
								</a> <a href="#" class="list-group-item list-group-item-action">
									<div class="d-flex w-100 justify-content-between">
										<h5 class="mb-1">대한건설</h5>
										<i class="bi bi-bell"></i>
									</div> <span class="badge biztype">건설</span> <small
										class="text-muted">222-3333-5555</small>
								</a>
							</div> <!-- End List group Advanced Content -->
						</li>

					</ul>

				</aside>
				<!-- End Sidebar-->

				<main id="main" class="main">
					<div class="pagetitle">
						<h1>증빙전표입력</h1>
					</div>
					<!-- End Page Title -->
					<br>
					<section class="section dashboard">
						<div class=card>
							<div class=card-body>
								<div class="left">
									<!--Start div left  -->
									<div>
										<img src="../resources/upload/receipt1.jpg" alt="receipt"
											class="img-fluid custom-image">
									</div>
								</div>
								<!-- End div left -->
								<div class="right">
									<!-- Start div right -->
									<div class="card">
										<br>
										<!-- Bordered Tabs -->
										<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
											<li class="nav-item" role="presentation">
												<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
													data-bs-target="#bordered-home" type="button" role="tab"
													aria-controls="home" aria-selected="true">미확인 증빙</button>
											</li>
											<li class="nav-item" role="presentation">
												<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
													data-bs-target="#bordered-profile" type="button" role="tab"
													aria-controls="profile" aria-selected="false">적합 증빙</button>
											</li>
											<li class="nav-item" role="presentation">
												<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
													data-bs-target="#bordered-contact" type="button" role="tab"
													aria-controls="contact" aria-selected="false">부적합 증빙</button>
											</li>
										</ul>

										<div class="tab-content pt-2" id="borderedTabContent">
											<div class="tab-pane fade show active" id="bordered-home" role="tabpanel"
												aria-labelledby="home-tab">
												<div class="listcondition">
													<div class="line">
														<label for="inputDate" class="col-form-label labeltitle">수신
															일시</label>
														<div class="line">
															<input type="date" id="startdate"
																class="form-control">~&nbsp;<input type="date"
																id="enddate" class="form-control">
														</div>
													</div>
													<div class="listconditionbtn">
														<button type="button" class="btn btn-secondary">조회</button>
													</div>
												</div>
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th scope="col" class="tabletop">No.</th>
															<th scope="col" class="tabletop">증빙내용</th>
															<th scope="col" class="tabletop">적합여부</th>
															<th scope="col" class="tabletop">부적합사유</th>
															<th scope="col" class="tabletop">메모</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="flexRadioDefault1"></td>
															<td>퀵서비스</td>
															<td><select class="form-select">
																	<option value="1" selected>적합</option>
																	<option value="2">부적합</option>
																</select></td>
															<td>몰?루</td>
															<td>
																<button type="button" class="btn btn-outline-dark"
																	data-bs-toggle="modal"
																	data-bs-target="#exampleModal">
																	<i class="ri-article-fill"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td><input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="flexRadioDefault1"></td>
															<td>밥값</td>
															<td><select class="form-select">
																	<option value="1" selected>적합</option>
																	<option value="2">부적합</option>
																</select></td>
															<td>아!루</td>
															<td>
																<button type="submit" class="btn btn-outline-dark"
																	data-bs-toggle="modal"
																	data-bs-target="#exampleModal">
																	<i class="ri-article-fill"></i>
																</button>
															</td>
														</tr>

													</tbody>
												</table>

											</div>
											<div class="tab-pane fade" id="bordered-profile" role="tabpanel"
												aria-labelledby="profile-tab">
												<div class="listcondition">
													<div class="line">
														<label for="inputDate" class="col-form-label labeltitle">수신
															일시</label>
														<div class="line">
															<input type="date" id="startdate"
																class="form-control">~&nbsp;<input type="date"
																id="enddate" class="form-control">
														</div>
													</div>
													<div class="listconditionbtn">
														<button type="button" class="btn btn-outline-dark">전체
															${receipt.total }</button>
														<button type="button"
															class="btn btn-outline-primary">반영</button>
														<button type="button"
															class="btn btn-outline-danger">미반영</button>
													</div>
												</div>
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th scope="col" class="tabletop">No.</th>
															<th scope="col" class="tabletop">거래일자</th>
															<th scope="col" class="tabletop">구분</th>
															<th scope="col" class="tabletop">유형</th>
															<th scope="col" class="tabletop">거래처</th>
															<th scope="col" class="tabletop">적요</th>
															<th scope="col" class="tabletop">공급가액</th>
															<th scope="col" class="tabletop">세액</th>
															<th scope="col" class="tabletop">합계</th>
															<th scope="col" class="tabletop">분개</th>
															<th scope="col" class="tabletop">전표반영</th>
															<th scope="col" class="tabletop">메모</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><input class="form-check-input"
																	data-bs-toggle="collapse"
																	data-bs-target="#collapseExample"
																	aria-expanded="false"
																	aria-controls="collapseExample"  type="checkbox">
															</td>
															<td><input type="text" class="form-control"></td>
															<td><select class="form-select">
																	<option value="1">일반</option>
																	<option value="2">매입</option>
																</select></td>
															<td></td>
															<td><input type="text" class="form-control"></td>
															<td>퀵서비스</td>
															<td><input type="text" class="form-control"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td><button type="button" class="btn btn-outline-dark"
																	data-bs-toggle="modal"
																	data-bs-target="#exampleModal">
																	<i class="ri-article-fill"></i>
																</button></td>
														</tr>
													</tbody>
												</table>
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th scope="col" class="tabletop">No.</th>
															<th scope="col" class="tabletop">거래처</th>
															<th scope="col" class="tabletop">구분</th>
															<th scope="col" class="tabletop" colspan="2">적요</th>
															<th scope="col" class="tabletop" colspan="2">계정과목</th>
															<th scope="col" class="tabletop">차변(출금)</th>
															<th scope="col" class="tabletop">대변(입금)</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><input class="form-check-input " type="checkbox"></td>
															<td><input type="text" class="form-control"></td>
															<td></td>
															<td colspan="2"></td>
															<td>
																<button type="button" class="btn btn-outline-dark"
																	data-bs-toggle="modal" data-bs-target="#accountCode"
																	onclick="openAccountCodeModal()">
																	<i class="ri-article-fill"></i>
																</button>
															</td>
															<td class ="accountCodeName">현금</td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
												<div class="bottom collapse" id="collapseExample">
													<button type="button" class="btn btn-outline-danger"
														style="float: right;">부적합으로 변경</button>
													<button type="button" class="btn btn-outline-warning"
														style="float: right;">전표삭제</button>
													<button type="button" class="btn btn-outline-success"
														style="float: right;">전표반영</button>
												</div>
											</div>

											<div class="tab-pane fade" id="bordered-contact" role="tabpanel"
												aria-labelledby="contact-tab">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th scope="col" class="tabletop">No.</th>
															<th scope="col" class="tabletop">증빙내용</th>
															<th scope="col" class="tabletop">적용여부</th>
															<th scope="col" class="tabletop" colspan="2">부적합사유</th>
															<th scope="col" class="tabletop">메모</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><input class="form-check-input"
																	data-bs-toggle="collapse"
																	data-bs-target="#collapseExample2"
																	aria-expanded="false"
																	aria-controls="collapseExample" type="checkbox">
															</td>
															<td>비품구매</td>
															<td>부적합</td>
															<td>02</td>
															<td>이미 반영된 증빙입니다.</td>
															<td><button type="button" class="btn btn-outline-dark"
																	data-bs-toggle="modal"
																	data-bs-target="#exampleModal">
																	<i class="ri-article-fill"></i>
																</button></td>
														</tr>
													</tbody>
												</table>
												<div class="collapse" id="collapseExample2">
													<button type="button" class="btn btn-outline-danger"
														style="float: right;">삭제</button>
													<button type="button" class="btn btn-outline-success"
														style="float: right;">적합으로 변경</button>
												</div>
											</div>
										</div>
									</div>

									<!-- End Bordered Tabs -->
								</div>
								<!-- End div right -->

							</div>
						</div>
						<!-- Button trigger modal -->

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">메모</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form>
											<textarea class="form-control"
												id="message-text">몰?루는건가.. 그래... 그런일이 있었지.. 하지만 알려주지않겠다.</textarea>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>
						<!-- modal end -->
						<div class="modal fade" id="accountCode" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">계정과목
											코드도움</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="accountTable table table-hover table-bordered">
											<thead>
												<tr>
													<th>No.</th>
													<th>계정과목명</th>
												</tr>
											</thead>
											<tbody id="accountListModal">
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<div class="input-group mb-3">
											<input type="text" class="valueToAccount form-control" placeholder="계정코드 입력"
												aria-label="accontInfo" aria-describedby="button-addon2">
											<button class="search-account btn btn-outline-secondary" type="button"
												id="button-addon2" onclick="searchAccount()">찾기</button>
										</div>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>

					</section>
					<!-- End section dashboard -->
				</main>
				<script>
					function searchAccount() {
						$.ajax({
						    url: "/receipt/accountList",
						    type: "GET",
						    dataType: "json",
						    success: function (data) {
						      const accountList = data; // Ajax 성공 시 데이터를 accountList에 할당합니다.
						      const searchTerm = $('.valueToAccount').val().trim();
						      // 데이터를 검색어를 기준으로 필터링합니다.
						      const filteredAccounts = accountList.filter((account) => {
						        return (
						          account.accountName.includes(searchTerm) || account.accountNo.includes(searchTerm)
						        );
						      });
						      // 검색 결과를 표시합니다.
						      const accountListModal = $('#accountListModal');
						      accountListModal.empty();

						      if (filteredAccounts.length === 0) {
						        // 일치하는 결과가 없는 경우
						        accountListModal.append('<tr><td colspan="2">일치하는 계정과목이 없습니다.</td></tr>');
						      } else {
						        // 일치하는 결과가 있는 경우
						        filteredAccounts.forEach(account => {
						          const row = $('<tr>');
						          row.append('<td>' + account.accountNo + '</td><td>' + account.accountName + '</td>');
						          accountListModal.append(row);
						        });
						        $('#accountListModal tr').dblclick(function () {
				                    let selectedAccountNo = $(this).find('td:first-child').text();
				                    let selectedAccountName = $(this).find('td:nth-child(2)').text();
				                    // 이제 선택한 값에 대해 원하는 처리를 하면 됩니다.
				                    // 예: 선택한 값을 특정 input 요소에 넣기
				                    $('#someInput').val(selectedAccountNo);
				                    $('#someOtherInput').val(selectedAccountName);

				                    // 모달 창 닫기
				                    $("#accountCode").modal("hide");
				                });
						      }
						    },
						    error: function (xhr, status, error) {
						      // 에러 처리
						      console.log("Error:", error);
						    },
						  });
					}
					function openAccountCodeModal() {
						// Use Ajax to fetch accountList
						$.ajax({
							url: "/receipt/accountList",
							type: "GET",
							dataType: "json",
							success: function (data) {
								// Update the content of the modal with the fetched data
								$("#accountListModal").empty();
								let accountList = data;
								let tableBody = $("#accountListModal");
								$.each(data, function (index, item) {
									let accountno = item.accountNo;
									const temp = document.createElement('tr');
									temp.innerHTML = "<td>" + item.accountNo + "</td><td>"
										+ item.accountName + "</td>";
									$('#accountListModal').append(temp);
								});
								$("#accountCode").modal("show");
								// Show the modal
								 $('#accountListModal tr').dblclick(function () {
					                    let selectedAccountNo = $(this).find('td:first-child').text();
					                    let selectedAccountName = $(this).find('td:nth-child(2)').text();
					                    // 이제 선택한 값에 대해 원하는 처리를 하면 됩니다.
					                    // 예: 선택한 값을 특정 input 요소에 넣기
					                    $('#someInput').val(selectedAccountNo);
					                    $('#someOtherInput').val(selectedAccountName);
										
					                    // 모달 창 닫기
					                    $("#accountCode").modal("hide");
					                });
								
							},
							error: function (xhr, status, error) {
								console.log(error);
							}
						});
					}

				</script>
				<!-- End #main -->
				<%@include file="../common/footer.jsp" %>
			</body>

			</html>