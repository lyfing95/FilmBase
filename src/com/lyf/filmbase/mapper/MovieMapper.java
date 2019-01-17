package com.lyf.filmbase.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyf.filmbase.entity.Movie;

public interface MovieMapper {
	List<Movie> selectMark();
	List<Movie> selectNewestMovie(); // 查询首页最新影片
	List<Movie> selectHotMovie(); //查询首页热门影片
    Integer selectMovieCount(); //查询影片总数
    List<String> pagingMovie(@Param("start")int start,@Param("rows")Integer rows); //影片分页
	List<Movie> selectAllMovie(); //查询全部影片
	List<Movie> selectMovieSearch(String search); //搜索影片
	
    int deleteByPrimaryKey(String id);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);
}