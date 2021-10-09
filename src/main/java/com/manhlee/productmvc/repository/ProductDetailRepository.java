package com.manhlee.productmvc.repository;

import com.manhlee.productmvc.entities.ProductDetailEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailRepository extends CrudRepository<ProductDetailEntity, Integer> {
    List<ProductDetailEntity> findByProduct_Id(int id);
}
