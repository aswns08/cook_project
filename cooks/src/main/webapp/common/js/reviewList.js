var currentPageNum;
var endPageNum;

// $(document).ready(function() {}) ;
$(function () {
	
	loadReviewList(1);

/*	Ajax로 글쓰기하는 이벤트 (미완성)
	
	$('#writeReviewBtn').click(function () {
		console.log("글쓰기 이벤트 발생");
		$.ajax({
			type: "POST",
			url: "/cooks/login.app",
			async: true,
			dataType: "json",
			data: formdata,
			success : function(data) {
				if(data.status == "success") {
					alert("등록성공");
					loadReviewList(1);
					// 폼 리셋 시켜주는 $('#btnCancel').click(); 이벤트 추가.
				} else 
					alert("등록실패");
			},
			error : function(xhr) {
				console.log("error", xhr);
				alert("error html = " + xhr.statusText);
			} // error
			
		}); // ajax
		
	}); // click(function)
	
*/	
	
}); //document.ready


// 페이징처리.
function setPageNum(currentPageNum, endPageNum) {
	window.currentPageNum = currentPageNum;
	window.endPageNum = endPageNum;
	
	$('#pageNum').html(currentPageNum);
	
	if(currentPageNum <= 1)
		$('#prevBtn').css('display', 'none');
	else
		$('#prevBtn').css('display', '');
	
	if(currentPageNum >= endPageNum)
		$('#nextBtn').css('display', 'none');
	else
		$('#nextBtn').css('display', '');
	
} // setPageNum


// 리뷰리스트
function loadReviewList(pageNum) {
	if(pageNum <= 0) pageNum = currentPageNum;
	
	$.getJSON('/cooks/reviewList.app?pageNum='+pageNum, function(data) {
		
		setPageNum(data.currentPageNum, data.endPageNum);
		
		var reviewList = data.reviewList;
		//yyyyMMddList(reviewList);
		
		// 기존 리뷰 리스트 삭제
		$('.data-row').remove();
		// 새로 리뷰 리스트를 생성
		for(var i=0 ; i < reviewList.length ; i++) {
			
			console.log(reviewList[i].saveFileName);
			
			$('<tr>').addClass('data-row').css('height', '5em')
			.append($('<td>').html(reviewList[i].re_Num).css('vertical-align', 'middle'))
			.append(
					$('<td>').append(
							$('<img>').attr('src', 'fileUpload/'+reviewList[i].saveFileName).css('width', '95%').css('height', '5em')
							)
							.css('vertical-align', 'middle')
						)
			.append(
					$('<td>').append(
							$('<a>').attr('href', '#')
									.attr('data-replyNo', reviewList[i].re_Num)
									.html(reviewList[i].re_Content)
							)
							.css('vertical-align', 'middle')
						)
			.append($('<td>').html(reviewList[i].id).css('vertical-align', 'middle').css('text-align', 'center'))
			.append($('<td>').html(reviewList[i].re_Date).css('vertical-align', 'middle').css('text-align', 'center'))
			.append($('<td>').html("★★★★★").css('vertical-align', 'middle').css('text-align', 'center'))
			.appendTo('#reviewListTbody')
		} // for
		
	});
} // loadReviewList


// 리뷰 삭제 함수.
function deleteReview(re_Num) {
	console.log("re_Num : ", re_Num);
	$.getJSON('/cooks/deleteReview.app?re_Num='+re_Num, function(data) {
		if(data.status == "success") {
			loadReplyList(0);
			
		} else 
			alert("삭제 실패");
	});
}

