package com.manhlee.productmvc.service;

import com.manhlee.productmvc.entities.SizeEntity;
import com.manhlee.productmvc.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SizeService {

    @Autowired
    private SizeRepository sizeRepository;

    public List<SizeEntity> getSizes() {
        return (List<SizeEntity>) sizeRepository.findAll();
    }

    public SizeEntity findSizeById(int id) {
        Optional<SizeEntity> optionalC = sizeRepository.findById(id);

        if (optionalC.isPresent()) {
            return optionalC.get();
        }
        return null;
    }

    public List<SizeEntity> findSizeByName(String name){
        return sizeRepository.findBySizeE(name);
    }
}
