package com.lyf.filmbase.mapper;

import java.util.List;
import java.util.Map;

import com.lyf.filmbase.entity.User;

public interface UserMapper {
	List<User> selectAllUser();
	String selectReviewUser(String userid); //查询评论用户信息
	public User selectLoginUser(Map map);//登录方法
    int deleteByPrimaryKey(String id);
    User selecRegistUser(String username);
    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
}