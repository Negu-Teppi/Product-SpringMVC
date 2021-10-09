package com.manhlee.productmvc.entities;

import com.manhlee.productmvc.enums.Size;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "size")
public class SizeEntity implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    private Size sizeE;

    @OneToMany(mappedBy = "size")
    private List<ProductDetailEntity> productDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Size getSizeE() {
        return sizeE;
    }

    public void setSizeE(Size sizeE) {
        this.sizeE = sizeE;
    }

    public List<ProductDetailEntity> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<ProductDetailEntity> productDetails) {
        this.productDetails = productDetails;
    }
    @Override
    public String toString() {
        return "SizeEntity{" +
                "id=" + id +
                ", sizeE=" + sizeE +
                '}';
    }
}
