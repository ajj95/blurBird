<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchbizsidebar</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<!-- jQuery UI CDN 추가 3줄 (autocomplete, 자동 완성 기능 구현용) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="../resources/assets/js/searchbizsidebar.js"></script>
</head>
<body>
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
      	<div class="search-bar bizsearch">
	      <form class="search-form d-flex align-items-center search-biz" method="POST" action="#">
	      <!-- blur처리 -->
	        <input type="text" name="bizname" id="searchbusiness" placeholder="수임기업명을 검색하세요" title="Enter search keyword">
	        <input type="hidden" id="searchhidden">
	        <button type="button" title="Search" id="searchbizAction"><i class="bi bi-search"></i></button>
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
      <button type="button" class="btn btn-outline-primary allbtn" id="searchAllbusiness">
      	<i class="ri-building-line"></i> 전체수임기업</button>
      <br><br>
      <li class="nav-item-divider"></li> <!-- 회색 선 추가 -->
      <br>
      <!-- 수임사 리스트 동적 생성 부분 -->
      <li class="nav-item" id="businessList">

      </li>
	</ul>

  </aside><!-- End Sidebar-->
</body>
</html>