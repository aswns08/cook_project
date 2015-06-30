<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Dash Board-ReviewContent</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="community/css/shop-homepage.css" rel="stylesheet">
<link href='common/css/modalStyle.css' rel='stylesheet'>

<!-- jQuery -->
<script src="js/jquery-1.11.1.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="common/js/common.js"></script>
<script src="common/js/signUp.js"></script>

</head>

<body>
<jsp:include page="../common/navTop.jsp"/>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="row row-offcanvas row-offcanvas-left">
				<!----------------- 사이드바 ---------------------->			
				<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

					<ul class="nav nav-sidebar" style="margin-top: 15px;">
						<li class="active"><a href="freeList.app">자유게시판</a></li>
						<li><a href="recipeList.app">나만 아는 레시피</a></li>
						<li><a href="#">공지사항</a></li>
					</ul>

				</div>
				
				<div class="col-sm-9 col-md-10 main">
					<p class="visible-xs">
						<button type="button" class="btn btn-primary btn-xs"
							data-toggle="offcanvas">
							<i class="glyphicon glyphicon-chevron-left"></i>
						</button>
					</p>

					<h2 class="sub-header"></h2>

					<br>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>${contentReview.re_Num}</h4>
							<label for="id">글쓴이 : </label> ${contentReview.id} <br>
						</div>
						<div class="panel-body">${contentReview.re_Content}</div>
						<div class="panel-footer">

							<!-- 게시글 수정/게시글 삭제 버튼을 좋아요/댓글달기 와 같은줄에 오게하기위해 id값 주고 style에서 inline-block 해줌 -->
							<div id="inlineFooter" style="float: right">
								<c:if test="${loginUser.id == contentReview.id}">
								<a href="#">게시글 수정</a> .
								<a href="#">게시글 삭제</a> .
								 
							</c:if>
							<a href="reviewList.app?pageNum=${pageNum}">목록으로</a>
							</div>
						</div>
					</div>
					
				</div>

			</div>

		</div> <!--/row-->
	</div> <!--/.container-->

	<!-- ................ Footer container ............ -->
	<div class="container">
		<hr>
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Get Hyped for Food</p>
				</div>
			</div>
		</footer>
	</div>
	<!-- /.container -->

<jsp:include page="../common/sign_modal.jsp"/>

</body>

</html>
