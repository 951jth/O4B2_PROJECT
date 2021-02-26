package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.ReviewDto;

public interface ReviewDao {
	public List<ReviewDto> getList(int num);
	public int getReviewCnt();
	public ReviewDto getContents(Integer r_num);
	public String getRfLists(Integer r_num);
	public ReviewDto reviewSelect(int r_num);
	public boolean reviewWrite(ReviewDto rd);
	public boolean fileInsert(Map<String, String> fmap);
	public boolean rDeleteProc(int r_num);
	public boolean updateReview(ReviewDto rv);
}
