package com.zlk.orders.controller;

import com.zlk.orders.entity.Customer;
import com.zlk.orders.entity.Pagination;
import com.zlk.orders.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/toCustomerList")
    public String toList() throws Exception{
        return "customerList";
    }

    @RequestMapping(value = "/customerList")
    @ResponseBody
    public Map<String, Object> list(Pagination pagination) throws Exception{
        List<Customer> list=customerService.findCustomerByLimit(pagination);
        Integer count=customerService.findCountByCustomId(pagination);
        Map<String, Object> map=new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(String customId) throws Exception{
        Integer flag=customerService.deleteCustomerByCustomId(customId);
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
    public ModelAndView insert(Customer customer) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=customerService.insertCustomer(customer);
        if(flag == 1){
            mv.addObject("msg","新增成功");
            mv.setViewName("customerList");
            return mv;
        }else {
            return null;
        }
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ModelAndView update(Customer customer) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=customerService.updateCustomerByCustomId(customer);
        if(flag == 1){
            mv.addObject("msg","修改成功");
            mv.setViewName("customerList");
            return mv;
        }else {
            return null;
        }
    }
}
