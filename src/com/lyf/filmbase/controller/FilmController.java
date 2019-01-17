package com.lyf.filmbase.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyf.filmbase.biz.BackendBiz;
import com.lyf.filmbase.biz.FilmBiz;
import com.lyf.filmbase.biz.UserBiz;
import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Mark;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;
import com.lyf.filmbase.entity.Orders;
import com.lyf.filmbase.entity.Review;
import com.lyf.filmbase.entity.Seat;
import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.entity.WatchPlan;
import com.lyf.filmbase.util.DateUtil;
import com.lyf.filmbase.util.ImgUtil;
import com.lyf.filmbase.util.Page;

import net.sf.json.JSONObject;


@Controller
@RequestMapping(value = "film")
public class FilmController {
	@Autowired
	private FilmBiz filmBiz;	
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private BackendBiz backendBiz;
	@Resource
	private PlatformTransactionManager transactionManager;
	
	
	//评分
	@RequestMapping(value="mark")
	public String mark(Mark mark,HttpSession session,Movie movie){
		Map<String,String> idMap = new HashMap<String,String>();
		idMap.put("userid", mark.getUserid());
		idMap.put("movieid", mark.getMovieid());
		List<Mark> HasMovieid = filmBiz.selectMarkExist(idMap);
		if(HasMovieid.isEmpty()){
		   filmBiz.insertMark(mark);
	       Mark averageMark = filmBiz.selectMovieMark(mark.getMovieid());
	       movie.setId(averageMark.getMovieid());
		   movie.setMark(averageMark.getMark());
		   backendBiz.updateMovie(movie);
		}else{
			session.setAttribute("markMsg", "1");
		}
		session.setAttribute("thisMovieid", mark.getMovieid());
		return "redirect:getMovieInfo.do";
	}
	//订单失效处理
	@RequestMapping(value = "orderFail")
	public String orderFail(String id){
		filmBiz.deleteFailSeat(filmBiz.selectFailSeat(id));
		filmBiz.deleteFailOrder(id);
			return "default/index";
		}
	//新增评论
	@RequestMapping(value = "review")
	public String review(Review review,HttpSession session,Integer currentPage,Integer rows){
		    Date time = new Date();
			review.setTime(time);
			filmBiz.insertReview(review);
			session.setAttribute("thisMovieid", review.getMovieid());
		    return "redirect:getMovieInfo.do";
	}
	//订单详情
	@RequestMapping(value = "ticketInfo")
	public String ticketInfo(HttpSession session,String id){
		Map<String,Object> ordersMap = filmBiz.selectOrdersByOrdersid(id);//获取订单信息
		List<Map<String,String>> ordersSeat = filmBiz.selectOrdersSeat(id);
		System.out.println(ordersSeat.size());
		session.setAttribute("ordersDetails", ordersMap);
		session.setAttribute("ordersSeat", ordersSeat);
		return "film/ticketInfo";
		}
	/*@RequestMapping(value = "ticketInfo")
	public String ticketInfo(HttpSession session,Orders orders){
		String ordersid = orders.getId();
		List<String> ordersDetails = filmBiz.selectOrdersByOrdersid(ordersid);//获取订单信息
		session.setAttribute("ordersDetails", ordersDetails);
		
		return "film/ticketInfo";
		}*/
	//结算
	 @RequestMapping(value = "pay")
	 public String ticketPay(HttpSession session,String wallet,String payment,String ordersid,Orders orders){
		 orders.setId(ordersid); 
		 orders.setStatus("1");
		 filmBiz.updateOrdersStatus(orders);
		 User user = (User) session.getAttribute("loginUser");
			int newWallet = Integer.parseInt(wallet) - Integer.parseInt(payment);
			user.setWallet(newWallet);
			user.setId(user.getId());
			userBiz.updateUserInfo(user);//更新用户影币
		return "redirect:personalOrders.do";
	 }
	//支付完成处理--查询登录用户所有订单
	@RequestMapping(value = "personalOrders")
	public String personalOrders(HttpSession session){
		User user = (User) session.getAttribute("loginUser");
		List<String> allOrders = filmBiz.selectAllOrdersByUserid(user.getId());//获取订单信息
		session.setAttribute("allOrders", allOrders);
		session.setAttribute("personalFlag",1);
    	return "user/personal";
	}
	//下单
	@RequestMapping(value = "ticketConfirm")
	public String ticketConfirm(HttpSession session,Seat seat,Orders orders){
		String thisOrdersid = (String) session.getAttribute("thisOrdersid");
		String thisSeatid = (String) session.getAttribute("thisSeatid");
		System.out.println("订单号获取"+thisOrdersid);
		session.removeAttribute(thisOrdersid);   //删除当前session中的订单id，确保session中每次都只有一条订单号
		session.removeAttribute(thisSeatid);
		session.setAttribute("seatList", filmBiz.selectSeat(thisSeatid));
		session.setAttribute("ordersInfo", filmBiz.selectOrders(thisOrdersid));
		return "film/ticketConfirm";
	}
	//选座+形成预定单
	@RequestMapping(value = "seatChoose")
	public synchronized String seatChoose(String existSeatid,String watchid,String total,String seats,String count,Orders orders,Seat seat,String userid,HttpSession session){
		session.removeAttribute("seatExist");
		DefaultTransactionDefinition defaultTransactionDefinition = new DefaultTransactionDefinition();
	    defaultTransactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
	    TransactionStatus status = transactionManager.getTransaction(defaultTransactionDefinition);
	
	try{
		String seatid = DateUtil.getId();
		String planid = watchid;
		//处理选座参数
		String seatx = null;
		String seaty = null;
		String[] selectSeat = seats.split("__");
		//将座位信息加入订单
				String time = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date());
				orders.setTime(Timestamp.valueOf(time));
				String thisOrdersid = DateUtil.getId();
				orders.setId(thisOrdersid);
				orders.setUserid(userid);
				orders.setSeatid(seatid);
				orders.setWatchid(orders.getWatchid());
				orders.setPayment(Integer.parseInt(total));
				orders.setNumber(Integer.parseInt(count));
	    //处理选座信息
		Map<String,String> seatMap = new HashMap<String,String>();
		Map<String,String> noSeatMap = new HashMap<String,String>();
		for(int i =0;i<(selectSeat.length)/2;i++){
			String[] seatGroup = new String[2];
			for(int j =0;j<2;j++){
			    seatGroup[j] = selectSeat[j+i*2];
				if(j%2==0){
					seatx = seatGroup[j];
				}else{
					seaty = seatGroup[j];
				}
			}
			     seatMap.put("seatid", seatid);
			     seatMap.put("seatx", seatx);
			     seatMap.put("seaty", seaty);
			     seatMap.put("planid", planid);
			    /* noSeatMap.put("seatx", seatx);
			     noSeatMap.put("planid", planid);
			     List<String> seatExist = filmBiz.selectSeatExist(noSeatMap);
			     if(seatExist.size()!=0){
			    	 session.setAttribute("seatExist", "1");
			    	 List<Seat> selectedSeatList = filmBiz.selectedSeat(existSeatid);
			    	 session.setAttribute("selectedSeat", selectedSeatList);
			         return "film/seatChoose";
			     }*/
			     filmBiz.insertSeat(seatMap);  //控制
			}
		filmBiz.insertOdersTicket(orders);   //控制
		session.setAttribute("thisOrdersid", thisOrdersid);
		session.setAttribute("thisSeatid", seatid);
		transactionManager.commit(status);
        /*System.out.println("======制造一个运行时异常aa======");
        System.out.println("运行时异常："+100/0);*/
		 System.out.println("事物成功");
	}catch(Exception e){
        transactionManager.rollback(status);
        e.printStackTrace();
        System.out.println("事物失败，回滚");
	}
	if(total != null){
			return "film/seatChoose";
		}
		    return null;
	}
	//查询所选排片的排片信息+座位剩余
	@RequestMapping(value = "cinemaSelectPlan")
	 public String cinemaSelectPlan(HttpSession session,String id){
		WatchPlan watchplan = filmBiz.selectWatchPlanById(id);
		System.out.println("座位id:"+watchplan.getSeatid());
		session.setAttribute("watchplan",watchplan);
		List<Seat> selectedSeatList = filmBiz.selectedSeat(watchplan.getSeatid());
		System.out.println(selectedSeatList);
		session.setAttribute("selectedSeat", selectedSeatList);
		return "film/seatChoose";
	}
	//查询所选日期的排片计划
	@RequestMapping(value = "watchDateForPlan")
	public String watchDateForPlan(HttpSession session,WatchPlan watchplan,String date,String movieid){
		Map<String,String> planMap = new HashMap<String,String>();
		/*WatchPl*/
		planMap.put("date", date);
		planMap.put("movieid", watchplan.getMovieid());
		session.setAttribute("watchPlanDate", filmBiz.selectDateForWatchPlan(planMap));
		return "film/cinemaPlan";
	}
	
	//查询所选影院的此影片排片计划信息(!!)
	@RequestMapping(value = "cinemaPlan")
	public String CinemaPlan(HttpSession session,String movieid,String cinemaid){
		Map<String,String> selectWatchIdsMap = new HashMap<String,String>();
		selectWatchIdsMap.put("movieid", movieid);
		selectWatchIdsMap.put("cinemaid", cinemaid);
		List<String> watchPlan = filmBiz.selectWatchByIds(selectWatchIdsMap);
		session.setAttribute("cinema", filmBiz.selectCinemaById(cinemaid)); //影院id
		/*List<String> watchPlanIds = filmBiz.selectWatchPlanKey(id);
		List<WatchPlan> watchPlan = new ArrayList<>();
		for(String watchPlanId : watchPlanIds){
			watchPlan.add(filmBiz.selectWatchPlanById(watchPlanId));
		}*/
		session.setAttribute("watchPlanInfo",watchPlan);
		return "film/cinemaPlan";
	}
	//查询有此影院的影片
			@RequestMapping(value="movieForCinema")
			public String movieForCinema(HttpSession session,String cinemaid,Map<String,Cinema> cinemaMap){
				List<String> movieIds = filmBiz.selectMovieForCinema(cinemaid);
				List<Movie> movieHasCinema = new ArrayList<>();
				for(String id : movieIds){
					movieHasCinema.add(filmBiz.selectMovieById(id));
				}
				Cinema cinemaInfo = filmBiz.selectCinemaById(cinemaid);
				cinemaMap.put("cinema", cinemaInfo);
				session.setAttribute("cinemaInfo", cinemaInfo);
				session.setAttribute("movieHasCinema", movieHasCinema);
				return "film/cinemaHasMovie";
			}
	//查询有此影片的影院	
	@RequestMapping(value = "CinemaHasMovie")
	public String CinemaHasMovie(HttpSession session,Movie movie,Map<String,Movie> movieMap) {
		List<String> cinemaIds = filmBiz.selectCinemaHasMovie(movie.getId());
		List<Cinema> cinemaHasMovie = new ArrayList<>();
		for(String id : cinemaIds){
			/*if(filmBiz.selectCinemaById(id)!= null)*/
			cinemaHasMovie.add(filmBiz.selectCinemaById(id));
		}
		Movie movieInfo = filmBiz.selectMovieById(movie.getId());
		movieMap.put("movie", movieInfo);
		session.setAttribute("movie", movieInfo);
		session.setAttribute("cinemaHasMovie", cinemaHasMovie);
		return "film/cinema";
	}
	//查询全部影院
		@RequestMapping(value = "getAllCinema")
		public String getAllCinema(HttpSession session) {
			List<Cinema> allCinema = filmBiz.selectAllCinema();
			session.setAttribute("allCinema", allCinema);
			return "film/cinemaList";
		}
	//页面分页处理
		@RequestMapping("moviePage")
		public String queryProducts(Integer currentPage,Integer rows,HttpSession session){
			session.removeAttribute("searchMsg");
			session.removeAttribute("movieSearch");
			List<String> movieList=filmBiz.pagingMovie(1, 10);
			Integer totalPage=filmBiz.queryTotalPage(10);
			Page page=new Page();
			page.setObjectList(movieList);
			page.setCurrentPage(currentPage);
			page.setTotalPage(totalPage);
			session.setAttribute("page", page);
			return "film/movieList";
		}
	//查询全部影片
	@RequestMapping(value = "getAllMovie")
	public String getAllMovie(HttpSession session) {
		List<Movie> allMovie = filmBiz.selectAllMovie();
		session.setAttribute("allMovie", allMovie);
		return "film/movieList";
	}
	//读取本地图片
	@RequestMapping(value = "getFileImg")
	public OutputStream getFileImg(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		OutputStream movieImg = ImgUtil.getFileImg(req, resp);
		return movieImg;
	}
	 //影视/影院搜索
	@RequestMapping(value = "filmSearch")
	public String filmSearch(Map<String, Movie> movieSearchMap,Map<String,Cinema> cinemaSearchMap,String searchText,HttpSession session) {
		session.removeAttribute("searchMsg");
		session.removeAttribute("page");
		session.removeAttribute("movieSearch");
		List<Movie> movieSearch = filmBiz.selectMovieSearch(searchText); 
		List<Cinema> cinemaSearch = filmBiz.selectCinemaSearch(searchText); 
		if(movieSearch.size() != 0 && cinemaSearch.size() != 0 ){
			session.removeAttribute("page");
			session.removeAttribute("searchMsg");
			session.setAttribute("movieSearch", movieSearch);
			return "film/movieList";
		}else if(movieSearch.size() != 0){
			session.removeAttribute("page");
			session.removeAttribute("searchMsg");
			session.setAttribute("movieSearch", movieSearch);
			return "film/movieList";
		}else if(cinemaSearch.size() != 0 ){
			   session.removeAttribute("allCinema");
			   session.setAttribute("cinemaSearch", cinemaSearch);
			     return "film/cinemaList";
		
		}else/* if(newsSearch != null){
			   session.removeAttribute("searchMsg");
			   session.setAttribute("newsSearch", newsSearch);
		        return "film/news";
		}else*/
			if(searchText.contains("电影")||searchText.contains("影视")||searchText.contains("影片")){
				  return "redirect:moviePage.do";
				}else{
			   session.setAttribute("searchMsg", "很抱歉，没找到与您搜索有关的内容! 请尝试更换关键字");
					return "film/movieList";
			}
		}
	

	/*获取用户选定的影片信息+评论分页处理*/
	@RequestMapping(value="getMovieInfo")
	public String getMovieInfo(Mark mark,String flag,String movieid,HttpSession session,Map<String,Movie> movieMap,Review review,Integer currentPage,Integer rows) {
		session.removeAttribute("reviewFlag");
		session.setAttribute("markMsg",'2');
		String movieid2 = (String) session.getAttribute("thisMovieid"); //获取用户评论后刷新页面的movieid
		session.removeAttribute("thisMovieid");
		String realMovieid;
		Integer realCurrentPage;
		Integer realRows;
		if(movieid2 != null){  
			realMovieid = movieid2;
			realCurrentPage = 1;
			realRows = 5;
		}else{
			realMovieid = movieid;
			realCurrentPage = currentPage;
			realRows = rows;
		}
		Movie movieInfo = filmBiz.selectMovieById(realMovieid);
		movieMap.put("movie", movieInfo);
		session.setAttribute("movie", movieInfo);
		List<String> reviewList = filmBiz.pagingReview(realCurrentPage, realRows,realMovieid); //查询评论
		 Integer totalPage=filmBiz.reviewTotalPage(realRows,realMovieid);
				Page page=new Page();
				page.setObjectList(reviewList);
				page.setCurrentPage(realCurrentPage);
				page.setTotalPage(totalPage);
				session.setAttribute("page", page);
				session.setAttribute("reviewFlag", flag);
				//验证是否评分
				Map<String,String> idMap = new HashMap<String,String>();
				User user = (User) session.getAttribute("loginUser");
				if (user!=null){
					idMap.put("userid", user.getId());
					idMap.put("movieid",realMovieid);
					List<Mark> HasMark = filmBiz.selectMarkExist(idMap);
					if(HasMark.size()==0){
					session.setAttribute("markMsg", "1");
					return "film/movie";
					}
				}
				return "film/movie";
		 }	
	//获取用户选定的资讯内容
	@RequestMapping(value="newsInfo")
	 public String newsInfo(HttpSession session,String id,String newsFlag){
		session.setAttribute("news", filmBiz.selectNewsInfo(id));
		session.setAttribute("newsFlag", newsFlag);
		return "film/news";
	}
	//查询首页 热映/最新 影片
		@RequestMapping(value = "indexMovie")
		public String indexMovie(HttpSession session,HttpServletResponse resp,HttpServletRequest req,String flag) throws IOException{
			List<Movie> hotMovie = filmBiz.selectHotMovie();
			List<Movie> newestMovie = filmBiz.selectNewestMovie();
			List<News> news = backendBiz.selectNews();
			List<Movie> markList = filmBiz.selectMark();
			session.setAttribute("newsList", news);
			session.setAttribute("newestMovie", newestMovie);
			session.setAttribute("hotMovie", hotMovie);
			session.setAttribute("markList", markList);
			if(hotMovie == null || newestMovie ==null){
				resp.setHeader("Content-Type","text/html;charset=UTF-8");
				resp.setCharacterEncoding("utf-8");
			    resp.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>请联系网站管理人员进行维护! 正在处理...</h1>");
				resp.setHeader("refresh", "3;url="+req.getContextPath()+"/backend/manage.jsp"); 
			}else{
			session.setAttribute("indexFlag", "indexFlag");
			   return "default/index";
			}
			   return null;
		}
	
}
