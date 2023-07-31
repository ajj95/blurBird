
// 조회버튼 클릭시 통장내역 조회
$(function(){
	
		// 일자, 수임사 선택 후 조회 시
		// form을 submit 할 때 Ajax 요청을 보내도록 처리
        $("#searchHistorySlip").on("submit", function(event) {
            event.preventDefault();
            alert('테스트');
            /*
            var startDate = $("#startdate").val();
            var endDate = $("#enddate").val();
            var bankName = $(".dropdown-toggle").text().trim();
            var gridRadios = $("input[name='gridRadios']:checked").val();
            
            var search = {
                startdate: startDate,
                enddate: endDate,
                bankname: bankName,
                gridRadios: gridRadios
            };
            
            sendAjaxRequest(search);
            */
        });
	
	
	
 		// Ajax 요청을 보낼 함수
        function sendAjaxRequest(search) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/bank/getHistoryAndSlip",
                data: JSON.stringify(search),
                dataType: "json",
                success: function(response) {
                    // 서버로부터 받은 데이터 처리
                    var historyList = response.historyList;
                    var slipList = response.slipList;
                    
                    // 이후 원하는 방식으로 데이터를 처리하면 됩니다.
                    // 예시로는 historyList와 slipList를 콘솔에 출력하는 것입니다.
                    console.log(historyList);
                    console.log(slipList);
                },
                error: function(xhr, status, error) {
                    // 에러 처리
                    console.error(error);
                }
            });
        }
	
});




    // 통장내역 전체 조회 테이블 생성 함수
	function createBankHistoryAllTable(data) {
	  let searchstart = $('.searhstart');

	  searchstart.empty();
	    
	  let leftDiv = $('<div class="left"></div>');
	  leftDiv.append('<ul class="nav nav-tabs" id="myTab" role="tablist">');
	  leftDiv.append('<li class="nav-item" role="presentation">');
	  leftDiv.append('<button class="nav-link active" id="allbanklist-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>');
	  leftDiv.append('</li>');
	  leftDiv.append('<li class="nav-item" role="presentation">');
	  leftDiv.append('<button class="nav-link" id="nonbanklist-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">전표미연결</button>');
	  leftDiv.append('</li>');
	  leftDiv.append('<li class="nav-item" role="presentation">');
	  leftDiv.append('<button class="nav-link" id="connbanklist-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">전표연결</button>');
	  leftDiv.append('</li>');
	  leftDiv.append('</ul>');
	  leftDiv.append('<div class="tab-content pt-2" id="myTabContent">');
	  leftDiv.append('<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="allbanklist-tab">');
	  leftDiv.append('<div class="banklogo">');
	  leftDiv.append('<img src="/resources/assets/img/shinhan.png" alt="Shinhan Bank" width="20" height="20">');
	  leftDiv.append('<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">');
	  leftDiv.append('신한은행');
	  leftDiv.append('</button>');
	  leftDiv.append('<ul class="dropdown-menu">');
	  leftDiv.append('<li><a class="dropdown-item" href="javascript:void(0);">국민은행</a></li>');
	  leftDiv.append('<li><a class="dropdown-item" href="javascript:void(0);">우리은행</a></li>');
	  leftDiv.append('<li><a class="dropdown-item" href="javascript:void(0);">농협은행</a></li>');
	  leftDiv.append('<li><a class="dropdown-item" href="javascript:void(0);">SC제일은행</a></li>');
	  leftDiv.append('<li><a class="dropdown-item" href="javascript:void(0);">KEB하나은행</a></li>');
	  leftDiv.append('</ul>');
	  leftDiv.append('</div>');
	  leftDiv.append('<table id="allbanktable" class="banktable table table-hover table-bordered">');
	  leftDiv.append('<thead>');
	  leftDiv.append('<tr>');
	  leftDiv.append('<th scope="col" class="tabletop"><input class="form-check-input" type="checkbox"></th>');
	  leftDiv.append('<th scope="col" class="tabletop">날짜</th>');
	  leftDiv.append('<th scope="col" class="tabletop">적요</th>');
	  leftDiv.append('<th scope="col" class="tabletop">입금액</th>');
	  leftDiv.append('<th scope="col" class="tabletop">출금액</th>');
	  leftDiv.append('<th scope="col" class="tabletop">잔액</th>');
	  leftDiv.append('<th scope="col" class="tabletop">메모</th>');
	  leftDiv.append('</tr>');
	  leftDiv.append('</thead>');
	  leftDiv.append('<tbody>');
	  
	  // bankhistorylist만큼 반복
	  for (let i = 0; i < data.length; i++) {
      	leftDiv.append('<tr>');
 	  	leftDiv.append('<td><input class="form-check-input" type="checkbox"></td>');
 	  	leftDiv.append('<td>');
 	  	leftDiv.append(data[i].bhdate);
 	  	leftDiv.append('</td>');
 	  	leftDiv.append('<td>');
 	  	leftDiv.append(data[i].source);
 	  	leftDiv.append('</td>');
 	  	if(data[i].sortno==1){
 	  		// 입금
 	  		leftDiv.append('<td>');
	 	  	leftDiv.append(data[i].amount);
	 	  	leftDiv.append('</td>');
	 	  	leftDiv.append('<td></td>');
 	  	}else{
 	  		// 출금
 	  		leftDiv.append('<td></td>');
 	  		leftDiv.append('<td>');
	 	  	leftDiv.append(data[i].amount);
	 	  	leftDiv.append('</td>');
 	  	}
 	  	leftDiv.append('<td>');
 	  	leftDiv.append(data[i].sum);
 	  	leftDiv.append('</td>');
	  	if(data[i].memo==null){
	  		leftDiv.append('<td><i class="ri-article-fill"></i></td>');
	  	}else{
	  		 leftDiv.append('<td><a href=# data-bs-toggle="tooltip" data-bs-placement="top" title="');
	  		 leftDiv.append(data[i].memo);
	  		 leftDiv.append('"><i class="ri-article-fill"></i></a></td>');
	  	}
		leftDiv.append('</tr>');
	  }
	  
	  leftDiv.append('</tbody>');
	  leftDiv.append('</table>');
	  leftDiv.append('</div>');
	  leftDiv.append('<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="nonbanklist-tab">');
	  leftDiv.append('</div>');
	  leftDiv.append('<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="connbanklist-tab">');
	  leftDiv.append('</div>');
	  leftDiv.append('</div>');
	  leftDiv.append('</div>');  // left 끝
	  
	  searchstart.append(leftDiv);

	}//end of createBankHistoryAllTable







