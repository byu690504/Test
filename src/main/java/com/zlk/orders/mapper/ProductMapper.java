package com.zlk.orders.mapper;

import com.zlk.orders.entity.Pagination;
import com.zlk.orders.entity.Product;

import java.util.List;

public interface ProductMapper {

    List<Product> findProductByLimit(Pagination pagination);

    Integer findCountByProductId(Pagination pagination);

    Integer deleteProductByProductId(Integer productId);

    Integer insertProduct(Product product);

    Integer updateProductByProductId(Product product);

    Integer updateProOfTextAreaByProId(Product product);
}
