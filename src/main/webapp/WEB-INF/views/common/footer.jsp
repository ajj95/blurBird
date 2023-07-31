<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>footer</title>
  <style type="text/css">

	.list_corp {
        list-style: none;
	    margin-bottom: 0px;
	    margin-top: 15px !important;
	    color: #777 !important;
	}

	#footer .list_corp .corp_item {
	    float: left;
	    color: #777 !important;
	    margin-right: 8px;
	}
	
	#footer .list_corp .corp_item+.corp_item:before {
	    content: "";
	    display: inline-block;
	    width: 1px;
	    height: 11px;
	    margin: 0 8px;
	    background-color: #e4e8eb;
	    vertical-align: -1px;
	}
	
	ul.list_corp a.footerlink{
    color: #a8afb5;
    text-decoration: none;
	}
	.footer {
    display: flex;
    justify-content: space-between; 
    white-space: nowrap; 
    }
    .bluetaxcopy{
    margin-right: 30px;
    margin-top:15px;
    }

  </style>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
</head>
<body>
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
		<ul class="list_corp"> 
			<li class="corp_item"><a href="#" class="footerlink"><strong>회사소개</strong></a></li> 
			<li class="corp_item"><a href="#" class="footerlink"><strong>이용약관</strong></a></li> 
			<li class="corp_item"><a href="#" class="footerlink"><strong>개인정보처리방침</strong></a></li> 
			<li class="corp_item"><a href="#" class="footerlink"><strong>고객센터</strong></a></li> 
		</ul>
    </div>
    <span class="bluetaxcopy">&copy; Copyright 2023 All rights reserved by <strong><span>BlurTax</span></strong></span>
  </footer><!-- End Footer -->

</body>
</html>
