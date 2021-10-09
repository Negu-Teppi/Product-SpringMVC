package com.manhlee.productmvc.service;

import com.manhlee.productmvc.entities.ProductDetailEntity;
import com.manhlee.productmvc.repository.ProductDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetailService {
    @Autowired
    private ProductDetailRepository productDetailRepository;

    public void saveProductDetail(ProductDetailEntity productDetail){
        productDetailRepository.save(productDetail);
    }

    public List<ProductDetailEntity> getProductDetailByProductId(int id){
        return productDetailRepository.findByProduct_Id(id);
    }
}
