package com.lyf.filmbase.mapper;

import java.util.List;
import java.util.Map;

import com.lyf.filmbase.entity.Orders;

public interface OrdersMapper {
	Orders selectFailSeat(String id);//查询失效座位id
	int deleteFailOrder(String id); //删除失效订单
	/*String selectWatchidByUserid(String id); //查询登录用户的查询订单封装成bean获取watchid 
*/	
	List<Map<String,String>> selectOrdersSeat(String ordersid);//订单详情中的座位详情
	Map<String,Object> selectOrdersByOrdersid(String ordersid);//查询订单详情
	List<String> selectAllOrdersByUserid(String id);//查询所有订单详情
	
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}