package com.lyf.filmbase.mapper;

import java.util.List;
import java.util.Map;


import com.lyf.filmbase.entity.CinemaPlan;

public interface CinemaPlanMapper {
	
	/*String selectCinemaForPersonalOrders(Map<String,String> map); //查询影院
*/    List<String> selectWatchPlanKey(String cinemaid); // 查询影片排片计划的id
    List<String> selectCinemaHasMovie(String movieid); //查询有此影片的影院id
    List<String> selectMovieForCinema(String cinemaid); //查询有此影院的影片id
	int insert(CinemaPlan record);

    int insertSelective(CinemaPlan record);
}
