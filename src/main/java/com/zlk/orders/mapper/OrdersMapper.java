package com.zlk.orders.mapper;

import com.zlk.orders.entity.Orders;
import com.zlk.orders.entity.Pagination;

import java.util.List;

public interface OrdersMapper {

    List<Orders> findOrdersByLimit(Pagination pagination);

    Integer findCountByOrderId(Pagination pagination);

    Integer deleteOrderByOrderId(String orderId);

    Integer insertOrder(Orders orders);

    Integer updateOrderByOrderId(Orders orders);
}
