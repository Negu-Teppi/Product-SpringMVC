package com.manhlee.productmvc.controller;

import com.manhlee.productmvc.entities.ProductDetailEntity;
import com.manhlee.productmvc.entities.ProductEntity;
import com.manhlee.productmvc.service.ColorService;
import com.manhlee.productmvc.service.ProductDetailService;
import com.manhlee.productmvc.service.ProductService;
import com.manhlee.productmvc.service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDetailService productDetailService;

    @RequestMapping("/order/{id}")
    public String order(Model model, @PathVariable("id") int productId, HttpSession session) {

        List<ProductDetailEntity> productDetailsOfSize = productDetailService.getByProductIdGroupBySize(productId);
        String sizeName = productDetailsOfSize.get(0).getSize().getSizeE().name();

        List<ProductDetailEntity> productDetail_ColorOfSize = productDetailService.getByProductIdSizeGroupByColor(productId, sizeName);
        String colorName = productDetail_ColorOfSize.get(0).getColor().getColorE().name();

        ProductDetailEntity productDetail_ColorAndSize = productDetailService.getByProductIdSizeColor(productId, sizeName, colorName);


        session.setAttribute("product", productService.getProduct(productId));
        session.setAttribute("productDetailsOfSize", productDetailsOfSize);

        model.addAttribute("sizeName", sizeName);
        model.addAttribute("productDetail_ColorOfSize", productDetail_ColorOfSize);
        model.addAttribute("productDetail", new ProductDetailEntity());
        model.addAttribute("action", "addCart");
        return "order-form";
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String getColor(
//            Model model, @ModelAttribute("productDetail") ProductDetailEntity productDetail,
//                           @SessionAttribute("product") ProductEntity product,
//                           @SessionAttribute("addCard") List<ProductDetailEntity> addCards,
                           @RequestParam("sizeId") int sizeId) {
        System.out.println(sizeId);
        return "order-form";
//        if (productDetail.getQuantityPurchased() == 0) {
//            String sizeName = productDetail.getSize().getSizeE().name();
//            String colorName = null;
//            List<ProductDetailEntity> productDetail_ColorOfSize =
//                    productDetailService.getByProductIdSizeGroupByColor(product.getId(), sizeName);
//            for (ProductDetailEntity productDetail1 : productDetail_ColorOfSize) {
//                if (productDetail1.getColor().getColorE().name().equals(productDetail.getColor().getColorE().name())) {
//                    colorName = productDetail.getColor().getColorE().name();
//                    break;
//                } else {
//                    colorName= productDetail_ColorOfSize.get(0).getColor().getColorE().name();
//                }
//            }
//
//            ProductDetailEntity productDetail_ColorAndSize =
//                    productDetailService.getByProductIdSizeColor(product.getId(),sizeName,colorName);
//            model.addAttribute("productDetail_ColorOfSize", productDetail_ColorOfSize);
//            model.addAttribute("productDetail_ColorAndSize", productDetail_ColorAndSize);
//            model.addAttribute("size", sizeName);
//            model.addAttribute("colorName", colorName);
//            model.addAttribute("productDetail", new ProductDetailEntity());
//            return "order-form";
//        } else {
//            addCards.add(productDetail);
//            return "redirect:/card-form";
//        }
    }

    @RequestMapping(value = "/size", method = RequestMethod.GET)
    public String getColor(Model model, @RequestParam("size") int sizeId){
        System.out.println(sizeId);
        return "order-form";
    }
}
