<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/coheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>bankco</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
  #main{
  	margin-left: 0px !important;
  }
  #footer{
  	margin-left: 0 !important;
  }
  .pagetitle{
  	margin-top: 8px;
  }
  .intable{
  	width: 100%;
  	border: 0;
  }
  .intable:focus{
  	outline: none;
  }
  .allbtn{
  	margin-top: 10px;
    margin-left: 5px;
    width: 250px;
  }
  .allbtn:hover{
  	background-color: #4169E1;
  }
  .nav-item-divider {
    border-top: 1px solid #ccc;
  }
  .search-biz input{
  	width: 250px;
  }
  .biztype{
    color: #4169E1;
  	background-color: #F0F8FF;
  }
  
 table {
    width: 100%; /* 테이블 전체 넓이를 100%로 설정 */
    table-layout: fixed; /* 테이블 열 너비를 고정으로 설정*/
  }
  th,
  td {
    text-align: center; /* 글자를 가운데로 정렬 */
    vertical-align: middle; /* 세로 중앙 정렬 */
  }
  .banktable th:first-child,
  .banktable td:first-child{
    width: 80px; /* 첫 번째 열 넓이 */
  }
  .banksliptable th:first-child,
  .banksliptable td:first-child{
    width: 150px; /* 첫 번째 열 넓이 */
  }
  .banktable th:nth-child(2),
  .banktable td:nth-child(2) {
    width: 150px; /* 두 번째 열 넓이 */
  }

  .banktable td:nth-child(6),
  .banktable td:nth-child(4),
  .banktable td:nth-child(5) {
    text-align: right;
  }
  .banktable th:last-child,
  .banktable td:last-child {
    width: 45px; 
  }
  
  .detailsliptable th:first-child,
  .detailsliptable td:first-child{
    width: 130px;
  }
  .detailsliptable th:nth-child(2),
  .detailsliptable td:nth-child(2){
    width: 230px;
  }
  .detailsliptable td:nth-child(4),
  .detailsliptable td:nth-child(5){
    text-align: right;
    width: 230px;
  }
  .detailsliptable td:last-child{
    text-align: left;
  }

  .tabletop{
  	background-color: #F5F5F5 !important;
  }
  .total{
  	background-color: #f6f9ff !important;
  }

  
   /* div 위치설정 */
  .listcondition {
    display: flex;
    align-items: center; 
    gap: 10px; 
    position: relative;
    margin-bottom: 15px;
	border: 1px solid #ccc;
    padding: 13px;
  }

  .line {
    display: flex; 
    align-items: center; 
  }

  .line > * {
    margin-right: 10px; /* 각 요소 사이의 간격을 조절 */
  }
  
  .listconditionbtn{
  	position: absolute;
    right: 10px;
  }
  
   .tab-pane {
    display: flex;
    flex-direction: column;
  }

   .left {
    float: left;
    width: 49%; 
    box-sizing: border-box;
    height: 600px;
    overflow: auto;
    margin-bottom: 20px;
  }

  
  .right{
  	float: right;
    width: 49%; 
    box-sizing: border-box;
	flex-wrap: wrap;
	height: 600px;
    overflow: auto;
    margin-bottom: 20px;
  }

  .totallist{
  	display: flex;
  }
  
  .totalname{
  	margin-right: 150px;
  }
  
  .totalsum{
  	margin-right: 50px;
  }
  
  .diffsum{
  	color: red;
  }
  
  .totalname{
  	font-weight: bold;
  }

	.button-container {
	  display: flex;
	  flex-grow: 1;
	  margin-bottom: 8px;
	}
	
	.button-container button{
	  flex: 1;
	  margin: 0 5px;
	  height: 35px;
	  text-align: center;
	}
	
	.lightbtns{
		 display: flex;
		  flex-grow: 1;
		  height: 50px;
		  justify-content: flex-end;
	}
	.lightbtns button{
		  margin: 0 5px;
		  margin-bottom: 5px;
	}

  .bottom {
    clear: both;
    width: 100%;
    box-sizing: border-box;
  }
  
  .banklogo{
  	margin-left: 3px;
  }
  .btn-light {
  color: #435971;
  background-color: #fcfdfd;
  border-color: #DCDCDC;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(252, 253, 253, 0.4);
  height: 35px;
  text-align: center;
}
.btn-light:hover {
  color: #435971;
  background-color: #fcfdfd;
  border-color: #DCDCDC;
}

.howmany{
	font-wieght: bold;
	margin-left: 10px;
	display: inline;
}
.button-text {
    display: inline;
}
.right .nav {
    display: flex;
    flex-wrap: nowrap;
}

.right .nav-item {
    flex: 1;
}
#pills-all-tab {
  color: #8592a3;
  border: 1px solid;
  background: transparent;
}
#pills-all-tab:hover {
  color: black;
  background-color: #F5F5F5;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
}
#pills-all-tab.active {
  color: black;
  background-color: #F5F5F5;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
}

#pills-can-tab {
  border: 1px solid;
  color: #198754;
  border-color: #198754;
  background: transparent;
}
#pills-can-tab:hover {
  color: #198754;
  background-color: #F0FFF0;
  border-color: #198754;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(113, 221, 55, 0.4);
}
#pills-can-tab.active {
  color: #198754;
  background-color: #F0FFF0;
  border-color: #198754;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(113, 221, 55, 0.4);
}

