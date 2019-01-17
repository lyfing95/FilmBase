package com.lyf.filmbase.mapper;

import java.util.List;
import java.util.Map;

import com.lyf.filmbase.entity.Mark;

public interface MarkMapper {
	Mark selectMovieMark(String movieid);
	List<Mark> selectMarkAll();
	List<Mark> selectMarkExist(Map<String,String> idMap);
	 int insertMark(Mark record);
}
