
// 조회버튼 클릭시 통장내역 조회
$(function(){
	
		// 툴팁설정
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		
		// 일자, 수임사 선택 후 조회 시
		// form을 submit 할 때 Ajax 요청을 보내도록 처리
        $("#searchHistorySlip").on("click", function(event){
            let startDate = $("#startdate").val();
            let endDate = $("#enddate").val();
            let bizno = $("#bizno").val();
            let bankname = $("#bankname").val();
            
            let search = {
                startdate: startDate,
                enddate: endDate,
                bizno: bizno,
                bankname: bankname
            };
            
           historySlipRequest(search);
        });
 
		// 분개내역조회 버튼 클릭 시 조회
		$("#right").on("click", "#detailslipshow", function(){
			// bhno 가지고 bankslip 테이블에서 2행 조회
			
			// 체크된 체크박스 값을 저장할 배열
			let selectedBhnoList = [];
			
			// 각 체크박스를 순회하면서 체크된 체크박스의 bhno 값을 배열에 저장
		    $('.form-check-input:checked').each(function() {
		      let bhnoValue = $(this).closest('tr').find('[name="bhno"]').val();
		      if (bhnoValue) {
		        selectedBhnoList.push(bhnoValue);
		      }
		    });
			
		    // 배열에 저장된 체크된 체크박스의 bhno 값을 URL 파라미터로 사용하여 분개내역조회 페이지로 이동
		    if (selectedBhnoList.length > 0) {
		    	getDetailSlip(selectedBhnoList);
		    }
			
		});
	

	
});// windowload function


	 	// 일자, 수임사 선택 후 조회 시 호출하는 ajax
	 	// search: 호출하는 자바스크립트로부터 받아옴
        function historySlipRequest(search) {
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: "/bank/getHistoryAndSlip",
                data: JSON.stringify(search),
                dataType: "json",
                success: function(response) {
                    // 서버로부터 받은 데이터 처리
                    let historyList = response.historyList;
                    let slipList = response.slipList;
                    let total = response.total;
                    let all = response.all;
                    let can = response.can;
                    let confirmed = response.confirmed;
                    let except = response.except;
                    let remove = response.remove;
                    
                    createBankHistoryAllTable(historyList);
                    createBankSlipAllTable(slipList, total, all, can, confirmed, except, remove);
                    createDetailSlipTable();
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }// end historySlipRequest
        
       
        // 분개내역 조회시 호출하는 ajax 함수
        // bhnoList: 호출하는 자바스크립트로부터 받아옴
		function getDetailSlip(bhnoList) {
		  // 배열에 저장된 체크된 체크박스의 bhno 값을 URL 파라미터로 사용하여 분개내역조회 URL 생성
		  if (bhnoList.length > 0) {
		    // url 생성해서 넘겨주기
		    let queryString = bhnoList.map(bhno => 'bhno=' + bhno).join('&');
		    
		    $.ajax({
		      type: "GET",
		      contentType: "application/json;charset=UTF-8",
		      url: "/bank/detailslip?" + queryString,
		      dataType: "json",
		      success: function(response) {
		        // 성공적으로 데이터를 받아온 후 createDetailSlipTable 함수 호출
		        createDetailSlipTable(response);
		      },
		      error: function(xhr, status, error) {
		        console.error(error);
		      }
		    });//end ajax
		  }//end if
		}

	// historySlipRequest ajax가 호출하는 처리 함수
	function createBankHistoryAllTable(data){
		
		let searchstart = $('.left');

	  	searchstart.empty();
	  	
	let str = '';
	str += '<ul class="nav nav-tabs" id="myTab" role="tablist">';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link active" id="allbanklist-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="nonbanklist-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">전표미연결</button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="connbanklist-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">전표연결</button>';
	str += '</li>';
	str += '</ul>';
	str += '<div class="tab-content pt-2" id="myTabContent">';
	
	// 전체
	str += '<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="allbanklist-tab">';
	str += '<div class="banklogo">';
	str += '<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">';
	str += '<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">';
	str += '신한은행';
	str += '</button>';
	str += '<ul class="dropdown-menu">';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>';
	str += '</ul>';
	str += '</div>';
	str += '<table id="allbanktable" class="banktable table table-hover table-bordered">';
	str += '<thead>';
	str += '<tr>';
	str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	str += '<th scope="col" class="tabletop">날짜</th>';
	str += '<th scope="col" class="tabletop">적요</th>';
	str += '<th scope="col" class="tabletop">입금액</th>';
	str += '<th scope="col" class="tabletop">출금액</th>';
	str += '<th scope="col" class="tabletop">잔액</th>';
	str += '<th scope="col" class="tabletop">메모</th>';
	str += '</tr>';
	str += '</thead>';
	str += '<tbody>';
	
	if(data && data.length >0){
		for (let i = 0; i < data.length; i++) {
      	str +='<tr>';
 	  	str +='<td><input class="form-check-input" type="checkbox"></td>';
 	  	str +='<td>';
 	  	str += formatDate(data[i].bhdate);
 	  	str +='</td>';
 	  	str +='<td>';
 	  	str +=data[i].source;
 	  	str +='</td>';
 	  	if(data[i].sortno==1){
 	  		// 입금
 	  		str +='<td>';
	 	  	str +=formatNumberWithCommas(data[i].amount);
	 	  	str +='</td>';
	 	  	str +='<td></td>';
 	  	}else{
 	  		// 출금
 	  		str +='<td></td>';
 	  		str +='<td>';
	 	  	str +=formatNumberWithCommas(data[i].amount);
	 	  	str +='</td>';
 	  	}
 	  	str +='<td>';
 	  	str +=formatNumberWithCommas(data[i].sum);
 	  	str +='</td>';
	  	if(data[i].memo==null){
	  		 str +='<td><i class="ri-article-fill"></i></td>';
	  	}else{
	  		 str +='<td><a href=# data-bs-toggle="tooltip" data-bs-placement="top" title="';
	  		 str +=data[i].memo;
	  		 str +='"><i class="ri-article-fill"></i></a></td>';
	  	}
		str +='</tr>';
	  }
	}else{
	}
	
	str += '</tbody>';
	str += '</table>';
	str += '</div>';
	
	// 미연결
	str += '<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="nonbanklist-tab">';
	str += '<div class="banklogo">';
	str += '<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">';
	str += '<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">';
	str += '신한은행';
	str += '</button>';
	str += '<ul class="dropdown-menu">';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>';
	str += '</ul>';
	str += '</div>';
	str += '<table id="nonbanktable" class="banktable table table-hover table-bordered">';
	str += '<thead>';
	str += '<tr>';
	str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	str += '<th scope="col" class="tabletop">날짜</th>';
	str += '<th scope="col" class="tabletop">적요</th>';
	str += '<th scope="col" class="tabletop">입금액</th>';
	str += '<th scope="col" class="tabletop">출금액</th>';
	str += '<th scope="col" class="tabletop">잔액</th>';
	str += '<th scope="col" class="tabletop">메모</th>';
	str += '</tr>';
	str += '</thead>';
	str += '<tbody>';
	
	for (let i = 0; i < data.length; i++) {
		if(data[i].bhstatename=='미연결'){
	      	str +='<tr>';
	 	  	str +='<td><input class="form-check-input" type="checkbox"></td>';
	 	  	str +='<td>';
	 	  	str +=formatDate(data[i].bhdate);
	 	  	str +='</td>';
	 	  	str +='<td>';
	 	  	str +=data[i].source;
	 	  	str +='</td>';
	 	  	if(data[i].sortno==1){
	 	  		// 입금
	 	  		str +='<td>';
		 	  	str +=formatNumberWithCommas(data[i].amount);
		 	  	str +='</td>';
		 	  	str +='<td></td>';
	 	  	}else{
	 	  		// 출금
	 	  		str +='<td></td>';
	 	  		str +='<td>';
		 	  	str +=formatNumberWithCommas(data[i].amount);
		 	  	str +='</td>';
	 	  	}
	 	  	str +='<td>';
	 	  	str +=formatNumberWithCommas(data[i].sum);
	 	  	str +='</td>';
		  	if(data[i].memo==null){
		  		 str +='<td><i class="ri-article-fill"></i></td>';
		  	}else{
		  		 str +='<td><a href=# data-bs-toggle="tooltip" data-bs-placement="top" title="';
		  		 str +=data[i].memo;
		  		 str +='"><i class="ri-article-fill"></i></a></td>';
		  	}
			str +='</tr>';
	 	 }
	}
	
	str += '</tbody>';
	str += '</table>';
	str += '<button type="button" id="bankslipplzbtn" class="btn btn-primary btn-small">전표입력</button>';
	str += '<button type="button" id="memoplzbtn" class="btn btn-primary btn-small">내용확인요청</button>';
	str += '<button type="button" class="btn btn-outline-secondary">입력제외</button>';
	str += '</div>';
	
	// 연결
	str += '<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="connbanklist-tab">';
	str += '<div class="banklogo">';
	str += '<img src="/resources/assets/img/shinhan.png" alt="ShinhanBank" width="20" height="20">';
	str += '<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">';
	str += '신한은행';
	str += '</button>';
	str += '<ul class="dropdown-menu">';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>';
	str += '<li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>';
	str += '</ul>';
	str += '</div>';
	str += '<table id="connbanktable" class="banktable table table-hover table-bordered">';
	str += '<thead>';
	str += '<tr>';
	str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	str += '<th scope="col" class="tabletop">날짜</th>';
	str += '<th scope="col" class="tabletop">적요</th>';
	str += '<th scope="col" class="tabletop">입금액</th>';
	str += '<th scope="col" class="tabletop">출금액</th>';
	str += '<th scope="col" class="tabletop">잔액</th>';
	str += '<th scope="col" class="tabletop">메모</th>';
	str += '</tr>';
	str += '</thead>';
	str += '<tbody>';
	
	for (let i = 0; i < data.length; i++) {
		if(data[i].bhstatename=='확정가능' || data[i].bhstatename=='확정'){
	      	str +='<tr>';
	 	  	str +='<td><input class="form-check-input" type="checkbox"></td>';
	 	  	str +='<td>';
	 	  	str +=formatDate(data[i].bhdate);
	 	  	str +='</td>';
	 	  	str +='<td>';
	 	  	str +=data[i].source;
	 	  	str +='</td>';
	 	  	if(data[i].sortno==1){
	 	  		// 입금
	 	  		str +='<td>';
		 	  	str +=formatNumberWithCommas(data[i].amount);
		 	  	str +='</td>';
		 	  	str +='<td></td>';
	 	  	}else{
	 	  		// 출금
	 	  		str +='<td></td>';
	 	  		str +='<td>';
		 	  	str +=formatNumberWithCommas(data[i].amount);
		 	  	str +='</td>';
	 	  	}
	 	  	str +='<td>';
	 	  	str +=formatNumberWithCommas(data[i].sum);
	 	  	str +='</td>';
		  	if(data[i].memo==null){
		  		 str +='<td><i class="ri-article-fill"></i></td>';
		  	}else{
		  		 str +='<td><a href=# data-bs-toggle="tooltip" data-bs-placement="top" title="';
		  		 str +=data[i].memo;
		  		 str +='"><i class="ri-article-fill"></i></a></td>';
		  	}
			str +='</tr>';
	  }
	}
	
	str += '</tbody>';
	str += '</table>';
	str += '<button type="button" id="watchslipbtn" class="btn btn-primary btn-small">분개내역조회</button>';
	str += '</div>'; // 연결탭 끝
	str += '</div>';
	
	
	searchstart.html(str);
	
	// tooltip 초기화
	$('[data-bs-toggle="tooltip"]').tooltip();
	
	}//end 통장내역 조회


	// 전표내역 전체 조회 테이블 생성 함수
	function createBankSlipAllTable(slipList, total, all, can, confirmed, except, remove) {
	  let searchstart = $('.right');

	  searchstart.empty();
	  
	let str = '';
	str += '<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-home" aria-selected="true">';
	str += '<span class="button-text">전&nbsp;&nbsp;&nbsp;&nbsp;체</span><div class="howmany">';
	str += all;
	str += '</div></button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="pills-can-tab" data-bs-toggle="pill" data-bs-target="#pills-can" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">';
	str += '<span class="button-text">확정가능</span><div class="howmany">';
	str += can;
	str += '</div></button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="pills-certain-tab" data-bs-toggle="pill" data-bs-target="#pills-certain" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">';
	str += '<span class="button-text">확&nbsp;&nbsp;&nbsp;&nbsp;정</span><div class="howmany">';
	str += confirmed;
	str += '</div></button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="pills-except-tab" data-bs-toggle="pill" data-bs-target="#pills-except" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">';
	str += '<span class="button-text">제&nbsp;&nbsp;&nbsp;&nbsp;외</span><div class="howmany">';
	str += except;
	str += '</div></button>';
	str += '</li>';
	str += '<li class="nav-item" role="presentation">';
	str += '<button class="nav-link" id="pills-remove-tab" data-bs-toggle="pill" data-bs-target="#pills-remove" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">';
	str += '<span class="button-text">삭&nbsp;&nbsp;&nbsp;&nbsp;제</span><div class="howmany">';
	str += remove;
	str += '</div></button>';
	str += '</li>';
	str += '</ul>';
	str += '<div class="tab-content pt-2" id="myTabContent">';
	str += '<div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="home-tab">';
	
	// 전체 탭
	str += '<table id="" class="banksliptable table table-hover table-bordered">';
	  str += '<thead><tr>';
	  str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	  str += '<th scope="col" class="tabletop">거래처명</th>';
	  str += '<th scope="col" class="tabletop">전표적요</th>';
	  str += '<th scope="col" class="tabletop">상대계정</th>';
	  str += '<th scope="col" class="tabletop">상태</th>';
	  str += '<th scope="col" class="tabletop">예상잔액</th>';
	  str += '</tr></thead>';
	  str += '<tbody>';
	  
	  if(slipList && slipList.length>0){
	  		for(let i=0; i<slipList.length; i++){
				str += '<tr>';
			  	str += '<input type="hidden" name="bhno" value="';
			  	str += slipList[i].bhno;
			  	str += '"/>';
			  	str += '<td><input class="form-check-input" type="checkbox"></td>';
				str += '<td>';
			 	str += slipList[i].source;
			 	str += '</td>';
			 	if(slipList[i].summary==null){
			 		str += '<td>';
			 		str += '</td>';
			 	}else{
			 		str += '<td>';
			 		str += slipList[i].summary;
			 		str += '</td>';
			 	}
		
			 	str += '<td>';
			 	str += slipList[i].accountname;
			 	str += '</td>';
			 	str += '<td>';
			 	str += slipList[i].bhstatename;
			 	str += '</td>';
			 	str += '<td>';
			 	str += formatNumberWithCommas(slipList[i].sum);
			 	str += '</td></tr>';
			}
	  }else{
	  }
	
	str += ' <tr>';
	str += '<td class="total"></td>';
	str += '<td class="total"><strong>합계</strong></td>';
	str += '<td class="total" colspan="4">잔액: ';
	if(total.totalsum!=null){
		str += formatNumberWithCommas(total.totalsum);
	}
	str += '&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-wieght: bold;">차액: '
	if(total.diffsum!=null){
		str += formatNumberWithCommas(total.diffsum);
	}
	str += '</span></td>';
	str += '</tr>';
	str +='</tbody></table>';
	str += '<button type="button" id="detailslipshow" class="btn btn-light">분개내역조회</button>';
	str += '</div>';
	
	// 확정가능 탭
	str += '<div class="tab-pane fade" id="pills-can" role="tabpanel" aria-labelledby="profile-tab">';
	str += '<table id="" class="banksliptable table table-hover table-bordered">';
	  str += '<thead><tr>';
	  str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	  str += '<th scope="col" class="tabletop">거래처명</th>';
	  str += '<th scope="col" class="tabletop">전표적요</th>';
	  str += '<th scope="col" class="tabletop">상대계정</th>';
	  str += '<th scope="col" class="tabletop">상태</th>';
	  str += '<th scope="col" class="tabletop">예상잔액</th>';
	  str += '</tr></thead>';
	  str += '<tbody>';
	  
	  if(slipList && slipList.length>0){
	  		for(let i=0; i<slipList.length; i++){
	  			if(slipList[i].bhstatename=='확정가능'){
	  				str += '<tr>';
				  	str += '<input type="hidden" name="bhno" value="';
				  	str += slipList[i].bhno;
				  	str += '"/>';
				  	str += '<td><input class="form-check-input" type="checkbox"></td>';
					str += '<td>';
				 	str += slipList[i].source;
				 	str += '</td>';
				 	if(slipList[i].summary==null){
				 		str += '<td>';
				 		str += '</td>';
				 	}else{
				 		str += '<td>';
				 		str += slipList[i].summary;
				 		str += '</td>';
				 	}
			
				 	str += '<td>';
				 	str += slipList[i].accountname;
				 	str += '</td>';
				 	str += '<td>';
				 	str += slipList[i].bhstatename;
				 	str += '</td>';
				 	str += '<td>';
				 	str += formatNumberWithCommas(slipList[i].sum);
				 	str += '</td></tr>';

	  			}else{
	  			}//end if
			}//end for
	  }else{
	  }
	
	str += '<tr>';
	str += '<td class="total"></td>';
	str += '<td class="total"><strong>합계</strong></td>';
	str += '<td class="total" colspan="4">잔액: ';
	str += formatNumberWithCommas(total.totalsum);
	str += '&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-wieght: bold;">차액: '
	str += formatNumberWithCommas(total.diffsum);
	str += '</span></td>';
	str += '</tr>';
	str +='</tbody></table>';
	str += '<button type="button" id="certainslip" class="btn btn-light">확정</button>';
	str += '<button type="button" id="detailslipshow" class="btn btn-light">분개내역조회</button>';
	str += '<button type="button" id="exceptslip" class="btn btn-light">제외</button>';
	str += '<button type="button" id="removeslip" class="btn btn-light">삭제</button>';
	str += '</div>';
	
	// 확정
	str += '<div class="tab-pane fade" id="pills-certain" role="tabpanel" aria-labelledby="contact-tab">';
	str += '<table id="" class="banksliptable table table-hover table-bordered">';
	  str += '<thead><tr>';
	  str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	  str += '<th scope="col" class="tabletop">거래처명</th>';
	  str += '<th scope="col" class="tabletop">전표적요</th>';
	  str += '<th scope="col" class="tabletop">상대계정</th>';
	  str += '<th scope="col" class="tabletop">상태</th>';
	  str += '<th scope="col" class="tabletop">예상잔액</th>';
	  str += '</tr></thead>';
	  str += '<tbody>';
	  
	  if(slipList && slipList.length>0){
	  		for(let i=0; i<slipList.length; i++){
	  			if(slipList[i].bhstatename=='확정'){
	  				str += '<tr>';
				  	str += '<input type="hidden" name="bhno" value="';
				  	str += slipList[i].bhno;
				  	str += '"/>';
				  	str += '<td><input class="form-check-input" type="checkbox"></td>';
					str += '<td>';
				 	str += slipList[i].source;
				 	str += '</td>';
				 	if(slipList[i].summary==null){
				 		str += '<td>';
				 		str += '</td>';
				 	}else{
				 		str += '<td>';
				 		str += slipList[i].summary;
				 		str += '</td>';
				 	}
			
				 	str += '<td>';
				 	str += slipList[i].accountname;
				 	str += '</td>';
				 	str += '<td>';
				 	str += slipList[i].bhstatename;
				 	str += '</td>';
				 	str += '<td>';
				 	str += formatNumberWithCommas(slipList[i].sum);
				 	str += '</td></tr>';

	  			}else{
	  			}//end if
			}//end for
	  }else{
	  }
	
	str += '<tr>';
	str += '<td class="total"></td>';
	str += '<td class="total"><strong>합계</strong></td>';
	str += '<td class="total" colspan="4">잔액: ';
	str += formatNumberWithCommas(total.totalsum);
	str += '&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-wieght: bold;">차액: '
	str += formatNumberWithCommas(total.diffsum);
	str += '</span></td>';
	str += '</tr>';
	str +='</tbody></table>';
	str += '<button type="button" id="cancelcertainslip" class="btn btn-light">확정취소</button>';
	str += '<button type="button" id="detailslipshow" class="btn btn-light">분개내역조회</button>';
	str += '<button type="button" id="exceptslip" class="btn btn-light">제외</button>';
	str += '<button type="button" id="removeslip" class="btn btn-light">삭제</button>';
	str += '</div>';
	
	// 제외
	str += '<div class="tab-pane fade" id="pills-except" role="tabpanel" aria-labelledby="contact-tab">';
	str += '<table id="" class="banksliptable table table-hover table-bordered">';
	  str += '<thead><tr>';
	  str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	  str += '<th scope="col" class="tabletop">거래처명</th>';
	  str += '<th scope="col" class="tabletop">전표적요</th>';
	  str += '<th scope="col" class="tabletop">상대계정</th>';
	  str += '<th scope="col" class="tabletop">상태</th>';
	  str += '<th scope="col" class="tabletop">예상잔액</th>';
	  str += '</tr></thead>';
	  str += '<tbody>';
	  
	  if(slipList && slipList.length>0){
	  		for(let i=0; i<slipList.length; i++){
	  			if(slipList[i].bhstatename=='제외'){
	  				str += '<tr>';
				  	str += '<input type="hidden" name="bhno" value="';
				  	str += slipList[i].bhno;
				  	str += '"/>';
				  	str += '<td><input class="form-check-input" type="checkbox"></td>';
					str += '<td>';
				 	str += slipList[i].source;
				 	str += '</td>';
				 	if(slipList[i].summary==null){
				 		str += '<td>';
				 		str += '</td>';
				 	}else{
				 		str += '<td>';
				 		str += slipList[i].summary;
				 		str += '</td>';
				 	}
			
				 	str += '<td>';
				 	str += slipList[i].accountname;
				 	str += '</td>';
				 	str += '<td>';
				 	str += slipList[i].bhstatename;
				 	str += '</td>';
				 	str += '<td>';
				 	str += formatNumberWithCommas(slipList[i].sum);
				 	str += '</td></tr>';

	  			}else{
	  			}//end if
			}//end for
	  }else{
	  }
	
	str += '<tr>';
	str += '<td class="total"></td>';
	str += '<td class="total"><strong>합계</strong></td>';
	str += '<td class="total" colspan="4">잔액: ';
	str += formatNumberWithCommas(total.totalsum);
	str += '&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-wieght: bold;">차액: '
	str += formatNumberWithCommas(total.diffsum);
	str += '</span></td>';
	str += '</tr>';
	str +='</tbody></table>';
	str += '<button type="button" id="cancelexceptslip" class="btn btn-light">제외취소</button>';
	str += '</div>';
	
	// 삭제
	str += '<div class="tab-pane fade" id="pills-remove" role="tabpanel" aria-labelledby="contact-tab">';
	str += '<table id="" class="banksliptable table table-hover table-bordered">';
	  str += '<thead><tr>';
	  str += '<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>';
	  str += '<th scope="col" class="tabletop">거래처명</th>';
	  str += '<th scope="col" class="tabletop">전표적요</th>';
	  str += '<th scope="col" class="tabletop">상대계정</th>';
	  str += '<th scope="col" class="tabletop">상태</th>';
	  str += '<th scope="col" class="tabletop">예상잔액</th>';
	  str += '</tr></thead>';
	  str += '<tbody>';
	  
	  if(slipList && slipList.length>0){
	  		for(let i=0; i<slipList.length; i++){
	  			if(slipList[i].bhstatename=='삭제'){
	  				str += '<tr>';
				  	str += '<input type="hidden" name="bhno" value="';
				  	str += slipList[i].bhno;
				  	str += '"/>';
				  	str += '<td><input class="form-check-input" type="checkbox"></td>';
					str += '<td>';
				 	str += slipList[i].source;
				 	str += '</td>';
				 	if(slipList[i].summary==null){
				 		str += '<td>';
				 		str += '</td>';
				 	}else{
				 		str += '<td>';
				 		str += slipList[i].summary;
				 		str += '</td>';
				 	}
			
				 	str += '<td>';
				 	str += slipList[i].accountname;
				 	str += '</td>';
				 	str += '<td>';
				 	str += slipList[i].bhstatename;
				 	str += '</td>';
				 	str += '<td>';
				 	str += formatNumberWithCommas(slipList[i].sum);
				 	str += '</td></tr>';

	  			}else{
	  			}//end if
			}//end for
	  }else{
	  }
	
	str += '<tr>';
	str += '<td class="total"></td>';
	str += '<td class="total"><strong>합계</strong></td>';
	str += '<td class="total" colspan="4">잔액: ';
	str += formatNumberWithCommas(total.totalsum);
	str += '&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-wieght: bold;">차액: '
	str += formatNumberWithCommas(total.diffsum);
	str += '</span></td>';
	str += '</tr>';
	str +='</tbody></table>';
	str += '<button type="button" id="cancelremoveslip" class="btn btn-light">삭제취소</button>';
	str += '</div>';
	str += '</div>';
	  

	searchstart.html(str);	              

	}//end of createBankSlipAllTable


	
	// 처음 로딩 시 분개내역 조회 테이블 생성 함수
	function createDetailSlipTable(detailSlip) {
	  let searchstart = $('.bottom');

	  searchstart.empty();
	  
	  	let str = '';
	  	str += '<form method="POST" action="/bank/updateDetailSlips">';
		str += '<table class="table detailsliptable table-bordered">';
		str += '<thead>';
		str += '<tr>';
		str += '<th scope="col" class="tabletop">구분</th>';
		str += '<th colspan="2" scope="col" class="tabletop">계정과목</th>';
		str += '<th scope="col" class="tabletop">차변</th>';
		str += '<th scope="col" class="tabletop">대변</th>';
		str += '<th scope="col" class="tabletop">거래처명</th>';
		str += '<th scope="col" class="tabletop">적요</th>';
		str += '</tr>';
		str += '</thead>';
		str += '<tbody>';
		
		
		 if(detailSlip && detailSlip.length>0){
	  		for(let i=0; i<detailSlip.length; i++){
	  			str += '<tr>';
	  			str += '<input type="hidden" name="bankslipno" value="';
	  			str += detailSlip[i].bankslipno;
	  			str += '" />';
	  			str += '<input type="hidden" name="bhno" value="';
	  			str += detailSlip[i].bhno;
	  			str += '" />';
				str += '<td>';
				str += '<select class="form-select" name="sortno" aria-label="Default select example">';
				
				// 가져온 분개전표의 sortno에 따라 달라지는 select문
				if (detailSlip[i].sortno == 1) {
				  str += '<option value="1" selected>입금</option>';
				} else {
				  str += '<option value="1">입금</option>';
				}
				
				if (detailSlip[i].sortno == 2) {
				  str += '<option value="2" selected>출금</option>';
				} else {
				  str += '<option value="2">출금</option>';
				}
				
				if (detailSlip[i].sortno == 3) {
				  str += '<option value="3" selected>차변</option>';
				} else {
				  str += '<option value="3">차변</option>';
				}
				
				if (detailSlip[i].sortno == 4) {
				  str += '<option value="4" selected>대변</option>';
				} else {
				  str += '<option value="4">대변</option>';
				}

				str += '</select>';
				str += '</td>';
				str += '<td><button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#accountCode" onclick="openAccountCodeModal(this)">';
				str += '<i class="ri-article-fill"></i>';
				str += '</button><input type="text" name="accountno" class="intable" value="';
				str += detailSlip[i].accountno;
				str += '"></td>';
				str += '<td><input type="text" name="accountname" class="intable" value="';
				str += detailSlip[i].accountname;
				str += '"></td>';
				
				// 차변이면
				if(detailSlip[i].sortno == 3){
					// 첫번째 amount 칸에 값 입력
					str += '<td><input type="text" name="amount" class="intable" value="';
					str += formatNumberWithCommas(Math.abs(detailSlip[i].amount));
					str += '"></td>';
					str += '<td class="cantwrite"><input type="text" name="amount" class="intable cantwrite" readonly="readonly"></td>';
				}else{
					// 대변이면 두번째 칸에 값 입력
					str += '<td class="cantwrite"><input type="text" name="amount" class="intable cantwrite" readonly="readonly"></td>';
					str += '<td><input type="text" name="amount" class="intable" value="';
					str += formatNumberWithCommas(Math.abs(detailSlip[i].amount));
					str += '"></td>';
					
				}
				
				str += '<td><input type="text" name="source" class="intable" value="';
				str += detailSlip[i].source;
				str += '"></td>';
				str += '<td><input type="text" name="summary" class="intable" value="';
				
				if(detailSlip[i].summary==null){
					str += '"></td>';
				}else{
					str += detailSlip[i].summary;
				}
				str += '"></td>';
				str += '</tr>';
	  		}//end for
	  		
	  		str += '</tbody>';
			str += '</table>';
	  		str += '<button type="submit" class="btn btn-outline-confirm" id="modifyslipbtn">저장</button>';
	  		str += '<button type="reset" class="btn btn-outline-secondary">취소</button>';
	  	 }else{
	  	 
	  	 	// 처음 로딩됐을때, 아무것도 없을 때
	  	 	str += '<tr>';
			str += '<td>';
			str += '<select class="form-select" name="sortno"aria-label="Default select example">';
			str += '<option value="1">입금</option>';
			str += '<option value="2">출금</option>';
			str += '<option value="3" selected>차변</option>';
			str += '<option value="4">대변</option>';
			str += '</select>';
			str += '</td>';
			str += '<td><input type="text" name="accountno" class="intable"></td>';
			str += '<td><input type="text" name="accountname" class="intable"></td>';
			str += '<td><input type="text" name="amount" class="intable"></td>';
			str += '<td><input type="text" name="amount" class="intable"></td>';
			str += '<td><input type="text" name="source" class="intable"></td>';
			str += '<td><input type="text" name="summary" class="intable"></td>';
			str += '</tr>';
			str += '<tr>';
			str += '<td>';
			str += '<select class="form-select" name="sortno" aria-label="Default select example">';
			str += '<option selected>차변</option>';
			str += '<option value="1">입금</option>';
			str += '<option value="2">출금</option>';
			str += '<option value="3">차변</option>';
			str += '<option value="4" selected>대변</option>';
			str += '</select>';
			str += '</td>';
			str += '<td><input type="text" name="accountno" class="intable"></td>';
			str += '<td><input type="text" name="accountname" class="intable"></td>';
			str += '<td><input type="text" name="amount" class="intable"></td>';
			str += '<td><input type="text" name="amount" class="intable"></td>';
			str += '<td><input type="text" name="source" class="intable"></td>';
			str += '<td><input type="text" name="summary" class="intable"></td>';
			str += '</tr>';
			str += '</tbody>';
			str += '</table>';
	  	 }


		str += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />';
		str += '</form>';
	  
	 
	  searchstart.html(str);
	}


	// 분개내역조회 클릭 시 내용 생성 함수
	//		              <button type="button" class="btn btn-outline-confirm">저장</button>
	//	              <button type="button" class="btn btn-outline-secondary">취소</button>


	function formatDate(dateString) {
	  const date = new Date(dateString);
	  //const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  return `${month}-${day}`;
	}
	
	
	
	function formatNumberWithCommas(number) {
  		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		
	}
	
	// 클릭한 버튼을 매개변수로 받음
	function openAccountCodeModal(btn) {
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

					// 모달을 열 때, 클릭한 버튼 객체를 모달 내에서 활용하기 위해 data() 메소드를 사용하여 저장
      				//$("#accountCode").data('clickedButton', btn);
      				
					// 모달을 열 때, 모달을 열기 위해 클릭했던 버튼을 기억하기 위해(모달 id)
					// + 클릭 버튼 객체를 가져오기 위해
					// 아래와 같이 모달을 열면서 모달 내의 더블클릭 이벤트를 처리한다.
					$("#accountCode").modal("show").on("shown.bs.modal", function () {
					    $(document).on("dblclick", '#accountListModal tr', function () {
					    
		                  let selectedAccountNo = $(this).find('td:first-child').text();
		                  let selectedAccountName = $(this).find('td:nth-child(2)').text();
					      
					      // this= 더블클릭한 tr
					      //let selectedAccountInfo = $(this).data('accountInfo');
					      //let selectedAccountNo = selectedAccountInfo.accountNo;
					      //let selectedAccountName = selectedAccountInfo.accountName;
					
					      // 클릭했던 버튼과 같은 tr의 input들에 각각 값 넣어주기
					      $(btn).closest('tr').find('input[name="accountno"]').val(selectedAccountNo);
					      $(btn).closest('tr').find('input[name="accountname"]').val(selectedAccountName);
					
					      // 모달 창 닫기
					      $("#accountCode").modal("hide");
					    });
					  });
				},
				error: function (xhr, status, error) {
					console.log(error);
				}
			});
		}
		
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
	                    $('#searchedaccountno').val(selectedAccountNo);
	                    $('#searchedaccountname').val(selectedAccountName);
	                    
	                    // 이걸 이렇게 넣어줄게 아니라 ajax로 또 값 넘겨줘야한다.

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

