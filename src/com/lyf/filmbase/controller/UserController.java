package com.lyf.filmbase.controller;

import java.beans.Encoder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RespectBinding;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyf.filmbase.biz.UserBiz;
import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.util.DateUtil;
import com.lyf.filmbase.util.FileUploadUtil;
import com.lyf.filmbase.util.MD5Util;
import com.lyf.filmbase.util.VerifyCode;

@Controller
@RequestMapping(value="user")
public class UserController {
	@Autowired
	private UserBiz userBiz;

	
	// 实现登录
	@RequestMapping(value = "login")
	public String login(User user,boolean remname,String valistr,HttpSession session,HttpServletResponse resp,HttpServletRequest req) throws UnsupportedEncodingException {
		session.removeAttribute("pswSucMsg");//删除密码修改成功session
		session.removeAttribute("loginValiMsg");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", MD5Util.md5(user.getPassword())); //密码加密
        User loginUser = userBiz.selectLoginUser(paramMap);
        //判断验证码
        if(!valistr.equalsIgnoreCase((String) session.getAttribute("text"))) {
        	session.setAttribute("loginValiMsg", "验证码错误!");
        	return "user/login";
        }
		 if(loginUser == null ){
		session.setAttribute("loginMsg", "用户名或密码输入错误!");
		       return "user/login";
		 }else if(loginUser.getUsername().equals("admin")){
			 session.setAttribute("loginUser", loginUser);
			 return "redirect:/backend/manage.jsp";
		 }else{
		 // 登录成功返回
		 session.setAttribute("loginUser", loginUser);
		 session.removeAttribute("loginMsg");
		/* //记住用户名
		 if("remname"!=null && "true".equals("remname")){
			 Cookie cookie=new Cookie("remname",URLEncoder.encode("username","encode"));
			 cookie.setMaxAge(60*60*24*7);
			 cookie.setPath(req.getContextPath()+"/");
			 resp.addCookie(cookie);
		 }
		 //30天自动登录
		 if("true".equals("autologin")){
			 Cookie cookie=new Cookie("autologin",username#password));
			 cookie.setMaxAge(60*60*24*7*30);
			 cookie.setPath(req.getContextPath()+"/");
			 resp.addCookie(cookie);
		 }*/
		    return "default/index";
	}		 
	}
	// 注册
	@RequestMapping(value = "add")
	public String add(User user,String valistr,HttpSession session,HttpServletResponse resp,HttpServletRequest req) throws IOException {
		session.removeAttribute("loginValiMsg");
		user.setId(DateUtil.getId());
		user.setPassword(MD5Util.md5(user.getPassword()));
		int i = userBiz.insertSelective(user);
		if(!valistr.equals((String)session.getAttribute("text"))){
			  session.setAttribute("loginValiMsg","验证码错误！");
		}
		if (i == -1) {
			System.out.println("有人");
			session.setAttribute("registMsg","用户名已存在");
			return "user/regist";
		}else{
			System.out.println("没人");
			session.removeAttribute("registMsg");
			resp.setHeader("Content-Type","text/html;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
		    resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>恭喜您，注册成功！3秒后自动跳转登录页面</h1>");
			resp.setHeader("refresh", "3;url="+req.getContextPath()+"/user/login.jsp"); // 实现定时刷新+${pageContext.request.contextPth
			return null;
		}
		  
	}
	//验证码
	@RequestMapping(value = "valistr")
	public void valistr(HttpServletResponse resp,HttpServletRequest req) throws IOException{
		//验证码		
		// 2．调用工具类，生成验证码图片
		VerifyCode vc=new VerifyCode();
		// 3. 将生成的验证码图片存入response实体中
		vc.drawImage(resp.getOutputStream());
		// 4. 控制浏览器不要缓存验证码图片
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "no-cache");
		// 将生成的验证码的文本内容输出到控制台
		String text=vc.getCode();
		//将正确验证码文本传入Session作用域
		/*System.out.println(text);*/
		HttpSession session=req.getSession();
		session.setAttribute("text", text);
	}
	
	
    //退出登录
    @RequestMapping(value = "logout")
    public String logout(HttpSession session){
    	 User logoutUser = (User) session.getAttribute("loginUser");
    	 if(logoutUser != null){
    		 session.invalidate();//销毁用户绑定的session
    		/* session.removeAttribute("loginUser");*/
    		 return "redirect:/default/index.jsp";
    	 }
		     return "redirect:/default/index.jsp";
    }
    //查询个人信息
    @RequestMapping(value="selectUserInfo")
    public String selectUserInfo(User user,HttpSession session){
    	session.setAttribute("userInfo", userBiz.selectByPrimaryKey(user.getId()));
    	session.setAttribute("personalFlag", 2);
    	return "user/personal";
    }
    //个人信息更新
    @RequestMapping(value="updateUserInfo")
    public String updateUserInfo(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
    	User loginUser = (User) session.getAttribute("loginUser");
    	//头像上传
    	if(loginUser == null) {
    		session.setAttribute("errorMsg", "更新失败，请重新登录！");
    		return "1";
    	}
    	userBiz.updateUserInfo((User) FileUploadUtil.fileUpload(req, resp));
    	session.setAttribute("successMsg", "信息已更新！");
    	session.setAttribute("loginUser", userBiz.selectByPrimaryKey(loginUser.getId()));
    	return "user/information";
    }   
    @RequestMapping(value="intoUserPsw")
    public String intoUserPsw(User user,HttpSession session){
    	session.setAttribute("personalFlag", 3);
    	return "user/personal";
    }
    //修改密码
    @RequestMapping(value="updateUserPsw")
    public String updateUserPsw(String passwordOld,User user,HttpSession session,HttpServletResponse resp) throws IOException {
    	session.removeAttribute("updateUserPswMsg");
    	user.setPassword(MD5Util.md5(user.getPassword()));
    	User loginUser = (User) session.getAttribute("loginUser");
    	if(loginUser == null) {
    		session.setAttribute("personalFlag", 3);
            return "user/personal";
    	}
        if(!MD5Util.md5(passwordOld).equals(loginUser.getPassword())) {
        	session.setAttribute("updateUserPswMsg", "原密码输入错误!");
        	/*session.setAttribute("personalFlag", 3);*/
            return "user/info-setting";
        }else{
            userBiz.updateUserInfo(user);
            session.setAttribute("pswSucMsg", '2');
            session.setAttribute("loginUser", userBiz.selectByPrimaryKey(user.getId()));
            /*resp.setCharacterEncoding("utf-8"); 
            PrintWriter out=resp.getWriter(); 
            out.print("<script>alert('修改密码成功');</script>"); 
            out.print("<script>parent.location.href = 'user/info-setting';window.close();</script>");*/
            /*session.setAttribute("personalFlag", 3);*/
            return "user/info-setting";
        }
    }
  
}