package com.sv.zgydor.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDAOImpl {

    @Autowired
    protected SessionFactory sessionFactory;
}
