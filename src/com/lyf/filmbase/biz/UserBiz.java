package com.lyf.filmbase.biz;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import com.lyf.filmbase.entity.User;

public interface UserBiz {
	 int deleteUser(String id);
	List<User> selectAllUser();
   String selectReviewUser(String userid); //查询评论用户信息
   public User selectLoginUser(Map map); //实现登录
   public int insertSelective(User user); //实现注册
   /*User selecRegistUser(String username);*/
   public int updateUserInfo(User user);//个人信息修改
   User selectByPrimaryKey(String id); 
}
