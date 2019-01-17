package com.lyf.filmbase.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyf.filmbase.entity.Review;

public interface ReviewMapper {
	List<String> useridFromReview(String movieid); //查询选定的电影id查出对应的用户id
	List<String> pagingReview(@Param("start")int start,@Param("rows")Integer rows, @Param("movieid")String movieid); //评论分页
	List<String> selectReview(String movieid);
    int insert(Review record);

    int insertSelective(Review record);
	
}