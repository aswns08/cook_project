package kr.co.cooks.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import kr.co.cooks.dao.ReviewDao;
import kr.co.cooks.vo.ReviewFileVO;
import kr.co.cooks.vo.ReviewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Service
public class ReviewService {
	
	@Autowired ReviewDao reviewDao ;
	
	public int getEndPageNum(int pageSize) {
		
		int totalSize = reviewDao.totalSize();
		int endPageNum = totalSize / pageSize;
		
		if( (totalSize % pageSize) > 0 )
			endPageNum++;
		
		return endPageNum;
	}
	
	public List<?> getReviewList(int pageNum, int pageSize) {
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("startRow", ((pageNum-1) * pageSize) );
		paramMap.put("pageSize", pageSize);
		
		return reviewDao.getReviewList(paramMap);
		
	}
	
	public void insertReview(ReviewVO reviewVO, MultipartHttpServletRequest multipartReq) {
		
		reviewDao.insertReview(reviewVO);
		
		String realPath = "/Users/SongMJ/Documents/cooksUpload/";
		
		File dir = new File(realPath);
		
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		List<MultipartFile> multiFile = multipartReq.getFiles("re_Fname");
		Iterator<MultipartFile> iterator = multiFile.iterator();
		
		while(iterator.hasNext()) {
			MultipartFile uploadFile = iterator.next();
			String originFileName = uploadFile.getOriginalFilename();
			String saveFileName = originFileName;
			long fileSize = uploadFile.getSize();
			
			if(!originFileName.isEmpty()) {
				if(new File(realPath + originFileName).exists()) {
					saveFileName = originFileName + "_" +System.currentTimeMillis();
				}
				
				ReviewFileVO reviewFileVO = new ReviewFileVO();
				reviewFileVO.setOriginFileName(originFileName);
				reviewFileVO.setSaveFileName(saveFileName);
				reviewFileVO.setFileSize(fileSize);
				
				reviewDao.insertFileUpload(reviewFileVO);
				
				try{
					uploadFile.transferTo(new File(realPath + saveFileName));
				} catch(Exception e) {
					e.printStackTrace();
				} // catch
			} // if
			
		} // while
		
	} // insertReview()
	
	
	

}
