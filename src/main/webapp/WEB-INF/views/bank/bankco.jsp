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
  .pagetitle{
  	margin-top: 8px;
  }
  #footer{
  	margin-left: 0 !important;
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
  
  .banktable td:nth-child(3),
  .banktable td:nth-child(4),
  .banktable td:nth-child(5) {
    text-align: right;
  }
  .banktable th:first-child,
  .banktable td:first-child{
    width: 100px;
  }
  .banktable th:last-child,
  .banktable td:last-child {
    width: 45px; 
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
    overflow: auto;
  }

  .right {
    float: right;
    width: 49%; 
    box-sizing: border-box;
	flex-wrap: wrap;
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

.modal-backdrop {
  /* display: block; 검은색레이어*/
  display: none;
}
</style>
<script type="text/javascript">
	$(function(){
		
		// 모달출력: 나중엔 동적 생성시 생기는 버튼이므로 변경
		$(".memolink").on("click", function(){
			$("#memoinsert").modal('show');
		});
		
	});
</script>
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
			<div class="listcondition">
                 <div class="line">
		            <label for="inputDate" class="col-form-label labeltitle">일자</label>
		         	<div class="line">
		            	<input type="date" id="startdate" class="form-control">~&nbsp;<input type="date" id="enddate" class="form-control">
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
                 		<button type="button" class="btn btn-secondary">조회</button>
                 	</div>
                 </div>

               	<div class="left">
               		<!-- 통장내역 -->
	              <ul class="nav nav-tabs" id="myTab" role="tablist">
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link active" id="allbanklist-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link" id="nonbanklist-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">전표미연결</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link" id="connbanklist-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">전표연결</button>
	                </li>
	              </ul>
	              <div class="tab-content pt-2" id="myTabContent">
	                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="allbanklist-tab">
	                	<!-- 전체 -->
	                	 <div class="banklogo">
						 	<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">
						 	<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        신한은행
	                      </button>
	                      <ul class="dropdown-menu">
	                        <li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>
	                      </ul>
						 </div>
		                <table id="allbanktable" class="banktable table table-hover table-bordered">
			                <thead>
			                  <tr>
			                    <th scope="col" class="tabletop">날짜</th>
			                    <th scope="col" class="tabletop">적요</th>
			                    <th scope="col" class="tabletop">입금액</th>
			                    <th scope="col" class="tabletop">출금액</th>
			                    <th scope="col" class="tabletop">잔액</th>
			                    <th scope="col" class="tabletop">메모</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <tr>
			                    <td>04-01</td>
			                    <td>(주)회사</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                    <td>04-02</td>
			                    <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                    <td>04-03</td>
			                     <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                  	<td class="total"><strong>합계</strong></td>
			                  	<td class="total"></td>
			                  	<td class="total">67,515,870</td>
			                  	<td class="total">82,015,850</td>
			                  	<td class="total">0</td>
			                  	<td class="total"></td>
			                  </tr>
			                </tbody>
		              </table>         	
	                </div><!-- End 전체 탭 -->
	                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="nonbanklist-tab">
						<!-- 미연결 -->
						 <div class="banklogo">
						 	<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">
						 	<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        신한은행
	                      </button>
	                      <ul class="dropdown-menu">
	                        <li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>
	                      </ul>
						 </div>
		                <table id="nonbanktable" class="banktable table table-hover table-bordered">
			                <thead>
			                  <tr>
			                    <th scope="col" class="tabletop">날짜</th>
			                    <th scope="col" class="tabletop">적요</th>
			                    <th scope="col" class="tabletop">입금액</th>
			                    <th scope="col" class="tabletop">출금액</th>
			                    <th scope="col" class="tabletop">잔액</th>
			                    <th scope="col" class="tabletop">메모</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <tr>
			                    <td>04-01</td>
			                    <td>(주)회사</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                    <td>04-02</td>
			                    <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                    <td>04-03</td>
			                     <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                  	<td class="total"><strong>합계</strong></td>
			                  	<td class="total"></td>
			                  	<td class="total">67,515,870</td>
			                  	<td class="total">82,015,850</td>
			                  	<td class="total">0</td>
			                  	<td class="total"></td>
			                  </tr>
			                </tbody>
		              </table> 
	                </div><!-- End 미연결 -->
	                
	                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="connbanklist-tab">
						<!-- 연결 -->
						 <div class="banklogo">
						 	<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">
						 	<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        신한은행
	                      </button>
	                      <ul class="dropdown-menu">
	                        <li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>
	                        <li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>
	                      </ul>
						 </div>
		                <table id="connbanktable" class="banktable table table-hover table-bordered">
			                <thead>
			                  <tr>
			                    <th scope="col" class="tabletop">날짜</th>
			                    <th scope="col" class="tabletop">적요</th>
			                    <th scope="col" class="tabletop">입금액</th>
			                    <th scope="col" class="tabletop">출금액</th>
			                    <th scope="col" class="tabletop">잔액</th>
			                    <th scope="col" class="tabletop">메모</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <tr>
			                    <td>04-01</td>
			                    <td>(주)회사</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td>14,5000,000</td>
			                    <td>
			                    	<a href=# class="memolink"><i class="ri-article-fill"></i></a>
			                    </td>
			                  </tr>
			                  <tr>
			                    <td>04-02</td>
			                    <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td><a href=# class="memolink"><i class="ri-article-fill"></i></a></td>
			                  </tr>
			                  <tr>
			                    <td>04-03</td>
			                     <td>(주)회사</td>
			                    <td>14,5000,000</td>
			                    <td></td>
			                    <td>14,5000,000</td>
			                    <td>
			                    	<a href=# class="memolink"><i class="ri-article-fill"></i></a>
			                     </td>
			                  </tr>
			                  <tr>
			                  	<td class="total"><strong>합계</strong></td>
			                  	<td class="total"></td>
			                  	<td class="total">67,515,870</td>
			                  	<td class="total">82,015,850</td>
			                  	<td class="total">0</td>
			                  	<td class="total"></td>
			                  </tr>
			                </tbody>
		              </table>
	                </div><!-- End 연결 탭 -->
               	</div>
              </div><!-- End div left -->
              
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
                    <th scope="col" class="tabletop">거래처명</th>
                    <th scope="col" class="tabletop">전표적요</th>
                    <th scope="col" class="tabletop">상대계정</th>
                    <th scope="col" class="tabletop">상태</th>
                    <th scope="col" class="tabletop">예상잔액</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>**구리</td>
                    <td></td>
                    <td>(판)복리후생비</td>
                    <td>전표확정</td>
                    <td>35,500,000</td>
                  </tr>
                  <tr>
                    <td>**스토리</td>
                    <td></td>
                    <td>받을어음</td>
                    <td>전표확정</td>
                    <td>57,500,000</td>
                  </tr>
                  <tr>
                    <td>**스토리</td>
                    <td></td>
                    <td>(판)복리후생비</td>
                    <td>확정가능</td>
                    <td>35,500,000</td>
                  </tr>
                  <tr>
                    <td>**구리</td>
                    <td></td>
                    <td>외상매출금</td>
                    <td>삭제전표</td>
                    <td>35,500,000</td>
                  </tr>
     			  <tr>
                  	<td class="total"><strong>합계</strong></td>
                  	<td class="total" colspan="4">잔액: 35,500,000 (차액: 35,500,000)</td>
		          </tr>
                </tbody>
             </table>
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
                    	<form action="">
                    		<input type="text" class="modaltext" value=""/>
                    		<button type="submit" class="btn btn-light">확인</button>
                    	</form>
                    </div><!-- end modal-body -->
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
