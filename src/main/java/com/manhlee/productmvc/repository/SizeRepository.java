package com.manhlee.productmvc.repository;

import com.manhlee.productmvc.entities.SizeEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SizeRepository extends CrudRepository<SizeEntity, Integer> {
    @Query(value = "select * from size s where s.sizeE = ?1",nativeQuery = true)
    List<SizeEntity> findBySizeE(String name);
}
