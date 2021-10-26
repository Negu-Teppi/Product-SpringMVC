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

    public List<ProductDetailEntity> getByProductIdGroupBySize(int productId){
        return productDetailRepository.getProductDetailByProductIdGroupBySizeId(productId);
    }

    public List<ProductDetailEntity> getByProductIdSizeGroupByColor(int productId, String sizeName){
        return productDetailRepository.getColorsProductDetailByProducIdSizeNameGroupByColorId(productId, sizeName);
    }

    public ProductDetailEntity getByProductIdSizeColor(int productId, String sizeName, String colorName){
        return productDetailRepository.getPriceByProductIdSizeNameColorName(productId, sizeName, sizeName);
    }
}
