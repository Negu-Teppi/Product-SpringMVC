package com.manhlee.productmvc.service;

import com.manhlee.productmvc.entities.ImageEntity;
import com.manhlee.productmvc.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<ImageEntity> getImages(){
        return (List<ImageEntity>) imageRepository.findAll();
    }

    public void save(ImageEntity image){
        imageRepository.save(image);
    }
}
