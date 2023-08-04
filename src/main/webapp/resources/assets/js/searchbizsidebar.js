
	$(function(){
		
		// 페이지 로드되면 전체 기업 리스트 가져오기
		let bizname= '';
		searchBizList(bizname);
		
		// 값 입력 후 검색버튼 클릭 시 검색
		$("#searchbizAction").on("click", function(){
			bizname = $("#searchbusiness").val();
			searchBizList(bizname);
		});
		
		// 버튼 클릭 외 엔터 시
		$("#searchbusiness").on("keypress", function(event) {
		    // 엔터 키의 key code=13
		    if (event.which === 13) {
		    	event.preventDefault();   // 꼭 필요 (폼제출 방지)
		        bizname = $("#searchbusiness").val();
		        searchBizList(bizname);
		    }
		});
		
		// 전체 기업 검색 버튼 클릭 시
		$("#searchAllbusiness").on("click", function(){
			bizname = '';
			searchBizList(bizname);
		});
		
		let testList = ['테스트', '테스트입니다', '테스트할게'];
		
		// 검색어 자동완성
        $("#searchbusiness").autocomplete({         
        		source: testList
        			/*
        			 function(request, response) {
		            $.ajax({
		                type : 'POST',
		                url: "/common/autosearch",
		                data: { value: request.term }, // 사용자의 검색어
		                dataType : 'json',
		                success : function(data) {
		                  	response(
								$.map(data.bizList, function(item){
									return{
										label: item.bizname    // 목록에 표시되는 값
										, value: item.bizname // 선택시 input에 표시되는 값
										, idx: item.bizno        // db 인덱스
									};
								})//end map
							); // data=bizNameList. autocomplete에서 바로 사용 가능
		                }
		            });//end ajax
		            }
		            */
		        , minLength: 1
        		, select : function(event, ui){
        			// 하단의 숨겨진 input에 추천검색어 보여지도록 함
        			$("#searchhidden").val(ui.item.value);
        		}
        });
	
	});//end window load
	
	// 기업 조회 ajax
	function searchBizList(bizname){
		
		$.ajax({
	      type: "GET",
	      contentType: "application/json;charset=UTF-8",
	      url: "/common/getBizList",
	      dataType: "json",
	      data: { bizname: bizname },   // 검색키워드
	      success: function(response) {
	        getbizList(response);
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	      }
	    });
	}

	
	// 사이드 바 랜더링
	function getbizList(business){
		let searchstart = $('#businessList');
		
		searchstart.empty();
		
		let str = '';
		str += '<div class="list-group">';

		for(let i=0; i<business.length; i++){
			str += '<a href="#" class="list-group-item list-group-item-action">';
			str += '<input type="hidden" name="biznoInSidebar" value="';
			str += business[i].bizno;
			str += '">';
			str += '<div class="d-flex w-100 justify-content-between">';
			str += '<h5 class="mb-1">';
			str += business[i].bizname;
			str += '</h5><i class="bi bi-bell"></i>';
			str += '</div>';
			str += '<span class="badge biztype">';
			str += business[i].industry;
			str += '</span>';
			str += '<small class="text-muted">';
			str += business[i].businesslicense;
			str += '</small>';
			str += '</a>';
		}

		str += '</div>';
		
		searchstart.html(str);
	}