package com.lyf.filmbase.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyf.filmbase.biz.BackendBiz;
import com.lyf.filmbase.biz.FilmBiz;
import com.lyf.filmbase.biz.UserBiz;
import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;
import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.util.DateUtil;
import com.lyf.filmbase.util.FileUploadUtil;



@Controller
@RequestMapping(value="backend")
public class BackendController {
    @Autowired
    private BackendBiz backendBiz;
    @Autowired
    private FilmBiz filmBiz;
    @Autowired
    private UserBiz userBiz;
    
    @RequestMapping(value = "backendIndexMovieDel")
    public String backendIndexMovieDel(HttpServletResponse resp,HttpServletRequest req,String movieid) {
    	int i =backendBiz.movieDel(movieid);
    	 return "redirect:backendIndexMovie.do";
   }
    @RequestMapping(value = "addWallet")
    public String backendCinemaDel(User user,HttpSession session,String userid,String addwallet,String oldwallet) {
    	System.out.println("现加有："+addwallet);
    	System.out.println("原有："+oldwallet);
    	int newwallet = Integer.parseInt(oldwallet)+Integer.parseInt(addwallet);
    	System.out.println(newwallet);
    	System.out.println(userid);
    	user.setWallet(newwallet);
    	user.setId(userid);
    	userBiz.updateUserInfo(user);
    	 return "redirect:backendGetAllUser.do";
   }
    /*@RequestMapping(value = "backendUserDel")
    public String backendUserDel(HttpServletResponse resp,HttpServletRequest req,String userid) {
    	int i =backendBiz.userDel(userid);
    	 return "redirect:backendGetAllUser.do";
   }*/
    @RequestMapping(value = "backendCinemaDel")
    public String backendCinemaDel(HttpServletResponse resp,HttpServletRequest req,String cinemaid) {
    	int i =backendBiz.cinemaDel(cinemaid);
    	 return "redirect:backendGetAllCinema.do";
   }
    @RequestMapping(value = "backendMovieDel")
    public String backendMovieDel(HttpServletResponse resp,HttpServletRequest req,String movieid) {
    	int i =backendBiz.movieDel(movieid);
    	 return "redirect:backendGetAllMovie.do";
   }
    @RequestMapping(value = "backendLogout")
    public String backendLogout(HttpSession session,HttpServletResponse resp) throws IOException{
    	 User logoutUser = (User) session.getAttribute("loginUser");
    	   session.invalidate();  ///销毁用户绑定的session
    		/* PrintWriter out=resp.getWriter(); 
    	    out.print("<script>parent.location.href = 'default/index.jsp';window.close();</script>");*/
    	   /*session.setAttribute("adminlogout", 0);*/
		    return "redirect:indexTest.jsp";
    }
    @RequestMapping(value = "relieveUser")
    public String relieveUser(User user){
    	user.setStatus("0");
    	userBiz.updateUserInfo(user);
    	return "forward:backendGetAllUser.do";
    }
    @RequestMapping(value = "limitUser")
    public String limitUser(User user,HttpSession session){
    	user.setStatus("1");
    	userBiz.updateUserInfo(user);
    	return "forward:backendGetAllUser.do";
    }
    @RequestMapping(value = "deleteUser")
    public String deleteUser(String id){
    	userBiz.deleteUser(id);
    	return "forward:backendGetAllUser.do";
    }
    @RequestMapping(value = "backendGetAllUser")
    public String backendGetAllUser(HttpSession session){
	    session.setAttribute("allUser", userBiz.selectAllUser());
	    return "backend/manageUser";
}
    @RequestMapping(value = "deleteNews")
    public String deleteNews(String id){
    	backendBiz.deleteNews(id);
    	return "forward:backendIndexMovie.do";
    }
    @RequestMapping(value = "insertNews")
    public String insertNews(HttpSession session,News news){
    	news.setId(DateUtil.getId());
    	String time = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date());
		news.setTime(Timestamp.valueOf(time));
    	 backendBiz.insertNews(news);
    	 return "forward:backendIndexMovie.do";
    }
  //后台更新首页热门影片
    @RequestMapping(value = "backendUpdateIndexHot")
    public String updateIndexHot(HttpSession session,String selectMovie){
    	List<Movie> hotMovie = filmBiz.selectHotMovie();
    	if(hotMovie.size()>8){
    		session.setAttribute("backendUpdateMsg", "首页热门影片已满,请删除后再添加!");
    		return "backend/manageIndexPage";
    	}else{
    	Movie movieIndexUpdate = filmBiz.selectMovieById(selectMovie);
    	if(movieIndexUpdate.getFlag().equals("0") || movieIndexUpdate.getFlag().equals("1")){
    		System.out.println("进入if");
    	    movieIndexUpdate.setFlag("2");
    		backendBiz.updateMovie(movieIndexUpdate);
    		return "forward:backendIndexMovie.do";
    	}else{
    		System.out.println("进入else");
    		session.setAttribute("backendUpdateMsg", "首页已存在!");
    		return "backend/manageIndexPage";
    	}
    	}
	 }
  //后台更新首页最新影片
    @RequestMapping(value = "backendUpdateIndexNewest")
    public String updateIndexNewest(HttpSession session,String selectMovie){
    	List<Movie> newestMovie = filmBiz.selectNewestMovie();
    	if(newestMovie.size()>8){
    		session.setAttribute("backendUpdateMsg", "首页最新热映已满,请删除后再添加!");
    		return "backend/manageIndexPage";
    	}else{
    	Movie movieIndexUpdate = filmBiz.selectMovieById(selectMovie);
    	if(movieIndexUpdate.getFlag().equals("0") || movieIndexUpdate.getFlag().equals("2")){
    	    movieIndexUpdate.setFlag("1");
    		backendBiz.updateMovie(movieIndexUpdate);
    		return "forward:backendIndexMovie.do";
    	}else{
    		session.setAttribute("backendUpdateMsg", "首页已存在!");
    		return "backend/manageIndexPage";
    	}
    	}
	 }
  // 后台首页影片设置
    @RequestMapping(value = "backendIndexMovie")
	public String indexMovie(HttpSession session,HttpServletResponse resp,HttpServletRequest req,String flag) throws IOException{
    	session.removeAttribute("backendUpdateMsg");
    	List<Movie> hotMovie = filmBiz.selectHotMovie();
		List<Movie> newestMovie = filmBiz.selectNewestMovie();
		List<Movie> allMovie = filmBiz.selectAllMovie();
		List<News> news = backendBiz.selectNews();
    	session.setAttribute("newestMovie", newestMovie);
		session.setAttribute("hotMovie", hotMovie);
		session.setAttribute("allMovie", allMovie);
		session.setAttribute("newsList", news);
    	return "backend/manageIndexPage";
	}
    /*//后台首页影片设置
    @RequestMapping(value="backendIndexMovie")
    public String indexMovie(HttpSession session){
    	List<Movie> allMovie = filmBiz.selectAllMovie();
    	session.setAttribute("allMovie", allMovie);
    	return "backend/manageIndexPage";
    }*/
    //后台更新影院
    @RequestMapping(value="backendUpdateCinema")
  public String updateCinema(HttpSession session,HttpServletResponse resp,HttpServletRequest req) throws ServletException, IOException{
    	Cinema cinema = FileUploadUtil.fileUpload(req, resp);
    	int i  = backendBiz.updateCinema(cinema);
  		if(i == 1){
  			session.setAttribute("updateCinema", filmBiz.selectCinemaById(cinema.getId()));
			//1)成功：提示成功信息，定时刷新
    		resp.setHeader("Content-Type","text/html;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>影院更新成功，返回影院列表...</h1>");
			resp.setHeader("refresh", "2;url="+req.getContextPath()+"/backend/backendGetAllCinema.do");
		}else{
			//2)失败：添加错误提示信息
			req.setAttribute("errMsg", "添加影片失败");
			req.getRequestDispatcher("manageUpdateCinema.jsp").forward(req, resp);
        }
		  return null;
    }
    //后台更新影片
    @RequestMapping(value="backendUpdateMovie")
  public String updateMovie(HttpSession session,HttpServletResponse resp,HttpServletRequest req) throws ServletException, IOException {
    	Movie movie = FileUploadUtil.fileUpload(req, resp);
    	int i  = backendBiz.updateMovie(movie);
    	System.out.println(i);
  		if(i == 1){
  			session.setAttribute("updateMovie", filmBiz.selectMovieById(movie.getId()));
			//1)成功：提示成功信息，定时刷新
    		resp.setHeader("Content-Type","text/html;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>影片更新成功，返回影视列表...</h1>");
			resp.setHeader("refresh", "2;url="+req.getContextPath()+"/backend/backendGetAllMovie.do");
		}else{
			//2)失败：添加错误提示信息
			req.setAttribute("errMsg", "添加影片失败");
			req.getRequestDispatcher("manageUpdateMovie.jsp").forward(req, resp);
        }
		  return null;
    }
    /*获取需要更新的影院信息*/
	@RequestMapping(value="backendGetCinema")
	public String getMovieInfo(Cinema cinema,HttpSession session,Map<String,Cinema> cinemaMap,String cinemaid) {
		Cinema cinemaInfo = filmBiz.selectCinemaById(cinemaid);
		cinemaMap.put("cinema", cinemaInfo);
		session.setAttribute("cinema", cinemaInfo);
			  return "backend/manageUpdateCinema";
	}	
    /*获取需要更新的影片信息*/
	@RequestMapping(value="backendGetMovie")
	public String getMovieInfo(Movie movie,HttpSession session,Map<String,Movie> movieMap,String movieid) {
		Movie movieInfo = filmBiz.selectMovieById(movieid);
		movieMap.put("movie", movieInfo);
		 session.setAttribute("movie", movieInfo);
			  return "backend/manageUpdateMovie";
	}	
  	 //后台添加影院
    @RequestMapping(value="backendAddCinema")
    public String manageAddCinema(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
    	int i = backendBiz.insertCinema((Cinema) FileUploadUtil.fileUpload(req, resp));
    	if(i == 1){
			//1)成功：提示成功信息，定时刷新到后台首页
    		resp.setHeader("Content-Type","text/html;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>影院上线成功，返回影院列表...</h1>");
			resp.setHeader("refresh", "2;url="+req.getContextPath()+"/backend/backendGetAllCinema.do");
		}else{
			//2)失败：添加错误提示信息，转发添加商品页面
			req.setAttribute("errMsg", "上线影院失败");
			req.getRequestDispatcher("manageAddCinema.jsp").forward(req, resp);
    }
		  return null;
    }
   
    //后台添加影片
    @RequestMapping(value="backendAddMovie")
    public String manageAddMovie(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
    	int i = backendBiz.insertMovie((Movie)FileUploadUtil.fileUpload(req, resp));
    	if(i == 1){
			//1)成功：提示成功信息，定时刷新到后台首页
    		resp.setHeader("Content-Type","text/html;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>影片添加成功，返回影视列表...</h1>");
			resp.setHeader("refresh", "2;url="+req.getContextPath()+"/backend/backendGetAllMovie.do");
		}else{
			//2)失败：添加错误提示信息，转发添加商品页面
			req.setAttribute("errMsg", "添加影片失败");
			req.getRequestDispatcher("manageAddMovie.jsp").forward(req, resp);
    }
		  return null;
    }
  //后台查询全部影院
    @RequestMapping(value="backendGetAllCinema")
    public String getAllCinema(HttpSession session) {
  		List<Cinema> allCinema = filmBiz.selectAllCinema();
  		session.setAttribute("allCinema", allCinema);
  		return "backend/manageCinemaList";
  	}
    //后台查询全部影片
    @RequestMapping(value="backendGetAllMovie")
  public String getAllMovie(HttpSession session,String type) {
  		/*List<Movie> allMovie = filmBiz.selectAllMovie();*/
  		session.setAttribute("allMovie", filmBiz.selectAllMovie());
  		 return "backend/manageMovieList";
  	} 
    
}