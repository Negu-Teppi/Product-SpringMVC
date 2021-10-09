package com.manhlee.productmvc.repository;

import com.manhlee.productmvc.entities.ColorEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ColorRepository extends CrudRepository<ColorEntity, Integer> {

    @Query(value = "select * from color c where c.colorE = ?1",nativeQuery = true)
    List<ColorEntity> findByColorE(String name);
}
