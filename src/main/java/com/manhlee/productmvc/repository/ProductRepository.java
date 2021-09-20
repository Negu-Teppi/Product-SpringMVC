package com.manhlee.productmvc.repository;

import com.manhlee.productmvc.entities.ProductEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    List<ProductEntity> findAllByOrderByCreateDateDesc();
}
