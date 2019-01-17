package com.lyf.filmbase.biz.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lyf.filmbase.biz.FilmBiz;
import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Mark;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.News;
import com.lyf.filmbase.entity.Orders;
import com.lyf.filmbase.entity.Review;
import com.lyf.filmbase.entity.Seat;
import com.lyf.filmbase.entity.WatchPlan;
import com.lyf.filmbase.mapper.CinemaMapper;
import com.lyf.filmbase.mapper.CinemaPlanMapper;
import com.lyf.filmbase.mapper.MarkMapper;
import com.lyf.filmbase.mapper.MovieMapper;
import com.lyf.filmbase.mapper.MoviePlanMapper;
import com.lyf.filmbase.mapper.NewsMapper;
import com.lyf.filmbase.mapper.OrdersMapper;
import com.lyf.filmbase.mapper.ReviewMapper;
import com.lyf.filmbase.mapper.SeatMapper;
import com.lyf.filmbase.mapper.WatchPlanMapper;

@Service(value = "MovieBiz")
public class FilmBizImpl implements FilmBiz {
	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private CinemaMapper cinemaMapper;
	@Autowired
	private MoviePlanMapper moviePlanMapper;
	@Autowired
	private WatchPlanMapper watchPlanMapper;
	@Autowired
	private CinemaPlanMapper cinemaPlanMapper;
	@Autowired
	private SeatMapper seatMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private MarkMapper markMapper;
    
	// 查询首页最新影片
		@Override
		public List<Movie> selectNewestMovie() {
			return movieMapper.selectNewestMovie();
		}
		//查询首页热门影片
		@Override
		public List<Movie> selectHotMovie() {
			return movieMapper.selectHotMovie();
		}
	// 通过id获取影片信息
	@Override
	public Movie selectMovieById(String id) {
		// TODO Auto-generated method stub
		return movieMapper.selectByPrimaryKey(id);
	}
	// 查询全部影片
	@Override
	public List<Movie> selectAllMovie() {
		// TODO Auto-generated method stub
		return movieMapper.selectAllMovie();
	}
    //影片分页查询
	public List<String> pagingMovie(Integer currentPage, Integer rows) {
		//处理业务逻辑,page变成start,
			if(currentPage<=0){
				currentPage=1;
				}
			int start=(currentPage-1)*rows;//最小是0
			List<String> movieList=movieMapper.pagingMovie(start,rows);
			return movieList;
		}
	//查询影片总页数
	@Override
	public Integer queryTotalPage(Integer rows) {
		/*int total=movieMapper.selectMovieCount();*/
		List<Movie> movieAllList = movieMapper.selectAllMovie();
		int total = movieAllList.size();
		//利用total和rows计算总页数totalPage
		int totalPage=total%rows==0?(total/rows):((total/rows)+1);
		return totalPage;
	}
	// 查询全部影院
	@Override
	public List<Cinema> selectAllCinema() {
		return cinemaMapper.selectAllCinema();
	}

	// 搜索影片
	@Override
	public List<Movie> selectMovieSearch(String search) {
		return movieMapper.selectMovieSearch(search);
	}
    // 搜索影院
	@Override
	public List<Cinema> selectCinemaSearch(String search) {
		return cinemaMapper.selectCinemaSearch(search);
	}
    //查询有此影片的影院id	
	@Override
	public List<String> selectCinemaHasMovie(String movieid) {
		return cinemaPlanMapper.selectCinemaHasMovie(movieid);
	}
	//根据影院id查询影片所在影院
	@Override
	public Cinema selectCinemaById(String id) {
		return cinemaMapper.selectByPrimaryKey(id);
	}
    //查询影院排片计划的id
	@Override
	public List<String> selectWatchPlanKey(String cinemaid) {
		return cinemaPlanMapper.selectWatchPlanKey(cinemaid);
	}
	//根据排片计划id查询排片计划
	public WatchPlan selectWatchPlanById(String watchPlanId){
		return watchPlanMapper.selectByPrimaryKey(watchPlanId);
	}
	//查询排片联查
	@Override
	public List<String> selectWatchByIds(Map<String, String> map) {
		return watchPlanMapper.selectWatchByIds(map);
	}
	//查询所选日期的排片计划
	@Override
	public WatchPlan selectDateForWatchPlan(Map<String,String> map) {
		return watchPlanMapper.selectDateForWatchPlan(map);
	}
	//查询已选座位
	@Override
	public List<Seat> selectedSeat(String seatid) {
		return seatMapper.selectedSeat(seatid);
	}
	//添加座位
	@Override
	
