package com.manhlee.productmvc.controller;

import com.manhlee.productmvc.entities.ImageEntity;
import com.manhlee.productmvc.entities.ProductEntity;
import com.manhlee.productmvc.service.CategoryService;
import com.manhlee.productmvc.service.ImageService;
import com.manhlee.productmvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = {"/home", "/products", "/"}, method = RequestMethod.GET)
    public String getAccounts(Model model, HttpServletRequest request) {
        model.addAttribute("products", productService.getProductsSortCreateDate());
        model.addAttribute("images", imageService.getImages());
        return "products";
    }

    @RequestMapping("/add-products")
    public String addProduct(Model model) {
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("action", "add");
        return "product-form";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String result(Model model, @ModelAttribute("product") ProductEntity product) {

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
        return "redirect:/products";
    }
}
