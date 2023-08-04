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
  <h1>입력 예제</h1>
    <form>
        <label for="name">이름:</label>  <input type="text" id="name" name="name" required>
        <label for="gen">구분:</label>  <input type="text" id="gen" name="gen" required>
        <label for="category">유형:</label>  <input type="text" id="category" name="category" required>
        <label for="bcnc">거래처:</label>  <input type="text" id="bcnc" name="bcnc" required>
        <label for="summary">적요:</label>  <input type="text" id="summary" name="summary" required>
        <label for="amount">공급가액:</label>  <input type="text" id="amount" name="amount" required>
        <label for="tax">세액:</label>  <input type="text" id="tax" name="tax" required>
        <label for="total">합계:</label>  <input type="text" id="total" name="total" required>
        <label for="divide">분개:</label>  <input type="text" id="divide" name="divide" required>
        <label for="slip">전표반영:</label>  <input type="text" id="slip" name="slip" required>
        <label for="memo">메모:</label>  <input type="text" id="memo" name="memo" required>
    </form>
    
    <h2>입력 결과</h2>
    <table id="resultTable" border="1">
    <thead>
        <tr>
            <th>이름</th>
            <th>구분</th>
            <th>유형</th>
            <th>거래처</th>
            <th>적요</th>
            <th>공급가액</th>
            <th>세액</th>
            <th>합계</th>
            <th>분개</th>
            <th>전표반영</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        	<td class = "name">테스트</td>
        	<td class = "gen">테스트</td>
        	<td class = "category">테스트</td>
        	<td class = "bcnc">테스트</td>
        	<td class = "summary">테스트</td>
        	<td class = "amount">테스트</td>
        	<td class = "tax">테스트</td>
        	<td class = "total">테스트</td>
        	<td class = "divide">테스트</td>
        	<td class = "slip">테스트</td>
        	<td class = "memo">테스트</td>
        </tr>
        </tbody>
    </table>

<script>
    // 입력 폼 blur (focus 해제) 이벤트 처리
    $("#memo").on("input", function() {
        // 입력 폼에서 focus가 해제되면 입력 값을 받아옴
        const memoLocation = $(this);
        const memo = $(memoLocation).val();
        
        // Find the corresponding "slip" cell and update its content
		const slipLocation = $(this).closest("tr").find(".slip");
        const slip = $(slipLocation).val();
        console.log(slip);
        $('.memo').text(memo);
        $('.slip').text(slip);
    });
</script>
</body>
</html>
