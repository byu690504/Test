package com.zlk.orders.service.impl;

import com.zlk.orders.entity.Pagination;
import com.zlk.orders.entity.Product;
import com.zlk.orders.mapper.ProductMapper;
import com.zlk.orders.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public List<Product> findProductByLimit(Pagination pagination) {
        Integer page=pagination.getPage();
        Integer limit=pagination.getLimit();
        Integer startPage=(page-1)*limit;
        pagination.setStartPage(startPage);
        List<Product> productList=productMapper.findProductByLimit(pagination);
        return productList;
    }

    @Override
    public Integer findCountByProductId(Pagination pagination) {
        return productMapper.findCountByProductId(pagination);
    }

    @Override
    public Integer deleteProductByProductId(Integer productId) {
        return productMapper.deleteProductByProductId(productId);
    }

    @Override
    public Integer insertProduct(Product product) {
        return productMapper.insertProduct(product);
    }

    @Override
    public Integer updateProductByProductId(Product product) {
        return productMapper.updateProductByProductId(product);
    }

    @Override
    public Integer updateProOfTextAreaByProId(Product product) {
        return productMapper.updateProOfTextAreaByProId(product);
    }
}
