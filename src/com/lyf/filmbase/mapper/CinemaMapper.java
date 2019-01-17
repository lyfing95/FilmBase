package com.lyf.filmbase.mapper;

import java.util.List;

import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Movie;

public interface CinemaMapper {
	List<Cinema> selectAllCinema(); //全部影院
	List<Cinema> selectCinemaSearch(String search); //搜索影院
	
    int deleteByPrimaryKey(String id);

    int insert(Cinema record);

    int insertSelective(Cinema record);

    Cinema selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Cinema record);

    int updateByPrimaryKey(Cinema record);
}