.btn-outline-info {
  color: #03c3ec;
  border-color: #03c3ec;
  background: transparent;
}
.btn-outline-info:hover {
  color: #fff;
  background-color: #03b0d4;
  border-color: #03b0d4;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(3, 195, 236, 0.4);
}
#pills-certain-tab{
    border: 1px solid;
    color: #4169E1;
    border-color: #4169E1;
    background: transparent;
}
#pills-certain-tab:hover{
  color: white;
  background-color: #4169E1;
  border-color: #4169E1;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
}
#pills-certain-tab.active{
  color: white;
  background-color: #4169E1;
  border-color: #4169E1;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
}
#pills-except-tab {
  border: 1px solid;
  color: #ffab00;
  border-color: #e69a00;
  background: transparent;
}
#pills-except-tab:hover {
  color: black;
  background-color: #FFE4B5;
  border-color: #e69a00;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(255, 171, 0, 0.4);
}
#pills-except-tab.active {
  color: black;
  background-color: #FFE4B5;
  border-color: #e69a00;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(255, 171, 0, 0.4);
}
.btn-outline-danger {
  color: #ff3e1d;
  border-color: #ff3e1d;
  background: transparent;
}
.btn-outline-danger:hover {
  color: #fff;
  background-color: white;
  border-color: #e6381a;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(255, 62, 29, 0.4);
}

#pills-remove-tab {
  border: 1px solid;
  color: #233446;
  background-color: white;
  border-color: #202f3f;
}
#pills-remove-tab:hover {
  color: white;
  background-color: #696969;
  border-color: #202f3f;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(35, 52, 70, 0.4);
/*   transform: translateY(-1px); */
}
#pills-remove-tab.active{
  color: white;
  background-color: 	#696969;
  border-color: #202f3f;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(35, 52, 70, 0.4);
}

.btn-outline-gray {
  color: rgba(67, 89, 113, 0.1);
  border-color: rgba(67, 89, 113, 0.1);
  background: transparent;
}
.btn-outline-gray:hover {
  color: #fff;
  background-color: rgba(22, 29, 36, 0.19);
  border-color: rgba(22, 29, 36, 0.19);
  box-shadow: 0 0.125rem 0.25rem 0 rgba(67, 89, 113, 0.4);
}
.labeltitle{
	font-weight: bold;
}
.labeltitle2{
	font-weight: bold;
	margin-right: 10px;
	margin-left: 30px;
}
.tabletitle{
	font-weight: bold;
	margin-bottom: 10px;
}
.modaltable{
	background-color: #f6f9ff;
	margin-bottom: 10px;
	padding: 30px;
}
.modaltable table input{
	background-color: #f6f9ff;
}
.modaltable td:first-child,
.modaltable td:nth-child(3),
.modaltable td:nth-child(5){
	width: 60px;
	font-weight: bold;
	text-align: left;
}
input.modaltext {
	width: 363px;
}
.cantwrite{
	background-color: #F5F5F5 !important;
}

</style>
<script src="../resources/assets/js/bankco.js"></script>
</head>

<body>
<main id="main" class="main">
    <div class="pagetitle">
      <h1>통장정리</h1>
    </div><!-- End Page Title --><br>
    <section class="section dashboard">
     <div class="card">
            <div class="card-body">	
             <br>
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">통장내역</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">통장비교</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabContent">
              	<!-- 탭1 -->
                <div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">
                 	
                 	<!-- 검색조건 form -->
                 	<form action="/bank/getHistoryAndSlip" method="post">
	                 	<div class="listcondition">
	                 		<div class="line">
			                  <label for="inputDate" class="col-form-label labeltitle">일자</label>
			                  <div class="line">
			                    <input type="date" id="startdate" name="startdate" class="form-control">
			                    ~&nbsp;<input type="date" id="enddate" name="enddate" class="form-control">
			                  </div>
			                </div>
	                 		<div class="line">
	                 			<label class="labeltitle">은행&nbsp;&nbsp;</label>
								<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					              전체거래처
					            </button>
			                      <ul class="dropdown-menu">
			                        <li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>
			                        <li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>
			                        <li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>
			                        <li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>
			                        <li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>
			                      </ul>
	                 		</div>
	                 		<div class="line">
		                 		<label class="labeltitle">조회내용&nbsp;&nbsp;</label>
			                     <div class="line">
				                    <div class="form-check">
				                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
				                      <label class="form-check-label" for="gridRadios1">
				                        전체
				                      </label>
				                    </div>
				                    <div class="form-check">
				                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
				                      <label class="form-check-label" for="gridRadios2">
				                        입금
				                      </label>
				                    </div>
				                    <div class="form-check">
				                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option">
				                      <label class="form-check-label" for="gridRadios3">
				                        출금
				                      </label>
				                    </div>
		                  		 </div>
	                 		</div>
	                 		<div class="listconditionbtn">
	                 			<button type="button" id="searchHistorySlip" class="btn btn-secondary">조회</button>
	                 		</div>
	                 	</div>
	                 	<input type="hidden" name="bizno" id="bizno" value="10001">
	                 	<input type="hidden" name="bankname" id="bankname" value="신한은행">
	                 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                 	</form>

			  <!-- 동적 생성 부분 -->
              <div class="left" id="left">
              </div><!-- End div left -->
              
              <div class="right" id="right">
              </div><!-- end right -->

              <!-- 메모 아이콘 클릭 시 등장하는 모달 -->
              <div class="modal fade" id="memoinsert" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title"><strong>메모입력</strong></h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                   		<input type="hidden" id="biznoInMemoModal">
                   		<input type="hidden" id="amountInMemoModal">
                   		<input type="text" class="modaltext" id="insertedMemo" value=""/>
                   		<button type="button" id="saveMemoBtn" class="btn btn-light">저장</button>
                    	</div><!-- end modal-body -->
                  	</div>
                	</div>
              	</div><!-- End Vertically centered Modal-->

            	</div>
           </div>
       </div><!-- end card body -->
     </div><!-- end card -->
    
    </section><!-- End section dashboard -->

  </main><!-- End #main -->
<%@include file="../common/footer.jsp"%>
</body>
</html>
