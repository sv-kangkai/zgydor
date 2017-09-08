package com.sv.zgydor.dao.impl;

import com.sv.zgydor.dao.TCenunitTreeDAO;
import com.sv.zgydor.pojo.TCenunitTreeEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TCenunitTreeDAOImpl extends BaseDAOImpl implements TCenunitTreeDAO {
    @Override
    public List<TCenunitTreeEntity> findInitData() {
        String hql = "from TCenunitTreeEntity t where (t.regionlevel = '1' or t.regionlevel = '2') and t.subcode <> '0' order by t.rgid asc";
        return this.sessionFactory.openSession().createQuery(hql).list();
    }
}
