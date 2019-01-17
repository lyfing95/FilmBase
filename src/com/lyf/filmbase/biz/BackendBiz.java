package com.lyf.filmbase.biz;

import java.util.List;

import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;

public interface BackendBiz {
	int userDel(String userid);
	int cinemaDel(String cinemaid);
	int movieDel(String movieid);
	int deleteNews(String id);
	List<News> selectNews();
	int insertNews(News record);
	int updateCinema(Cinema record); //后台更新影院
	int updateMovie(Movie record); //后台更新影片
	int insertCinema(Cinema record); //后台添加影院
	int insertMovie(Movie record); //后台添加影片

}
