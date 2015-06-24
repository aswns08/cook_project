package kr.co.cooks.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.cooks.vo.ReviewFileVO;
import kr.co.cooks.vo.ReviewVO;

public interface ReviewDao {

	public int totalSize() ;
	public List<?> getReviewList(HashMap<String, Object> paramMap);
	public void insertReview(ReviewVO reviewVO);
	public void insertFileUpload(ReviewFileVO reviewFileVO);
}
