package com.lyf.filmbase.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyf.filmbase.biz.BackendBiz;
import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;
import com.lyf.filmbase.mapper.CinemaMapper;
import com.lyf.filmbase.mapper.MovieMapper;
import com.lyf.filmbase.mapper.NewsMapper;
import com.lyf.filmbase.mapper.UserMapper;


  @Service(value="BackendBiz")
  public class BackendBizImpl implements BackendBiz{
	   @Autowired
	   private MovieMapper movieMapper;
	   @Autowired
	   private CinemaMapper cinemaMapper;
	   @Autowired
	   private NewsMapper newsMapper;
	   @Autowired
	   private UserMapper userMapper;
	 //后台添加影片
	@Override
	public int insertMovie(Movie record) {
		return movieMapper.insertSelective(record);
	}
	//后台添加影院
	@Override
	public int insertCinema(Cinema record) {
		return cinemaMapper.insertSelective(record);
	}
	//后台更新影片
	@Override
	public int updateMovie(Movie record) {
		return movieMapper.updateByPrimaryKeySelective(record);
	}
	//后台更新影院
	@Override
	public int updateCinema(Cinema record) {
		return cinemaMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public int insertNews(News record) {
		return newsMapper.insertNews(record);
	}
	@Override
	public List<News> selectNews() {
		return newsMapper.selectNews();
	}
	@Override
	public int deleteNews(String id) {
		return newsMapper.deleteNews(id);
	}
	@Override
	public int userDel(String userid) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(userid);
	}
	@Override
	public int cinemaDel(String cinemaid) {
		// TODO Auto-generated method stub
		return cinemaMapper.deleteByPrimaryKey(cinemaid);
	}
	@Override
	public int movieDel(String movieid) {
		// TODO Auto-generated method stub
		return movieMapper.deleteByPrimaryKey(movieid);
	}
}
