package com.zlk.orders.controller;

import com.zlk.orders.entity.Orders;
import com.zlk.orders.entity.Pagination;
import com.zlk.orders.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/orders")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @RequestMapping(value = "/toOrdersList")
    public String toList() throws Exception{
        return "ordersList";
    }

    @RequestMapping(value = "/ordersList")
    @ResponseBody
    public Map<String, Object> list(Pagination pagination) throws Exception{
        List<Orders> list=ordersService.findOrdersByLimit(pagination);
        Integer count=ordersService.findCountByOrderId(pagination);
        Map<String, Object> map=new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(String orderId) throws Exception{
        Integer flag=ordersService.deleteOrderByOrderId(orderId);
        Map<String, Object> map=new HashMap<>();
        if(flag == 1){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/insert")
    @ResponseBody
    public ModelAndView insert(Orders orders) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=ordersService.insertOrder(orders);
        if(flag == 1){
            mv.addObject("msg","新增成功");
            mv.setViewName("ordersList");
            return mv;
        }else {
            return null;
        }
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ModelAndView update(Orders orders) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=ordersService.updateOrderByOrderId(orders);
        if(flag == 1){
            mv.addObject("msg","修改成功");
            mv.setViewName("ordersList");
            return mv;
        }else {
            return null;
        }
    }
}
