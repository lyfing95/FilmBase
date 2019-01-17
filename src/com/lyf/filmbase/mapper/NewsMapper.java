package com.lyf.filmbase.mapper;

import java.util.List;

import com.lyf.filmbase.entity.News;

public interface NewsMapper {
	News selectNewsInfo(String id);
	int deleteNews(String id);
	List<News> selectNews();
   int insertNews(News record);
}
