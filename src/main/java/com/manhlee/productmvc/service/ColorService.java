package com.manhlee.productmvc.service;

import com.manhlee.productmvc.entities.ColorEntity;
import com.manhlee.productmvc.repository.ColorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ColorService {

    @Autowired
    private ColorRepository colorRepository;

    public List<ColorEntity> getColors() {
        return (List<ColorEntity>) colorRepository.findAll();
    }

    public List<ColorEntity> findColorByName(String name) {
        return colorRepository.findByColorE(name);
    }
    public ColorEntity findColorById(int id) {
        Optional<ColorEntity> optionalC = colorRepository.findById(id);

        if (optionalC.isPresent()) {
            return optionalC.get();
        }
        return null;
    }
}
