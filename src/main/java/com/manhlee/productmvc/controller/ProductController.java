package com.manhlee.productmvc.controller;

import com.manhlee.productmvc.entities.*;
import com.manhlee.productmvc.enums.Color;
import com.manhlee.productmvc.enums.Size;
import com.manhlee.productmvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private ProductDetailService productDetailService;

    @RequestMapping(value = {"/home", "/products", "/"}, method = RequestMethod.GET)
    public String getAccounts(Model model) {
        model.addAttribute("products", productService.getProductsSortCreateDate());
        model.addAttribute("images", imageService.getImages());
        return "products";

    }

    @RequestMapping("/add-products")
    public String addProduct(Model model) {
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("action", "add");
        return "product-add-form";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String result(Model model, @ModelAttribute("product") ProductEntity product,
                         HttpSession session) {

        List<MultipartFile> files = product.getFiles();
        Date date = new Date();

        List<ImageEntity> images = new ArrayList<>();
        if (files != null && files.size() > 0) {
            for (MultipartFile file : files) {
                ImageEntity image = new ImageEntity();
                try {
                    image.setName(file.getOriginalFilename());
                    images.add(image);
                    String fileName = file.getOriginalFilename();
                    File imageFile = new File(servletContext.getRealPath("/resources/images/"), fileName);
                    file.transferTo(imageFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                image.setProduct(product);
            }

            product.setCreateDate(date);
            product.setImages(images);
            productService.save(product);
        }
        ProductDetailEntity productDetail = new ProductDetailEntity();
        productDetail.setProduct(product);

        model.addAttribute("product-detail", productDetail);
        session.setAttribute("product", product);
        session.setAttribute("productDetails", new ArrayList<ProductDetailEntity>());

        model.addAttribute("sizes", Size.values());
        model.addAttribute("colors", Color.values());
        return "product-detail-form";
    }

    @RequestMapping(value = {"/add-products-detail"}, method = RequestMethod.POST)
    public String viewProductDetails(Model model, HttpSession session,
                                     @ModelAttribute("product-detail") ProductDetailEntity productDetail,
                                     @SessionAttribute("productDetails") List<ProductDetailEntity> productDetails,
                                     @SessionAttribute("product") ProductEntity product) {

        for (ProductDetailEntity productDetail1 : productDetails) {
            if (productDetail1.getColor().getColorE().equals(productDetail.getColor().getColorE())
                    && productDetail1.getSize().getSizeE().equals(productDetail.getSize().getSizeE())) {
                model.addAttribute("produc_detail", new ProductDetailEntity());
                model.addAttribute("sizes", Size.values());
                model.addAttribute("colors", Color.values());
                model.addAttribute("exists", "exists");
                return "product-detail-form";
            }
        }

        productDetail.setProduct(product);
        productDetails.add(productDetail);
        session.setAttribute("productDetails", productDetails);
        model.addAttribute("sizes", Size.values());
        model.addAttribute("colors", Color.values());
        return "product-detail-form";
    }

    @RequestMapping(value = {"/delete-productDetail/{index}"}, method = RequestMethod.GET)
    public String deleteProductDetail(Model model, @PathVariable("index") int index,
                                      HttpServletRequest request){
        List<ProductDetailEntity> producDetails =
                (List<ProductDetailEntity>) request.getSession().getAttribute("productDetails");
        producDetails.remove(index);
        request.getSession().setAttribute("productDetails", producDetails);
        model.addAttribute("productDetail", new ProductDetailEntity());
        model.addAttribute("sizes", Size.values());
        model.addAttribute("colors", Color.values());
        return "product-detail-form";
    }

    @RequestMapping(value = {"/save-productDetails"}, method = RequestMethod.GET)
    public String saveProductDetail(HttpServletRequest request) {
        List<ProductDetailEntity> productDetails = (List<ProductDetailEntity>) request.getSession().getAttribute("productDetails");
        for (ProductDetailEntity productDetail: productDetails) {
            ColorEntity color = colorService.findColorByName(productDetail.getColor().getColorE().name()).get(0);
            productDetail.setColor(color);
            SizeEntity size = sizeService.findSizeByName(productDetail.getSize().getSizeE().name()).get(0);
            productDetail.setSize(size);
            productDetailService.saveProductDetail(productDetail);
        }
        return "redirect:/home";
    }


}
