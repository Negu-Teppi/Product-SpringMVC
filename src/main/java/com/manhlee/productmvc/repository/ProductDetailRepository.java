package com.manhlee.productmvc.repository;

import com.manhlee.productmvc.entities.ProductDetailEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailRepository extends CrudRepository<ProductDetailEntity, Integer> {
    @Query(value = "Select * from product_detail pd\n" +
            "join product p on pd.product_id=p.id\n" +
            "join size s on pd.size_id = s.id\n" +
            "where pd.product_id=?1\n" +
            "group by pd.size_id", nativeQuery = true)
    List<ProductDetailEntity> getProductDetailByProductIdGroupBySizeId(int productId);

    @Query(value = "Select * from product_detail pd\n" +
            "join product p on pd.product_id=p.id\n" +
            "join size s on pd.size_id = s.id\n" +
            "join color c on pd.color_id=c.id\n" +
            "where pd.product_id=?1 and s.sizeE=?2\n" +
            "group by pd.color_id", nativeQuery = true)
    List<ProductDetailEntity> getColorsProductDetailByProducIdSizeNameGroupByColorId(int productId, String sizeName);

    @Query(value = "Select * from product_detail pd\n" +
            "join product p on pd.product_id=p.id\n" +
            "join size s on pd.size_id = s.id\n" +
            "join color c on pd.color_id=c.id\n" +
            "where pd.product_id=?1 and s.sizeE=?2 and c.colorE=?3", nativeQuery = true)
    ProductDetailEntity getPriceByProductIdSizeNameColorName(int productId, String sizeName, String colorName);
}
