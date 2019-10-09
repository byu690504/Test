package com.zlk.orders.service;

import com.zlk.orders.entity.Orders;
import com.zlk.orders.entity.Pagination;

import java.util.List;

public interface OrdersService {

    /**
     * 多表分页查询
     * @param pagination
     * @return
     */
    List<Orders> findOrdersByLimit(Pagination pagination);

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    Integer findCountByOrderId(Pagination pagination);

    /**
     * 通过ID删除数据
     * @param orderId
     * @return
     */
    Integer deleteOrderByOrderId(String orderId);

    /**
     * 增加数据
     * @param orders
     * @return
     */
    Integer insertOrder(Orders orders);

    /**
     * 通过ID修改数据
     * @param orders
     * @return
     */
    Integer updateOrderByOrderId(Orders orders);
}
