package com.sv.zgydor.service;

import com.sv.zgydor.pojo.TCenunitTreeEntity;
import org.omg.CORBA.TCKind;

import java.util.List;

public interface TCenunitTreeService {
    List<TCenunitTreeEntity> findInitData();

    /**
     * 指定一个code，查询所有在这个code下的行政区划
     * @param parCode 指定的code
     * @return 所有在指定code下的行政区划
     */
    List<TCenunitTreeEntity> findRegionByParCode(String parCode);
}
