<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- Favicons -->
<link href="../resources/assets/img/favicon.png" rel="icon">
<link href="../resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../resources/assets/css/style.css" rel="stylesheet">
<title>회원가입</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Favicons -->
<style type="text/css">
.pagewidth {
	width: 60%
}

#main {
	margin-left: 0px !important;
}

#footer {
	margin-left: 0 !important;
}
</style>
</head>

<body>
	<main>
		<div class="container">

			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div
							class="pagewidth col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<a href="../main/mainTA"
									class="logo d-flex align-items-center w-auto"> <img
									src="assets/img/logo.png" alt=""> <span
									class="d-none d-lg-block">BlurTax.edge</span>
								</a>
							</div>
							<!-- End Logo -->

							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
										<p class="text-center small">회원 정보를 입력해주세요</p>
									</div>
									<div class="col-12">
										<label for="yourName" class="form-label">이름</label> <input
											type="text" name="name" class="form-control" id="name"
											required>
										<div class="invalid-feedback">이름을 입력하세요!</div>
									</div>
									<div class="col-12">
										<label for="yourName" class="form-label">아이디</label> <input
											type="text" name="ID" class="form-control" id="userid"
											required>
										<div class="invalid-feedback">아이디를 입력하세요!</div>
									</div>
									<div class="col-12">
										<label for="emailID" class="form-label">이메일</label>
										<div class="input-group has-validation">
											<input type="text" name="emailId"
												class="emailId form-control" id="username" required>
											<span class="dash input-group-text" id="domain">@</span> <select
												class="mailType form-select" aria-label="Default select"
												required>
												<option selected disabled value="">이메일을 선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="other">다른 메일 입력</option>
											</select> <input type="text" name="email"
												class="emailAdress form-control" disabled required>
											<button type="button"
												class="authentication btn btn-outline-primary">이메일
												인증</button>
											<div class="invalid-feedback">이메일을 선택하세요!</div>
										</div>
									</div>

									<div class="col-12">
										<label for="yourPassword" class="form-label">비밀번호</label> <input
											type="password" name="password" class="password form-control"
											id="yourPassword" required />
										<div class="invalid-feedback">비밀번호를 입력하세요!</div>
									</div>
									<div class="col-12"position-relative">
										<label for="yourPassword" class="form-label">비밀번호 확인</label> <input
											type="password" name="passwordCheck"
											class="passwordcheck form-control" id="passwordCheck"
											disabled />
										<div class="pwckvalid valid-feedback">비밀번호가 일치합니다!</div>
										<div class="pwckInvalid invalid-feedback">비밀번호가 일치하지
											않습니다!</div>
									</div>
									<div class="col-12">
										<label for="SSN" class="form-label">주민등록번호</label>
										<div class="input-group has-validation">
											<input type="text" name="SSN-first" class="form-control"
												id="SSN-first" required /> <span class="input-group-text"
												id="domain">-</span> <input type="text" name="SSN-last"
												class="form-control" id="SSN-last" required />
										</div>
										<div class="invalid-feedback">주민번호를 입력하세요!</div>
									</div>

									<div class="col-12">
										<div class="form-check">
											<input class="form-check-input" name="terms" type="checkbox"
												value="" id="acceptTerms" required> <label
												class="form-check-label" for="acceptTerms">정보 제공에
												동의합니다</label>
											<div class="invalid-feedback">정보 제공에 동의하세요!</div>
										</div>
									</div>
									<div class="col-12">
										<button id="submitBtn" class="btn btn-primary w-100">회원가입</button>
									</div>
									<div class="col-12">
										<p class="small mb-0">
											이미 아이디가 있으십니까? <a href="../main/talogin">Log in</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<!-- End #main -->
	<script>
		let mailAdress;
		let ssn;

		$('.mailType').on('change', function() {
			let selectedOption = $(this).val();
			let emailInput = $('.emailAdress');
			// 이메일을 선택한 경우
			if (selectedOption != 'other') {
				emailInput.prop('disabled', true); // input 요소 비활성화
				emailInput.val(''); // input 요소 초기화
			} else {
				emailInput.prop('disabled', false); // input 요소 비활성화
				emailInput.val(''); // input 요소 초기화
			}
		});
		$('.authentication').on("click", function() {
			const btn = $(this);
			const row = btn.parent();
			const emailID = row.find('.emailId').val();
			const mailType = row.find('.mailType').val();
			const otherMail = row.find('.emailAdress').val();
			if (mailType == "other") {
				if (otherMail != "") {
					mailAdress = emailID + "@" + otherMail;
				} else {
					alert('메일을 입력하세요');
				}
			} else if (mailType != "other") {
				mailAdress = emailID + "@" + mailType;
			}
			console.log(mailAdress);
		})
		$('.password').on("blur", function name() {
			let pwck = $('.passwordcheck');
			pwck.val('');
			$('.pwckvalid').hide();
			$('.pwckInvalid').hide();
			let pw = $(this).val();
			if (pw == "") {
				pwck.prop('disabled', true);
			} else {
				pwck.prop('disabled', false);
			}
		})
		$('.passwordcheck').on("blur", function name() {
			let pw = $('.password').val();
			let pwck = $(this).val();

			console.log(pwck);
			if (pw != pwck) {
				$('.pwckInvalid').show();
				$('.pwckvalid').hide();
			} else {
				$('.pwckvalid').show();
				$('.pwckInvalid').hide();
			}
		})
		$('#submitBtn').on("click", function() {
			console.log("submit");
			let membername = $('#name').val();
			let memberid = $('#userid').val();
			let password = $('#passwordCheck').val();
			let ssn = $('#SSN-first').val() + "-" + $('#SSN-last').val();

			console.log(membername);
			console.log(memberid);
			console.log(password);
			console.log(ssn);
			$.ajax({
				url : "/register/registMember",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify({
					'membername' : membername,
					'memberid' : memberid,
					'password' : password,
					'ssn' : ssn
				}),
				dataType : 'json'
			});
			alert("registered!!!");
			$(location).attr('href','/main/cologin');
		});
	</script>
</body>
<%@include file="../common/footer.jsp"%>

</html>