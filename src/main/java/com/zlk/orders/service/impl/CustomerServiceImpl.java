package com.zlk.orders.service.impl;

import com.zlk.orders.entity.Customer;
import com.zlk.orders.entity.Pagination;
import com.zlk.orders.mapper.CustomerMapper;
import com.zlk.orders.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    @Override
    public List<Customer> findCustomerByLimit(Pagination pagination) {
        Integer page=pagination.getPage();
        Integer limit=pagination.getLimit();
        Integer startPage=(page-1)*limit;
        pagination.setStartPage(startPage);
        List<Customer> customerList=customerMapper.findCustomerByLimit(pagination);
        return customerList;
    }

    @Override
    public Integer findCountByCustomId(Pagination pagination) {
        return customerMapper.findCountByCustomId(pagination);
    }

    @Override
    public Integer deleteCustomerByCustomId(String customId) {
        return customerMapper.deleteCustomerByCustomId(customId);
    }

    @Override
    public Integer insertCustomer(Customer customer) {
        return customerMapper.insertCustomer(customer);
    }

    @Override
    public Integer updateCustomerByCustomId(Customer customer) {
        return customerMapper.updateCustomerByCustomId(customer);
    }
}
