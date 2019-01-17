package com.lyf.filmbase.biz;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Mark;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;
import com.lyf.filmbase.entity.Orders;
import com.lyf.filmbase.entity.Review;
import com.lyf.filmbase.entity.Seat;
import com.lyf.filmbase.entity.User;
import com.lyf.filmbase.entity.WatchPlan;

public interface FilmBiz {
	List<String> selectSeatExist(Map<String,String> map);//已存在座位
	int updateOrdersStatus(Orders record);
  List<Movie> selectMark();
  Mark selectMovieMark(String movieid);
  List<Mark> selectMarkAll();
  List<Mark> selectMarkExist(Map<String,String> idMap);
  int insertMark(Mark record); //插入评分
  int deleteFailSeat(Orders seatid); //删除失效座位
  Orders selectFailSeat(String id);//查询失效座位id
  int deleteFailOrder(String id); //删除失效订单
  List<String> useridFromReview(String movieid); //查询选定的电影id查出对应的用户id
  Integer reviewTotalPage(Integer rows,String movieid); //查询评论总页数
  List<String> pagingReview(Integer currentPage, Integer rows,String movieid); //评论分页
  /*List<String> selectReview(String movieid);  //查询评论*/
  int insertReview(Review record);  //评论
  /*String selectWatchidByUserid(String id); //查询登录用户的查询订单封装成bean获取watchid 
*/  /*String selectCinemaForPersonalOrders(Map<String,String> map); //查询影院
*/ 
  List<Map<String,String>> selectOrdersSeat(String ordersid);//订单详情中的座位详情
  Map<String,Object> selectOrdersByOrdersid(String ordersid);//查询订单详情
  List<String> selectAllOrdersByUserid(String id);//查询所有订单详情
  Orders selectOrders(String id); //根据id查询订单信息
  List<Seat> selectSeat(String String); //查询选座信息
  int insertOdersTicket(Orders record);  //添加选座信息加进订单
  int insertSeat(Map<String,String> map); //添加座位
  List<Seat> selectedSeat(String seatid);//查询已选座位
  
  WatchPlan selectDateForWatchPlan(Map<String,String> map); //查询所选日期的排片计划
  List<String> selectWatchByIds(Map<String,String> map);//查询排片联查
  WatchPlan selectWatchPlanById(String watchPlanId);//查询所选影院排片计划
  List<String> selectWatchPlanKey(String cinemaid);//查询影院排片计划的id
  List<String> selectMovieForCinema(String cinemaid); //查询有此影院的影片id
  List<String> selectCinemaHasMovie(String movieid); //查询有此影片的影院id
  Cinema selectCinemaById(String id);  //根据影院id查询影片所在影院
  List<Cinema> selectAllCinema(); //查询全部影院
  Integer queryTotalPage(Integer rows); //查询影片总页数
  List<String> pagingMovie(Integer currentPage, Integer rows); //影片分页
  List<Movie> selectAllMovie(); //查询全部影片
  List<Movie> selectMovieSearch(String search); //搜索影片
  List<Cinema> selectCinemaSearch(String search); //搜索影院
  News selectNewsInfo(String id);//查询用户选定的资讯内容
  Movie selectMovieById(String id); //查询影片信息
  List<Movie> selectNewestMovie(); // 查询首页最新影片
  List<Movie> selectHotMovie(); //查询首页热门影片
 }