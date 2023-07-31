<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
\<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/taheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>bankta</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
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
  .banktable td:first-child,
  .banksliptable th:first-child,
  .banksliptable td:first-child{
    width: 35px; /* 첫 번째 열 넓이 */
  }
  .banktable th:nth-child(2),
  .banktable td:nth-child(2) {
    width: 80px; /* 두 번째 열 넓이 */
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
    height: 400px;
    overflow: auto;
  }

  .right {
    float: right;
    width: 49%; 
    box-sizing: border-box;
	flex-wrap: wrap;
	height: 400px;
    overflow: auto;
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
.btn-outline-secondary {
  color: #8592a3;
  border-color: #8592a3;
  background: transparent;
}
.btn-outline-secondary:hover {
  color: #8592a3;
  background-color: white;
  border-color: #788393;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(133, 146, 163, 0.4);
}

.btn-outline-success {
  color: #198754;
  border-color: #198754;
  background: transparent;
}
.btn-outline-success:hover {
  color: #198754;
  background-color: white;
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
.btn-outline-confirm{
    color: #4169E1;
    border-color: #4169E1;
    background: transparent;
}
.btn-outline-confirm:hover{
  color: #4169E1;
  background-color: white;
  border-color: #4169E1;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
}
.btn-outline-warning {
  color: #ffab00;
  border-color: #ffab00;
  background: transparent;
}
.btn-outline-warning:hover {
  color: #ffab00;
  background-color: white;
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

.btn-outline-dark {
  color: #233446;
  border-color: #233446;
  background: transparent;
}
.btn-outline-dark:hover {
  color: #233446;
  background-color: white;
  border-color: #202f3f;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(35, 52, 70, 0.4);
/*   transform: translateY(-1px); */
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
	width: 50px;
	font-weight: bold;
	text-align: left;
}
input.modaltext {
	width: 363px;
}
</style>
<script src="../resources/assets/js/bank.js"></script>
<script type="text/javascript">
	$(function(){
		// 툴팁설정
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		
		// 모달출력: 나중엔 동적 생성시 생기는 버튼이므로 변경
		$("#memoplzbtn").on("click", function(){
			$("#memoplzmodal").modal('show');
		});
		
	});
</script>
</head>

<body>
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
      	<div class="search-bar bizsearch">
	      <form class="search-form d-flex align-items-center search-biz" method="POST" action="#">
	        <input type="text" name="query" placeholder="수임기업명을 검색하세요" title="Enter search keyword">
	        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
	      </form>
	    </div><!-- End Search Bar -->

    	<nav class="header-nav ms-auto">
        	<ul class="d-flex align-items-center">
		        <li class="nav-item d-block d-lg-none">
		          <a class="nav-link nav-icon search-bar-toggle " href="#">
		            <i class="bi bi-search"></i>
		          </a>
		        </li><!-- End Search Icon-->
		     </ul>
		 </nav>
      <button type="button" class="btn btn-outline-primary allbtn">
      	<i class="ri-building-line"></i> 전체수임기업</button>
      <br><br>
      <li class="nav-item-divider"></li> <!-- 회색 선 추가 -->
      <br>
      <li class="nav-item">
      	<!-- 수임사 리스트 -->
       	<div class="list-group">
               <a href="#" class="list-group-item list-group-item-action">
                 <div class="d-flex w-100 justify-content-between">
                   <h5 class="mb-1">엣지상사</h5><i class="bi bi-bell"></i>
                 </div>
                 <span class="badge biztype">제조</span>
                 <small class="text-muted">222-3333-5555</small>
               </a>
               <a href="#" class="list-group-item list-group-item-action">
                 <div class="d-flex w-100 justify-content-between">
                   <h5 class="mb-1">더존</h5><i class="bi bi-bell"></i>
                 </div>
                 <span class="badge biztype">IT</span>
                 <small class="text-muted">222-3333-5555</small>
               </a>
               <a href="#" class="list-group-item list-group-item-action">
                 <div class="d-flex w-100 justify-content-between">
                   <h5 class="mb-1">대한건설</h5><i class="bi bi-bell"></i>
                 </div>
                 <span class="badge biztype">건설</span>
                 <small class="text-muted">222-3333-5555</small>
               </a>
        </div><!-- End List group Advanced Content -->
      </li>
	</ul>

  </aside><!-- End Sidebar-->
  
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
	                 			<button type="submit" id="searchHistorySlip" class="btn btn-secondary">조회</button>
	                 		</div>
	                 	</div>
	                 	<input type="hidden" name="bizno" value="10001">
	                 	<input type="hidden" name="bankname" value="신한은행">
	                 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                 	</form>
                 
                 <!-- 동적 생성부분 -->
                 <div class="searhstart">
                 </div>
                
                <div class="right">
                	<!-- 전표내역 -->
					 <div class="button-container">
 					    <button type="button" class="btn btn-outline-secondary">전체   12</button>
					    <button type="button" class="btn btn-outline-success">가능   4</button>
					    <button type="button" class="btn btn-outline-confirm">확정   3</button>
					    <button type="button" class="btn btn-outline-warning">제외   1</button>
					    <button type="button" class="btn btn-outline-dark">삭제   2</button>
					  </div>
	                <table id="" class="banksliptable table table-hover table-bordered">
		                <thead>
		                  <tr>
		                  	<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>
		                    <th scope="col" class="tabletop">거래처명</th>
		                    <th scope="col" class="tabletop">전표적요</th>
		                    <th scope="col" class="tabletop">상대계정</th>
		                    <th scope="col" class="tabletop">상태</th>
		                    <th scope="col" class="tabletop">예상잔액</th>
		                  </tr>
		                </thead>
		                <tbody>
		                  <tr>
		                  	<td><input class="form-check-input" type="checkbox"></td>
		                    <td>**구리</td>
		                    <td></td>
		                    <td>(판)복리후생비</td>
		                    <td>전표확정</td>
		                    <td>35,500,000</td>
		                  </tr>
		                  <tr>
		                  	<td><input class="form-check-input" type="checkbox"></td>
		                    <td>**스토리</td>
		                    <td></td>
		                    <td>받을어음</td>
		                    <td>전표확정</td>
		                    <td>57,500,000</td>
		                  </tr>
		                  <tr>
		                  	<td><input class="form-check-input" type="checkbox"></td>
		                    <td>**스토리</td>
		                    <td></td>
		                    <td>(판)복리후생비</td>
		                    <td>확정가능</td>
		                    <td>35,500,000</td>
		                  </tr>
		                  <tr>
		                  	<td><input class="form-check-input" type="checkbox"></td>
		                    <td>**구리</td>
		                    <td></td>
		                    <td>외상매출금</td>
		                    <td>삭제전표</td>
		                    <td>35,500,000</td>
		                  </tr>
		     			  <tr>
		                  	<td class="total"></td>
		                  	<td class="total"><strong>합계</strong></td>
		                  	<td class="total" colspan="4">잔액: 35,500,000 (차액: 35,500,000)</td>
				          </tr>
		                </tbody>
	              </table>
	              <div class="lightbtns">
	                <button type="button" class="btn btn-light">확정</button>
	              	<button type="button" class="btn btn-light">분개내역조회</button>
	              	<button type="button" class="btn btn-light">삭제</button>
	              	<!-- 가능:확정/확정:확정취소/삭제:삭제취소 -->
	              </div>
              </div><!-- end right -->
                 	<div class="bottom">
                 		 <!-- 분개내역 -->
		                 <table id="" class="table detailsliptable table-bordered">
			                <thead>
			                  <tr>
			                    <th scope="col" class="tabletop">구분</th>
			                    <th colspan="2" scope="col" class="tabletop">계정과목</th>
			                    <th scope="col" class="tabletop">차변</th>
			                    <th scope="col" class="tabletop">대변</th>
			                    <th scope="col" class="tabletop">거래처명</th>
			                    <th scope="col" class="tabletop">적요</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <tr>
			                  	<td>
			                  		<select class="form-select" aria-label="Default select example">
				                      <option value="1">입금</option>
				                      <option value="2">출금</option>
				                      <option value="3" selected>차변</option>
				                      <option value="4">대변</option>
				                    </select>
			                  	</td>
			                    <td><input type="text" id="accountNo" name="text" class="intable" value="103"></td>
			                    <td><input type="text" name="text" class="intable" value="보통예금"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                    <td><input type="text" name="text" class="intable" value="신한은행"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                  </tr>
			                  <tr>
			                    <td>
			                    	<select class="form-select" aria-label="Default select example">
				                      <option selected>차변</option>
				                      <option value="1">입금</option>
				                      <option value="2">출금</option>
				                      <option value="3">차변</option>
				                      <option value="4" selected>대변</option>
				                    </select>
			                    </td>
			                    <td><input type="text" name="text" class="intable" value="911"></td>
			                    <td><input type="text" name="text" class="intable" value="복리후생비"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                    <td><input type="text" name="text" class="intable" value="**구리"></td>
			                    <td><input type="text" name="text" class="intable"></td>
			                  </tr>
			                </tbody>
		              </table>
		              <button type="button" class="btn btn-outline-confirm">저장</button>
		              <button type="button" class="btn btn-outline-secondary">취소</button>
		              
                 	</div>        <!-- 동적 생성 끝 -->        	
             </div><!-- End 탭1 -->    	
             <!-- 탭2 -->
             <div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
                  Nesciunt totam et. Consequuntur magnam aliquid eos nulla dolor iure eos quia. Accusantium distinctio omnis et atque fugiat. Itaque doloremque aliquid sint quasi quia distinctio similique. Voluptate nihil recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
                </div>
              </div><!-- End Bordered Tabs -->
              
              <!-- 내용확인요청 시 등장하는 모달 -->
              <div class="modal fade" id="memoplzmodal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title"><strong>내용 확인 요청</strong></h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="" method="">
	                   	<div class="modal-body">
	                   		<div class="modaltable">
	                   			<div class="tabletitle">통장내역</div>
		                   		<table>
		                      		<tr>
		                      			<td>일자</td>
		                      			<td><input type="text" name="text" class="intable" value="04-29" readonly></td>
		                      			<td>내용</td>
		                      			<td><input type="text" name="text" class="intable" value="(주)거래처" readonly></td>
		                      			<td>금액</td>
		                      			<td><input type="text" name="text" class="intable" value="14,000,000" readonly></td>
		                      		</tr>
		                      	</table>
	                   		</div>
	                      <div>
	                      	<label class="labeltitle2">문의 내용</label>
	                      	<input type="text" class="modaltext" value="거래내용 확인 부탁드립니다."/>
	                      </div>
	                    </div>
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                      <button type="submit" class="btn btn-primary">확인</button>
	                    </div>
                    </form>
                  </div>
                </div>
              </div><!-- End Vertically centered Modal-->

            </div>
       </div><!-- end card body -->
     </div><!-- end card -->
    
    </section><!-- End section dashboard -->
  </main><!-- End #main -->
<%@include file="../common/footer.jsp"%>
</body>
</html>
