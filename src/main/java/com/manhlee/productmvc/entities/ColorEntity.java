package com.manhlee.productmvc.entities;

import com.manhlee.productmvc.enums.Color;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "color")
public class ColorEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    private Color colorE;

    @OneToMany(mappedBy = "color", cascade = CascadeType.ALL)
    private List<ProductDetailEntity> productDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Color getColorE() {
        return colorE;
    }

    public void setColorE(Color colorE) {
        this.colorE = colorE;
    }

    public List<ProductDetailEntity> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<ProductDetailEntity> productDetails) {
        this.productDetails = productDetails;
    }

    @Override
    public String toString() {
        return "ColorEntity{" +
                "id=" + id +
                ", colorE=" + colorE +
                '}';
    }
}
