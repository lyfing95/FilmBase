package com.lyf.filmbase.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyf.filmbase.biz.UserBiz;
import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.mapper.UserMapper;
import com.lyf.filmbase.util.MD5Util;
@Service(value="UserBiz")
public class UserBizImpl implements UserBiz{
  @Autowired
   private UserMapper userMapper;
//登录方法
   @Override
    public User selectLoginUser(Map map) {
		// TODO Auto-generated method stub
		return userMapper.selectLoginUser(map);
	}
   //注册方法
   public int insertSelective(User user){
	/*Map <String,String> paramMap= new HashMap<String,String>();
    paramMap.put("username", user.getUsername());
    paramMap.put("password", MD5Util.md5(user.getPassword()));
    paramMap.put("email", user.getEmail());
    paramMap.put("nickname", user.getNickname());*/
	User checkuser = userMapper.selecRegistUser(user.getUsername());
     if(checkuser!=null) {
    	 System.out.println("imp有人");
    	  return -1;
    }else{
    	System.out.println("imp没人可注册");
    	 return userMapper.insertSelective(user);
    }
   }
   //个人信息修改
@Override
public int updateUserInfo(User user) {
	return userMapper.updateByPrimaryKeySelective(user);
}
@Override
public User selectByPrimaryKey(String id) {
    return userMapper.selectByPrimaryKey(id);
}
 //查询评论用户信息
@Override
public String selectReviewUser(String userid) {
	return userMapper.selectReviewUser(userid);
}
@Override
public List<User> selectAllUser() {
	return userMapper.selectAllUser();
}
@Override
public int deleteUser(String id) {
	return userMapper.deleteByPrimaryKey(id);
}


  
    
    
}
