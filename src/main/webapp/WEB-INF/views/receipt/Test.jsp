<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>검색 결과</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
  <h1>달력 테스트</h1>
  <input type="date" id="startDate">
  <input type="date" id="endDate">
  <button class="searchButton">검색</button>
  <table>
    <thead>
      <tr>
        <th>문서번호</th>
        <th>유저넘버</th>
        <th>등록일자</th>
        <th>목적</th>
        <th>영수증주소</th>
        <!-- 필요한 만큼 필드를 추가할 수 있습니다. -->
      </tr>
    </thead>
    <tbody id="searchResults">
      <!-- 검색 결과는 여기에 동적으로 추가될 것입니다. -->
    </tbody>
  </table>

  <script type="text/javascript">
    $('.searchButton').on('click', function() {
      let startDate = $('#startDate').val();
      let endDate = $('#endDate').val();
      let requestData = {
        startDate: startDate,
        endDate: endDate
      };

      $.ajax({
        type: 'get',
        url: '/receipt/dateSearch',
        data: requestData,
        success: function(response) {
          // 검색 결과 처리
          console.log('검색 결과:', response);
          // 여기서 필요한 로직을 추가하여 검색 결과를 화면에 표시하거나 처리합니다.

          // 테이블에 검색 결과를 동적으로 추가
          let tbody = $('#searchResults');
          tbody.empty(); // 이전 결과를 지우기 위해 tbody 내용을 비웁니다.

          response.forEach(item => {
            let row = $('<tr>');
            row.append($('<td>').text(item.recreqno));
            row.append($('<td>').text(item.userno));
            row.append($('<td>').text(moment(item.reqdate).format('YY/MM/DD')));
            row.append($('<td>').text(item.purpose));
            row.append($('<td>').text(item.receiptpath));
            // 필요한 만큼 필드를 추가하여 데이터를 출력합니다.

            tbody.append(row); // 행을 테이블에 추가합니다.
          });
        },
        error: function(xhr, status, error) {
          console.error('에러 발생:', error);
        }
      });

      console.log("시작 날짜:", startDate);
      console.log("마지막 날짜:", endDate);
    });
  </script>
</body>
</html>
