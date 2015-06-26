<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dash Board-Review</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="community/css/shop-homepage.css" rel="stylesheet">
    <link href='common/css/modalStyle.css' rel='stylesheet'>

	<style>
	#reContentWrap {
		height: 30px;
		-webkit-transition: all 0.3s ease;
		-moz-transition: all 0.3s ease;
		-o-transition: all 0.3s ease;
		transition: all 0.3s ease;
	}
	
	#reContentWrap.fullSize {
		height: 80px;
		-webkit-transition: all 0.3s ease;
		-moz-transition: all 0.3s ease;
		-o-transition: all 0.3s ease;
		transition: all 0.3s ease;
	}
	
	textarea {
		height: 100%;
		resize: none;
	}
	</style>

	<!-- jQuery -->
    <script src="js/jquery-1.11.1.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<!-- Custom JS -->
    <script src="common/js/common.js"></script>
    <script src="common/js/signUp.js"></script>
    <script src="user/user.js"></script>
    <script src="common/js/reviewList.js"></script>

</head>
<body>

    <jsp:include page="../common/navTop.jsp"/>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
        
        <div class="row row-offcanvas row-offcanvas-left">

				<div class="col-sm-9 col-md-10 main" style="width: 100%;">

					<!--toggle sidebar button-->
					<p class="visible-xs">
						<button type="button" class="btn btn-primary btn-xs"
							data-toggle="offcanvas">
							<i class="glyphicon glyphicon-chevron-left"></i>
						</button>
					</p>

					<h2 class="sub-header">Cook's Review</h2>
					
					
		<div id="tweetFromDiv">			
			<form id="tweetFrom" action="/cooks/writeReview.app" method="post" enctype="multipart/form-data">
				<div class="form-group">
				
					<div id="reContentWrap" style="cursor: text">
						<textarea id="re_Content" name="re_Content" cols="100%" placeholder="음식의 맛은 어땠나요?"></textarea>
						<div id="addBtn" class="col-sm-10" style="padding-left: 0px;">
							평점 :<input type="text" id="re_Grade" name="re_Grade">
							<input type="file" value="사진추가" id="re_Fname" multiple name="re_Fname" style="display: inline-block; width: 180px;">
							<input type="submit" id="writeReviewBtn" value="글쓰기" style="display: inline-block;" >
						</div>
						
					</div>
				</div>
		
					
			</form>
		</div>
		
					
					<div class="table-responsive">
						<table class="table table-striped" id='reviewListTable'>
							<thead>
								<tr>
									<th style="width: 6%;">#</th>
									<th style="width: 12%; text-align: center;">이미지</th>
									<th>제 목</th>
									<th style="width: 12%; text-align: center;">작성자</th>
									<th style="width: 12%; text-align: center;">날짜</th>
									<th style="width: 10%; text-align: center;">평점</th>
								</tr>
							</thead>
							<tbody id='reviewListTbody' style="font-size: 11px;">
								<!-- review.js 에서 반복문으로 <tr>, <td>를 append 함. -->
							</tbody>
						</table>
						
					</div>

				</div>
				<!--/row-->
			</div>

		</div> <!-- row -->
	</div> <!-- /container -->

<!-- ................ Footer container ............ -->
	<div class="container">
        <hr>
        <!-- Footer -->
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

	<script>
	// 리스트를 불러올 때 세션을 넘겨 받아서 세션이 NULL 값이면 글쓰기 버튼을 눌렀을 때 모달을 띄우도록 구현
		$('#re_Content').click(function() {
			$('#re_Content').removeAttr('placeholder');
			if ($('#reContentWrap').hasClass('fullSize')) {} 
			else {
				$('#reContentWrap').addClass('fullSize');
				$('#addBtn').css('display', '');
			}
		});

		$('#tweetFrom').focusout(function() {
			if ($('#re_Content').val().length > 0) {

			} else {

				$('#re_Content').attr('placeholder', '여러분의 후기를 남겨주세요~');
				$('#reContentWrap').removeClass('fullSize');
				//$('#addBtn').css('display', 'none');
			}
		});
		
		
	</script>

</body>
</html>
