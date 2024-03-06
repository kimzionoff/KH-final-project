package com.myedumyselect.matching.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface MatchingBoardDAO {
	
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo);
	//public int mPublicUpload(MatchingBoardVO mbVO);

	public List<MatchingBoardVO> mResult(MatchingBoardVO mbVO);
	
}