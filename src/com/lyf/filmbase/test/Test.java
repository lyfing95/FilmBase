package com.lyf.filmbase.test;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.mapper.UserMapper;

public abstract class Test {
     public static void main(String[] args) {
		//读取spring容器信息
    	 ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml","spring_mvc.xml");
    	//获取spring容器中的mapper对象
    	//spring生成mapper对象的规则：类名首字母小写，就是mapper对象的ID
    	 UserMapper userMapper=(UserMapper)ac.getBean("userMapper");
    	 // User user =userMapper.selectByPrimaryKey("2018090801");
    	 Map<String,String> paramMap = new HashMap<String,String>();
    	 paramMap.put("userid","admin");
    	 paramMap.put("password","123456");
    	 User user = userMapper.selectLoginUser(paramMap);
    	 if(user == null)
    		  System.out.println("用户登录失败");
    	 else
    		 System.out.println("欢迎："+user.getNickname());
    	 //输出数据的结果
    	// System.out.println(user.getNickname());
	}
}