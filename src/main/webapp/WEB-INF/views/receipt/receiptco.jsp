<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../common/coheader.jsp" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta content="width=device-width, initial-scale=1.0" name="viewport">

				<title>ReceiptCO</title>
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
						width: 50%;
						box-sizing: border-box;
						height: auto;
						overflow: auto;
					}

					#main {
						margin-left: 0px !important;
					}

					#footer {
						margin-left: 0 !important;
					}

					.right {
						padding-left: 15px;
						float: right;
						box-sizing: border-box;
						flex-wrap: wrap;
						height: 900px;
						overflow: auto;
						width: 50%;
					}

					.bottom {
						clear: both;
						width: 100%;
						box-sizing: border-box;
						width: 100%;
					}

					.custom-image {
						width: 95%;
						height: auto;
						/* 높이를 자동으로 조절 */
					}

					.modal-footer .form-control {
						display: inline-block;
						width: 80%;
						vertical-align: middle;
						margin-right: 5px;
					}

					.selected {
						- -bs-table-bg: #f0f0f0;
					}
				</style>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			</head>

			<body>
				<main id="main" class="main">
					<div class="pagetitle">
						<h1>증빙전표업로드</h1>
					</div>
					<!-- End Page Title -->
					<br>
					<section class="section dashboard">
						<div class="card">
							<div class=card-body>
								<div class="left" id="uploadedImageDiv">
									<!--Start div left  -->
									<img src="/resources/upload/apple-touch-icon.png" alt="receipt"
										class="img-fluid custom-image" id="uploadedImage">
								</div>
								<!-- End div left -->
								<div class="right">
									<!-- Start div right -->
									<div class="mb-3 card">
										<div class="uploadDiv tab-content pt-2" id="borderedTabContent">
											<input class="form-control" type="file" name="uploadFile" 	id="formFileMultiple" multiple>
										</div>
										<button class="btn btn-secondary" id="uploadBtn" name='uploadFile'>업로드</button>
									</div>
									<!-- End div right -->
								</div>
							</div>
						</div>
						<!-- Button trigger modal -->
					</section>
					<!-- End section dashboard -->
				</main>
				<script>
				$(document).ready(function (e) {
					
					let regex = new RegExp("^(?!.*\.(jpg|png|pdf)$).*$");
					function checkExtension(fileName){
						if(regex.test(fileName)){
							alert("해당 종류의 파일은 업로드할 수 없습니다.");
							return false;
						}
						return true;
					}
					
					$('#uploadBtn').on('click', function () {
						let formData = new FormData();
						let inputFile = $("input[name='uploadFile']");
						let files = inputFile[0].files;
						console.log(files);

						for (let i = 0; i < files.length; i++) {
							if(!checkExtension(files[i].name, files[i].size)){
								return false;
							}
							formData.append("uploadFile", files[i]);
						}
						console.log(formData);
						$.ajax({
							url: '/receipt/uploadReceipt',
							processData: false,
							contentType: false,
							data: formData,
							dataType:'json',
							type: 'post',
							success: function (result) {
								const uploadImg = result;
								const ImgPath ="../resources/upload/"+uploadImg;
								alert("uploaded!!");
								$("#uploadedImage").attr("src", ImgPath);
							},
							error: function (xhr, status, error) {
								// 에러 처리
								console.log("Error:", error);
							}
						});
					});
				});
				</script>
				<!-- End #main -->
				<%@include file="../common/footer.jsp" %>
			</body>

			</html>