	public int insertSeat(Map<String,String> map) {
		return seatMapper.insertSelective(map);
	}
	//添加选座信息加进订单
	@Override
	public int insertOdersTicket(Orders record) {
		return ordersMapper.insertSelective(record);
	}
	//查询订单信息
	@Override
	public Orders selectOrders(String id) {
		return  ordersMapper.selectByPrimaryKey(id);
	}
	//查询选座信息
	@Override
	public List<Seat> selectSeat(String seatid) {
		return seatMapper.selectSeat(seatid);
	}
	//查询订单详情
	@Override
	public Map<String,Object> selectOrdersByOrdersid(String ordersid) {
		return ordersMapper.selectOrdersByOrdersid(ordersid);
	}
	//查询所有订单详情
	@Override
	public List<String> selectAllOrdersByUserid(String id) {
		return ordersMapper.selectAllOrdersByUserid(id);
	}
	/*//查询影院
	@Override
	public String selectCinemaForPersonalOrders(Map<String, String> map) {
		return cinemaPlanMapper.selectCinemaForPersonalOrders(map);
	}*/
	/*//查询登录用户的查询订单封装成bean获取watchid 
	@Override
	public String selectWatchidByUserid(String id) {
		return ordersMapper.selectWatchidByUserid(id);
	}*/
	//评论
	@Override
	public int insertReview(Review record) {
		return reviewMapper.insert(record);
	}
	/*//查询评论
	@Override
	public List<String> selectReview(String movieid) {
		return reviewMapper.selectReview(movieid);
	}*/
	//评论分页查询
			public List<String> pagingReview(Integer currentPage, Integer rows,String movieid) {
				System.out.println("imp电影id"+movieid);
				//处理业务逻辑,page变成start,
					if(currentPage<=0){
						currentPage=1;
						}
					int start=(currentPage-1)*rows;//最小是0
					List<String> reviewList=reviewMapper.pagingReview(start,rows,movieid);
					System.out.println("查出首页的评论数"+reviewList.size());
					return reviewList;
				}
			//查询评论总页数
			@Override
			public Integer reviewTotalPage(Integer rows,String movieid) {
				List<String> reviewAllList = reviewMapper.selectReview(movieid);
				int total = reviewAllList.size();
				System.out.println("查出所有符合的评论数"+total);
				int totalPage=total%rows==0?(total/rows):((total/rows)+1);
				System.out.println("查出所有符合评论的形成的总页数"+totalPage);
				return totalPage;
			}
			//查询选定的电影id查出对应的用户id
			@Override
			public List<String> useridFromReview(String movieid) {
				return reviewMapper.useridFromReview(movieid);
			}
			//删除失效订单
			@Override
			public int deleteFailOrder(String id) {
				return ordersMapper.deleteFailOrder(id);
			}
			//查询失效座位id
			@Override
			public Orders selectFailSeat(String id) {
				return ordersMapper.selectFailSeat(id);
			}
			//删除失效座位
			@Override
			public int deleteFailSeat(Orders seatid) {
				return seatMapper.deleteFailSeat(seatid);
			}
			//查询用户选定的资讯内容
			@Override
			public News selectNewsInfo(String id) {
				return newsMapper.selectNewsInfo(id);
			}
			//插入评分
			@Override
			public int insertMark(Mark record) {
				return markMapper.insertMark(record);
			}
			@Override
			public List<Mark> selectMarkExist(Map<String,String> idMap) {
				return markMapper.selectMarkExist(idMap);
			}
			@Override
			public List<Mark> selectMarkAll() {
				return markMapper.selectMarkAll();
			}
			@Override
			public Mark selectMovieMark(String movieid) {
				return markMapper.selectMovieMark(movieid);
			}
			@Override
			public List<Movie> selectMark() {
				return movieMapper.selectMark();
			}
			//查询有此影院的影片id
			@Override
			public List<String> selectMovieForCinema(String cinemaid) {
				return cinemaPlanMapper.selectMovieForCinema(cinemaid);
			}
			//订单详情中的座位详情
			@Override
			public List<Map<String,String>> selectOrdersSeat(String ordersid) {
				return ordersMapper.selectOrdersSeat(ordersid);
			}
			@Override
			public int updateOrdersStatus(Orders record) {
				return ordersMapper.updateByPrimaryKeySelective(record);
			}
			//已存在座位
			@Override
			public List<String> selectSeatExist(Map<String, String> map) {
				return seatMapper.selectSeatExist(map);
			}
			
			
			
}