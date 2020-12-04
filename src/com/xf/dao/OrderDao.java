package com.xf.dao;

import java.util.List;

import com.xf.entity.Order;
import com.xf.entity.OrderDetails;

public interface OrderDao {
	int insertOrder(String username);

    Boolean insertOrderDetails(List<OrderDetails> orderDetailsList);

    List<Order> getOrderByUsername(String username);

    List<OrderDetails> getOrderDetailsByOrderId(List<Order> orderList);
}
