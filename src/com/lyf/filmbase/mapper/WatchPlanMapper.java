package com.lyf.filmbase.mapper;



import java.util.List;
import java.util.Map;

import com.lyf.filmbase.entity.WatchPlan;

public interface WatchPlanMapper {
	List<String> selectWatchByIds(Map<String,String> map);
    //查询所选日期的排片计划
	WatchPlan selectDateForWatchPlan(Map map);
	
	int deleteByPrimaryKey(String id);

    int insert(WatchPlan record);

    int insertSelective(WatchPlan record);

    WatchPlan selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WatchPlan record);

    int updateByPrimaryKey(WatchPlan record);
}
