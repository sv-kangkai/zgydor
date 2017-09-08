package com.sv.zgydor.service.impl;

import com.sv.zgydor.dao.TCenunitTreeDAO;
import com.sv.zgydor.pojo.TCenunitTreeEntity;
import com.sv.zgydor.service.TCenunitTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class TCenunitTreeServiceImpl implements TCenunitTreeService {

    @Autowired
    private TCenunitTreeDAO tCenunitTreeDAO;

    @Transactional
    public List<TCenunitTreeEntity> findInitData() {
        return this.tCenunitTreeDAO.findInitData();
    }

    @Transactional
    public List<TCenunitTreeEntity> findRegionByParCode(String parCode) {
        return null;
    }
}
