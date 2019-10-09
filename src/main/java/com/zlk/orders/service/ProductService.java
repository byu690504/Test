package com.zlk.orders.service;

import com.zlk.orders.entity.Pagination;
import com.zlk.orders.entity.Product;

import java.util.List;

public interface ProductService {

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    List<Product> findProductByLimit(Pagination pagination);

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    Integer findCountByProductId(Pagination pagination);

    /**
     * 通过ID删除数据
     * @param productId
     * @return
     */
    Integer deleteProductByProductId(Integer productId);

    /**
     * 增加数据
     * @param product
     * @return
     */
    Integer insertProduct(Product product);

    /**
     * 通过ID修改数据
     * @param product
     * @return
     */
    Integer updateProductByProductId(Product product);

    /**
     * 通过ID修改富文本编辑文档
     * @param product
     * @return
     */
    Integer updateProOfTextAreaByProId(Product product);
}
