package com.zlk.orders.mapper;

import com.zlk.orders.entity.Customer;
import com.zlk.orders.entity.Pagination;

import java.util.List;

public interface CustomerMapper {

    List<Customer> findCustomerByLimit(Pagination pagination);

    Integer findCountByCustomId(Pagination pagination);

    Integer deleteCustomerByCustomId(String customId);

    Integer insertCustomer(Customer customer);

    Integer updateCustomerByCustomId(Customer customer);
}
