package com.zlk.orders.service;

import com.zlk.orders.entity.Customer;
import com.zlk.orders.entity.Pagination;

import java.util.List;

public interface CustomerService {

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    List<Customer> findCustomerByLimit(Pagination pagination);

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    Integer findCountByCustomId(Pagination pagination);

    /**
     * 通过ID删除数据
     * @param customId
     * @return
     */
    Integer deleteCustomerByCustomId(String customId);

    /**
     * 增加数据
     * @param customer
     * @return
     */
    Integer insertCustomer(Customer customer);

    /**
     * 通过ID修改数据
     * @param customer
     * @return
     */
    Integer updateCustomerByCustomId(Customer customer);
}
