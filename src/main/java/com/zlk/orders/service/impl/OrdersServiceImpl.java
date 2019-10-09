package com.zlk.orders.service.impl;

import com.zlk.orders.entity.Orders;
import com.zlk.orders.entity.Pagination;
import com.zlk.orders.mapper.OrdersMapper;
import com.zlk.orders.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Override
    public List<Orders> findOrdersByLimit(Pagination pagination) {
        Integer page=pagination.getPage();
        Integer limit=pagination.getLimit();
        Integer startPage=(page-1)*limit;
        pagination.setStartPage(startPage);
        List<Orders> ordersList=ordersMapper.findOrdersByLimit(pagination);
        return ordersList;
    }

    @Override
    public Integer findCountByOrderId(Pagination pagination) {
        return ordersMapper.findCountByOrderId(pagination);
    }

    @Override
    public Integer deleteOrderByOrderId(String orderId) {
        return ordersMapper.deleteOrderByOrderId(orderId);
    }

    @Override
    public Integer insertOrder(Orders orders) {
        return ordersMapper.insertOrder(orders);
    }

    @Override
    public Integer updateOrderByOrderId(Orders orders) {
        return ordersMapper.updateOrderByOrderId(orders);
    }
}
