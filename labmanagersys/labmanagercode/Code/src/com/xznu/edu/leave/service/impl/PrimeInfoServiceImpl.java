package com.xznu.edu.leave.service.impl;

import com.xznu.edu.leave.dao.PrimeInfoDao;
import com.xznu.edu.leave.model.PrimeInfo;
import com.xznu.edu.leave.service.PrimeInfoService;
import com.xznu.edu.leave.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PrimeInfoServiceImpl extends BaseServiceImpl<PrimeInfo> implements PrimeInfoService {

    @Autowired
    private PrimeInfoDao dao;

    @Override
    public Pager<PrimeInfo> getList(PrimeInfo bean){
        return dao.getList(bean);}

    @Override
    public PrimeInfo findById(Integer id) {
        return dao.findById(id);
    }


}
