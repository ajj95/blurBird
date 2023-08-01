<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
        // 테이블을 더블클릭했을 때 실행되는 함수
        function showCellValue(row, col) {
            var table = document.getElementById("myTable");
            var cellValue = table.rows[row].cells[col].innerText;
            alert("선택한 셀의 값은: " + cellValue);
        }
    </script>
</head>
<body>
<h1>더블클릭한 셀의 값을 출력하는 예제</h1>
    <table id="myTable" border="1">
        <tr>
            <td ondblclick="showCellValue(0, 0)">A1</td>
            <td ondblclick="showCellValue(0, 1)">B1</td>
        </tr>
        <tr>
            <td ondblclick="showCellValue(1, 0)">A2</td>
            <td ondblclick="showCellValue(1, 1)">B2</td>
        </tr>
    </table>
</body>
</html>