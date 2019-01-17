package com.lyf.filmbase.mapper;


import java.util.List;
import java.util.Map;

import com.lyf.filmbase.entity.Orders;
import com.lyf.filmbase.entity.Seat;

public interface SeatMapper {
	List<String> selectSeatExist(Map<String,String> map);//已存在座位
	int deleteFailSeat(Orders seatid); //删除失效座位
	List<Seat> selectedSeat(String seatid);//查询已选座位
	List<Seat> selectSeat(String String); //查询选座信息
	int updateSeatyBySeatId(String String); //根据seatx更新seaty
    int insert(Seat record);
    int insertSelective(Map<String,String> map); //插入座位
}